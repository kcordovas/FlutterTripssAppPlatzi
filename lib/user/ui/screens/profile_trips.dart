import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_tripss_app/place/ui/widgets/user_info_card.dart';
import 'package:platzi_tripss_app/user/bloc/bloc_user.dart';
import 'package:platzi_tripss_app/user/model/user.dart';
import 'package:platzi_tripss_app/widgets/gradient_back.dart';
import 'package:platzi_tripss_app/user/ui/screens/card_image_list_with_details_profile.dart';
import 'package:platzi_tripss_app/user/ui/widgets/list_icon_button_profile.dart';

class ProfileTrips extends StatelessWidget {
  static final userBlocProvider = BlocProvider(
    bloc: UserBloc(),
    child: ProfileTrips(),
  );

  late UserBloc _userBloc;
  late UserTrips _userTrips;

  ProfileTrips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context);
    return Stack(
      children: [
        GradientBack("Profile", 300.0),
        CardImageListWithDetailsProfile(),
        Column(
          children: [
            Container(
              height: 100.0,
            ),
            streamProfileWidget(),
            ListIconHorizontalProfile(),
          ],
        ),
      ],
    );
  }

  Widget streamProfileWidget() {
    return StreamBuilder(
      stream: _userBloc.authStatus,
      builder: (context, asyncSnapshot) {
        switch (asyncSnapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.done:
            return _profileWidget(asyncSnapshot);
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget _profileWidget(AsyncSnapshot asyncSnapshot) {
    if (!asyncSnapshot.hasData || asyncSnapshot.hasError) {
      if (_userBloc.currentUser != null) {
        final tempUser = _userBloc.currentUser!;
        _userTrips = UserTrips(
            name: tempUser.displayName!,
            email: tempUser.email!,
            photoUrl: tempUser.photoURL!);
        return UserInfoCard(_userTrips);
      }
      return Container(
        margin: const EdgeInsets.only(
          top: 20.0,
          left: 20.0,
        ),
        child: Column(
          children: const [
            CircularProgressIndicator(),
            Text("Not data. Please, make a login"),
          ],
        ),
      );
    } else {
      _userTrips = UserTrips(
          name: asyncSnapshot.data.displayName,
          email: asyncSnapshot.data.email,
          photoUrl: asyncSnapshot.data.photoURL);
      return UserInfoCard(_userTrips);
    }
  }
}

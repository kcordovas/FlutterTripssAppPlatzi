import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_tripss_app/user/bloc/bloc_user.dart';
import 'package:platzi_tripss_app/user/model/user.dart';
import 'package:platzi_tripss_app/user/ui/screens/card_image_with_details_profile.dart';

class CardImageListWithDetailsProfile extends StatelessWidget {
  late UserBloc _userBloc;
  late UserTrips _userTrips;
  CardImageListWithDetailsProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context);
    var streamPlaces = _userBloc.placeList();
    if (_userBloc.currentUser() != null) {
      final tempUser = _userBloc.currentUser();
      streamPlaces = _userBloc.placeListByUserId(tempUser.uid);
    }
    final listPlaces = StreamBuilder(
      stream: streamPlaces,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.done:
            final listPlace =
                _userBloc.buildPlacesOfSnapshot(snapshot.data!.docs);
            return ListView.builder(
                itemCount: listPlace.length,
                itemBuilder: (context, index) {
                  final place = listPlace[index];
                  if (index == listPlace.length - 1) {
                    return Container(
                        margin: const EdgeInsets.only(bottom: 30.0),
                        child: CardImageWithDetails(place: place));
                  }
                  return CardImageWithDetails(place: place);
                });
          default:
            return const CircularProgressIndicator();
        }
      },
    );
    return Container(
      margin: const EdgeInsets.only(top: 300.0),
      child: listPlaces,
    );
  }
}

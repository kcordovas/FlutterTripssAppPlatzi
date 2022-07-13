import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_tripss_app/place/bloc/bloc_place.dart';
import 'package:platzi_tripss_app/place/ui/widgets/review_list.dart';

import '../widgets/description_place.dart';
import 'header_appbar.dart';

class HomeTrips extends StatelessWidget {
  static const routeName = '/home_trips_screen';
  static final userBlocProvider = BlocProvider(
    bloc: PlaceBloc(),
    child: const HomeTrips(),
  );
  final descriptionDummy =
      "Lorem ipsum odor amet, consectetuer adipiscing elit. Lectus felis penatibus. Taciti nam at nam. Vulputate rutrum mollis. Quam orci magna dictumst.";
  const HomeTrips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView(
        children: [
          DescriptionPlace("Lorem ipsum", descriptionDummy, 5),
          ReviewList()
        ],
      ),
      HeaderAppBar(),
    ]);
  }
}

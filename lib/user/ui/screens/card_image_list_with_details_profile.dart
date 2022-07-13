import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_tripss_app/user/bloc/bloc_user.dart';
import 'package:platzi_tripss_app/user/ui/screens/card_image_with_details_profile.dart';

class CardImageListWithDetailsProfile extends StatelessWidget {
  late UserBloc _userBloc;
  CardImageListWithDetailsProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of(context);
    final listPlaces = StreamBuilder(
      stream: _userBloc.placeList(),
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
                  return CardImageWithDetails(place: place);
                });
          default:
            return const CircularProgressIndicator();
        }
      },
    );
    return Container(
      margin: EdgeInsets.only(top: 300.0),
      child: listPlaces,
    );
  }
}

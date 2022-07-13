import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_tripss_app/place/bloc/bloc_place.dart';
import 'package:platzi_tripss_app/place/ui/widgets/card_image.dart';

class CardImageList extends StatelessWidget {
  late PlaceBloc _placeBloc;
  @override
  Widget build(BuildContext context) {
    _placeBloc = BlocProvider.of(context);
    final listPlaces = StreamBuilder(
      stream: _placeBloc.placeList(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.done:
            final listPlace =
                _placeBloc.buildPlacesOfSnapshot(snapshot.data!.docs);
            return ListView.builder(
                padding: const EdgeInsets.all(25.0),
                scrollDirection: Axis.horizontal,
                itemCount: listPlace.length,
                itemBuilder: (context, index) {
                  final place = listPlace[index];
                  return CardImage(
                      pathImage: place.uriImage!,
                      widthImage: 300.0,
                      heightImage: 250.0,
                      isWithIcon: true,
                      iconData: Icons.favorite_outline,
                      imageType: EImageType.Neetwork,
                      marginHorizontal: 20.0,
                      marginTop: 80.0,
                      marginBottom: 20.0,
                      onPressedFabIcon: () {},
                      heroTag: place.id);
                });
          default:
            return const CircularProgressIndicator();
        }
      },
    );
    return Container(height: 350.0, child: listPlaces);
  }
}

import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/place/ui/widgets/review.dart';
import 'package:platzi_tripss_app/user/model/user.dart';

class UserInfoCard extends ReviewCard {
  final UserTrips _userTrips;

  UserInfoCard(this._userTrips, {Key? key})
      : super(
            titleCardText: _userTrips.name,
            pathImage: _userTrips.photoUrl,
            detailsCardText: _userTrips.email,
            key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        photoCircle(urlPath: _userTrips.photoUrl, isAssetImage: false),
        groupCardInformation(_userTrips.name, _userTrips.email, "")
      ],
    );
  }

  @override
  bool get haveAdditionalInfo => false;
}

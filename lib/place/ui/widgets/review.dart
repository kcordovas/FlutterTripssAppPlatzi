import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  var pathImage = "assets/london.png";
  var titleCardText = "Kevin";
  var detailsCardText = "1 review 5 photos";
  var additionalCardText = "This is amazing place";

  bool haveAdditionalInfo = true;

  ReviewCard(
      {Key? key,
      required this.pathImage,
      required this.titleCardText,
      required this.detailsCardText,
      this.additionalCardText = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        photoCircle(urlPath: pathImage, isAssetImage: true),
        groupCardInformation(titleCardText, detailsCardText, additionalCardText)
      ],
    );
  }

  Widget photoCircle({required String urlPath, bool isAssetImage = false}) {
    final widgetImage =
        isAssetImage ? AssetImage(urlPath) : NetworkImage(urlPath);
    return Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
      ),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: widgetImage as ImageProvider, fit: BoxFit.cover),
      ),
    );
  }

  Widget titleCard(String title) => Container(
        margin: const EdgeInsets.only(left: 20.0),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 17.0,
            fontFamily: "Lato",
          ),
        ),
      );

  Widget detailCard(String detail) => Container(
        margin: const EdgeInsets.only(left: 20.0),
        child: Text(
          detail,
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontSize: 13.0, fontFamily: "Lato", color: Color(0xFFa3a5a7)),
        ),
      );

  Widget additionalInfoCard(String additionalInfo) => Container(
        margin: const EdgeInsets.only(left: 20.0),
        child: Text(
          additionalInfo,
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontSize: 13.0, fontFamily: "Lato", fontWeight: FontWeight.w900),
        ),
      );

  Widget groupCardInformation(
          String title, String detail, String additionalInfo) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleCard(title),
          detailCard(detail),
          (haveAdditionalInfo)
              ? additionalInfoCard(additionalInfo)
              : Container()
        ],
      );
}

import 'package:flutter/material.dart';
import 'package:travel_buddy/models/post.dart';
import 'package:travel_buddy/utils/colors.dart';
import 'package:dotted_line/dotted_line.dart';

class RoutesListCard extends StatelessWidget {
  final Post post;
  const RoutesListCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.height * 0.01),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.025, vertical: size.height * 0.01),
      height: size.height * 0.21,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            offset: Offset(1, 1),
            blurRadius: 8,
            color: Color.fromRGBO(0, 0, 0, 0.16),
          )
        ],
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              txtTile(size, post.origin, "assets/ic_source.png"),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.07),
                child: SizedBox(
                  height: size.height * 0.02,
                  child: const DottedLine(
                    direction: Axis.vertical,
                    lineLength: double.infinity,
                    lineThickness: 2,
                    dashColor: AppColors.greyColor,
                  ),
                ),
              ),
              txtTile(size, post.destination, "assets/ic_location.png"),
              twoRowText(size, 'Travel Date: ${post.travelDate}',
                  'Weight: ${post.availableWeight}'),
            ],
          ),
        ],
      ),
    );
  }

  Widget twoRowText(
    Size size,
    String txt1,
    String txt2,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.003, horizontal: size.width * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            " $txt1",
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.mediumGreyColor),
          ),
          SizedBox(
            height: size.height * 0.03,
            width: size.width * 0.4,
            child: FittedBox(
              alignment: Alignment.centerRight,
              fit: BoxFit.scaleDown,
              child: Text(
                " $txt2",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mediumGreyColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget txtTile(Size size, String address, String img) {
    return Row(
      children: [
        SizedBox(
            height: size.height * 0.065,
            width: size.height * 0.065,
            child: Image.asset(
              img,
              fit: BoxFit.cover,
            )),
        SizedBox(width: size.width * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.05,
              width: size.width * 0.68,
              child: Text(
                address,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.darkBlackColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

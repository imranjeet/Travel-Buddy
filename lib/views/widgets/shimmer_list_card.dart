import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:travel_buddy/utils/colors.dart';
import 'package:travel_buddy/utils/common.dart';

class ShimmerListViewCard extends StatelessWidget {
  const ShimmerListViewCard({Key? key}) : super(key: key);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: size.height * 0.065,
                      width: size.height * 0.065,
                      child: Image.asset(
                        "assets/ic_source.png",
                        fit: BoxFit.cover,
                      )),
                  shimmerEffect(
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      width: size.width * 0.65,
                      height: size.height * 0.035,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: size.height * 0.065,
                      width: size.height * 0.065,
                      child: Image.asset(
                        "assets/ic_location.png",
                        fit: BoxFit.cover,
                      )),
                  shimmerEffect(
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      width: size.width * 0.65,
                      height: size.height * 0.04,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: size.height * 0.005),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              shimmerEffect(
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  width: size.width * 0.4,
                  height: size.height * 0.03,
                  color: Colors.grey[300],
                ),
              ),
              shimmerEffect(
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  width: size.width * 0.4,
                  height: size.height * 0.03,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

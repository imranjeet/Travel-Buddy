import 'package:flutter/material.dart';
import 'package:travel_buddy/utils/colors.dart';
import 'package:travel_buddy/utils/widgets/circular_container.dart';
import 'package:travel_buddy/utils/widgets/curved_edges_widget.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
    this.height = 200,
  });

  final double? height;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgesWidget(
      child: Container(
        color: AppColors.appBarColor.withOpacity(0.8),
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Positioned(
                  top: -150,
                  left: -300,
                  child: TCircularContainer(
                      backgroundColor: AppColors.textWhite.withOpacity(0.1))),
              Positioned(
                  top: 100,
                  left: -350,
                  child: TCircularContainer(
                      backgroundColor: AppColors.textWhite.withOpacity(0.1))),
              Positioned(
                  top: -150,
                  right: -300,
                  child: TCircularContainer(
                      backgroundColor: AppColors.textWhite.withOpacity(0.1))),
              Positioned(
                  top: 100,
                  right: -300,
                  child: TCircularContainer(
                      backgroundColor: AppColors.textWhite.withOpacity(0.1))),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

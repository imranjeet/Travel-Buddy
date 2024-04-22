import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/empty_data.svg"),
        const SizedBox(height: 20),
        const Text(
          'You have no Travel Routes.',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(33, 33, 33, 1)),
        ),
      ],
    );
  }
}

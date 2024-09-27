import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';

class CommonTimeProgressbar extends StatelessWidget {
  final String startTime;
  final String endTime;
  final bool isActive;
  final double? width;
  const CommonTimeProgressbar({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.isActive,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sixteen,

      decoration: BoxDecoration(
        color: isActive ? Colors.brown : Colors.brown.withOpacity(zero20),
        borderRadius: BorderRadius.circular(zero),
      ),


      child: Center(
        child: Container(
          width: width,
        ),
      ),
    );
  }
}

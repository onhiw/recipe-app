import 'package:flutter/material.dart';
import 'package:recipe_app/styles/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitThreeBounce(
            color: kOrange,
            size: 30.0,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Mohon Tunggu...",
            style: TextStyle(
              color: kOrange,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          )
        ],
      )),
    );
  }
}

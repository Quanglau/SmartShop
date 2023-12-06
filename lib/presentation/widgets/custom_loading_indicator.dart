import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor.withOpacity(0.2),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: LoadingIndicator(
            indicatorType: Indicator.lineScale,
            strokeWidth: 3,
          ),
        ),
      ),
    );
  }
}

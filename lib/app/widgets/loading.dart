import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        child: Hero(
          tag: 'hero',
                  child: LoadingIndicator(
            indicatorType: Indicator.lineScale,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}

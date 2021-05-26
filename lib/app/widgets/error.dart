import 'package:flutter/material.dart';
import 'package:leading/app/utils/consts.dart';
import 'package:leading/app/widgets/svg.dart';

class Error extends StatelessWidget {
  const Error(
      {Key? key, required this.title, required this.subtitle, this.onRetry})
      : super(key: key);

  final String title;
  final String subtitle;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SVG.cancel(
            width: 400,
            padding: EdgeInsets.all(Kpadding.large),
          ),
          Text(title, style: Theme.of(context).textTheme.headline4),
          Text(subtitle, style: Theme.of(context).textTheme.subtitle2),
          Padding(
            padding: const EdgeInsets.all(Kpadding.large),
            child: MaterialButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ),
        ],
      ),
    );
  }
}

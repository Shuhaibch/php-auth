import 'package:flutter/material.dart';

import '../../main.dart';

class CustButton extends StatelessWidget {
  final String title;
  const CustButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: width * .39,
        height: height * .08,
        decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: const BorderRadius.all(Radius.elliptical(20, 20))),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ),
    );
  }
}

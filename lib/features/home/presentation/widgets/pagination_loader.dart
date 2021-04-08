import 'package:flutter/material.dart';

class PaginationLoader extends StatelessWidget {
  const PaginationLoader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
          child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator()),
        ),
    );
  }
}

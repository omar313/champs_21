import 'package:champs_21/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoaderDialog extends StatelessWidget {
  const LoaderDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
        height: 150,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(20)),
            child: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(backgroundColor: kHiglightedColor,),
                const SizedBox(height: 30),
               const Text('Loading...', style: TextStyle(color: Colors.black),)
              ],
            ),),
      ),
    );
  }
}

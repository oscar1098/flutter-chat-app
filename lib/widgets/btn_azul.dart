import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {

  final  void Function()? onPressed;
  final String text;

  const BotonAzul({
    super.key, 
    required this.onPressed, 
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(2),
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all(const StadiumBorder())),
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        height: 45,
        child: Center(
          child: Text(text,
              style: TextStyle(color: Colors.white, fontSize: 17)),
        ),
      )
    );
  }
}

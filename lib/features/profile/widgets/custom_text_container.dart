import 'package:flutter/material.dart';

class CustomTextContainer extends StatelessWidget {
  const CustomTextContainer({
    super.key,
    required this.textLabel,
    required this.textInput,
  });

  final String textLabel;
  final String textInput;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black12,
      ),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: textLabel,
          border: InputBorder.none,
        ),
        child: Text(textInput),
      ),
    );
  }
}

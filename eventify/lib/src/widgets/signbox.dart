import 'package:flutter/material.dart';
import '../utils/colors.dart';

class SignBox extends StatelessWidget {
  final Widget fieldIcon;
  final String fieldText;
  final TextEditingController fieldController;

  const SignBox(this.fieldIcon, this.fieldText, this.fieldController);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        fieldController.text = value!;
      },
      decoration: InputDecoration(
        prefixIcon: fieldIcon,
        label: Text(
          fieldText,
          style: const TextStyle(
            color: Color(0xFF787878),
          ),
        ),
        border: const OutlineInputBorder(),
        labelStyle: const TextStyle(color: MyColors.textColor),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2.5, color: MyColors.textColor),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes.dart';

class GlobalTextField extends StatelessWidget {
  final bool obscure;
  final String hint;
  final String icon;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Function validate;
  final Function onSave;

  const GlobalTextField({
    Key key,
    this.obscure,
    this.hint,
    this.icon,
    this.textInputAction,
    this.textInputType,
    this.validate,
    this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validate(value),
      onSaved: (newValue) => onSave(newValue),
      cursorColor: AppColors.cblack,
      style: AppFonts.appText.copyWith(color: AppColors.cblack),
      obscureText: obscure ?? false,
      textInputAction: textInputAction ?? TextInputAction.done,
      keyboardType: textInputType ?? TextInputType.text,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
        hintText: hint,
        fillColor: Colors.white,
        hintStyle: AppFonts.appText.copyWith(
          color: AppColors.cblack,
          fontSize: 16,
        ),
        filled: true,
        prefixIcon: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 15, right: 10, bottom: 10),
          child: SvgPicture.asset(
            'assets/images/$icon.svg',
            width: 20,
            height: 20,
          ),
        ),
        suffixIcon: (obscure)
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 0, right: 15, bottom: 15),
                child: Icon(
                  Icons.lock,
                  color: AppColors.cblack,
                ),
              )
            : const SizedBox(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

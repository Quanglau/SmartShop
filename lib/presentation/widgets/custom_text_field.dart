import 'package:flutter/material.dart';
import 'package:lauquang_doan/presentation/utilities/enums/validator_type.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Icon? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final bool obscureText;
  final ValidatorType? validatorType;
  final int? errorMaxLines;
  final String? aboveText;
  final void Function()? onSuffixIconTap;
  final double? width;
  final EdgeInsetsGeometry? margin;

  const CustomTextField(
      {super.key,
      this.hintText,
      this.suffixIcon,
      this.keyboardType,
      this.textInputAction = TextInputAction.next,
      this.controller,
      this.obscureText = false,
      this.validatorType,
      this.errorMaxLines = 1,
      this.aboveText,
      this.onSuffixIconTap,
      this.width,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          margin ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      width: width ?? MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (aboveText != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                aboveText!,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          TextFormField(
            validator: (value) {
              switch (validatorType) {
                case ValidatorType.email:
                  return validateEmail(value!);
                case ValidatorType.password:
                  return validatePassword(value!);
                case ValidatorType.userName:
                  return validateUserName(value!);
                default:
                  return null;
              }
            },
            obscureText: obscureText,
            controller: controller,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            onTapOutside: (focusNode) {
              FocusScope.of(context).unfocus();
            },
            style: const TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              errorMaxLines: errorMaxLines,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 16,
              ),
              suffixIcon: InkWell(onTap: onSuffixIconTap, child: suffixIcon),
              suffixIconColor: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
      ),
    );
  }
}

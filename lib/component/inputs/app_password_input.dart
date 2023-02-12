import 'package:evote/component/inputs/app_text_field.dart';
import 'package:evote/styles/colors.dart';

import 'package:evote/utils/extensions.dart';
import 'package:evote/utils/typedefs.dart';
import 'package:evote/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final OnValidate<String>? validator;
  final String? hintText;
  final OnChanged<String>? onChange;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  TextEditingController get ctrl {
    return controller ?? TextEditingController();
  }

  const PasswordTextField({
    Key? key,
    this.controller,
    this.validator,
    this.hintText,
    this.keyboardType,
    this.onChange,
    this.inputFormatters,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField>
    with WidgetsBindingObserver {
  final ValueNotifier<bool> _isObscured = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    return ValueListenableBuilder(
      valueListenable: _isObscured,
      builder: (_, bool obscured, __) {
        return EvoteTextField(
          validator: widget.validator ?? EvoteValidators.passwordValidator,
          controller: widget.ctrl,
          obscureText: obscured,
          onChanged: widget.onChange,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          hintText: widget.hintText ?? "Password",
          suffixIcon: IconButton(
            icon: Icon(
              obscured ? Icons.visibility_off : Icons.remove_red_eye,
              color: EvoteColors.darkGray,
            ),
            onPressed: () {
              _isObscured.value = !obscured;
            },
          ),
          prefixIcon: Icon(
            Icons.lock_open,
            color: EvoteColors.black,
          ),
        );
      },
    );
  }
}

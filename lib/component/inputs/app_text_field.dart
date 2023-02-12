import 'package:evote/component/app_text.dart';
import 'package:evote/component/app_text.dart';
import 'package:evote/component/inputs/app_sized_box.dart';
import 'package:evote/models/podos/focus.dart';
import 'package:evote/models/podos/focus.dart';
import 'package:evote/styles/colors.dart';
import 'package:evote/styles/colors.dart';
import 'package:evote/styles/text_styles.dart';
import 'package:evote/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:evote/utils/extensions.dart';
import 'package:evote/utils/typedefs.dart';
import 'package:provider/src/provider.dart';

class EvoteTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? isEnabled;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final bool? showLabel;
  final Function? onTap;
  final bool? obscureText;
  final String? hintText;
  final Widget? suffix;
  final String? label;
  final bool? isLabel;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefix;
  final TextAlignVertical? textAlignVertical;
  final OnValidate<String>? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final Function(String)? onChanged;
  final TextStyle? style;
  final TextAlign? textAlign;
  final String? semanticsLabel;
  final bool? _expands;
  TextEditingController get ctrl {
    return controller ?? TextEditingController();
  }

  const EvoteTextField({
    Key? key,
    this.semanticsLabel,
    this.textInputAction,
    this.textCapitalization,
    this.controller,
    this.textAlignVertical,
    this.isEnabled = true,
    this.inputFormatters,
    this.onTap,
    this.showLabel = true,
    this.hintText,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.maxLength,
    this.onChanged,
    this.obscureText = false,
    this.suffix,
    this.suffixIcon,
    this.prefixIcon,
    this.prefix,
    this.validator,
    this.keyboardType,
    this.style,
  })  : this._expands = false,
        this.isLabel = false,
        this.label = null,
        super(key: key);

  const EvoteTextField.expand({
    Key? key,
    this.semanticsLabel,
    this.textInputAction,
    this.textCapitalization,
    this.controller,
    this.textAlignVertical,
    this.isEnabled,
    this.inputFormatters,
    this.onTap,
    this.prefixIcon,
    this.showLabel = true,
    this.hintText,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.maxLength,
    this.onChanged,
    this.obscureText = false,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.validator,
    this.keyboardType,
    this.style,
  })  : this._expands = true,
        this.isLabel = false,
        this.label = null,
        super(key: key);
  const EvoteTextField.label({
    Key? key,
    this.semanticsLabel,
    this.textInputAction,
    this.textCapitalization,
    this.controller,
    this.textAlignVertical,
    this.isEnabled,
    this.inputFormatters,
    this.onTap,
    this.showLabel = true,
    this.hintText,
    this.prefixIcon,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.label,
    this.maxLength,
    this.onChanged,
    this.obscureText = false,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.validator,
    this.keyboardType,
    this.style,
  })  : this._expands = true,
        this.isLabel = true,
        super(key: key);

  @override
  _EvoteTextFieldState createState() => _EvoteTextFieldState();
}

class _EvoteTextFieldState extends State<EvoteTextField>
    with WidgetsBindingObserver {
  final _inputFocus = FocusNode();
  final ValueNotifier<FocusState> _hasFocus = ValueNotifier(FocusState());

  @override
  void initState() {
    super.initState();

    _inputFocus.addListener(
      () {
        _hasFocus.value = FocusState(
          hasText: widget.ctrl != null && (widget.ctrl.text.isNotEmpty),
          isFocused: _inputFocus.hasFocus,
        );
      },
    );
  }

  InputDecoration get decoration {
    return InputDecoration(
      filled: true,
      fillColor: EvoteColors.white,
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: EvoteColors.transparent,
          width: 0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: EvoteColors.transparent,
          width: 0,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: EvoteColors.transparent,
          width: 0,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: EvoteColors.transparent,
          width: 0,
        ),
      ),
      errorStyle: EvoteTextStyle.medium.copyWith(),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: EvoteColors.transparent,
          width: 0,
        ),
      ),
      labelText: widget.hintText ?? "",
      labelStyle: TextStyle(
        color: EvoteColors.black.withOpacity(.8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return IgnorePointer(
      ignoring: !(widget.isEnabled ?? true),
      child: Semantics(
        label: widget.semanticsLabel ?? "Input Field",
        child: Column(
          children: [
            (widget.isLabel ?? false)
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: EvoteText(widget.label!),
                  )
                : EvoteSizedBox(),
            EvoteSizedBox(height: 0.85),
            ValueListenableBuilder(
              valueListenable: _hasFocus,
              builder: (context, FocusState value, child) {
                return InkWell(
                  onTap: () => FocusScope.of(context).requestFocus(_inputFocus),
                  child: Container(
                    height: scaler.sizer.height * 0.075,
                    padding: scaler.insets.only(
                      top: value.hasError ? 0.0 : 0.75,
                    ),
                    margin: scaler.insets.zero,
                    decoration: BoxDecoration(
                      color: EvoteColors.white,
                      border: Border.all(
                        color: value.isFocused
                            ? EvoteColors.green
                            : EvoteColors.boderGrey,
                      ),
                      borderRadius: BorderRadius.circular(
                        scaler.fontSizer.sp(10),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          height: scaler.sizer.height * 0.075,
                          padding: scaler.insets.only(
                            top: (!value.isFocused && value.hasText)
                                ? 0.356
                                : (value.isFocused || value.hasText)
                                    ? 0.325
                                    : 0.225,
                          ),
                          child: Center(
                            child: TextFormField(
                              showCursor: true,
                              textAlign: widget.textAlign ?? TextAlign.start,
                              textAlignVertical: widget.textAlignVertical,
                              focusNode: _inputFocus,
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(_inputFocus);
                              },
                              textInputAction: widget.textInputAction ??
                                  TextInputAction.done,
                              textCapitalization: widget.textCapitalization ??
                                  TextCapitalization.none,
                              style: widget.style ??
                                  EvoteTextStyle.medium.copyWith(
                                    fontSize: scaler.fontSizer.sp(
                                      52.5,
                                    ),
                                  ),
                              maxLength: widget.maxLength,
                              controller: widget.ctrl,
                              enabled: true,
                              obscureText: widget.obscureText ?? false,
                              keyboardType:
                                  widget.keyboardType ?? TextInputType.text,
                              inputFormatters: widget.inputFormatters,
                              maxLines: widget.maxLines ?? 1,
                              cursorColor: EvoteColors.black,
                              onChanged: widget.onChanged,
                              decoration: decoration.copyWith(
                                alignLabelWithHint: widget._expands,
                                labelStyle: EvoteTextStyle.medium.copyWith(
                                  fontSize: scaler.fontSizer.sp(36.5),
                                  color: value.isFocused || value.hasText
                                      ? EvoteColors.greyText
                                      : null,
                                ),
                                errorStyle: EvoteTextStyle.medium.copyWith(
                                  height: .0,
                                  // fontWeight: FontWeight.w300,
                                  // color: Colors.transparent,
                                  fontSize: 0,
                                ),
                                // isDense: true,
                                // hintStyle: EvoteTextStyle.medium.copyWith(
                                //     fontSize: scaler.fontSizer.sp(55)),
                                suffix: widget.suffix,
                                suffixIcon: widget.suffixIcon,

                                prefixIcon: widget.prefixIcon,
                                prefix: widget.prefix,
                                counter: null,
                                contentPadding: scaler.insets.symmetric(
                                  horizontal: 3,
                                  // vertical: 9.5,
                                ),
                              ),
                              validator: (String? text) {
                                if (widget.validator != null) {
                                  final error = widget.validator!(text ?? "");
                                  _hasFocus.value = FocusState(
                                    hasError: error != null,
                                    hasText: _hasFocus.value.hasText,
                                    error: error ?? "Error",
                                    isFocused: _hasFocus.value.isFocused,
                                  );

                                  return error;
                                }
                                _hasFocus.value = FocusState(
                                  hasError: false,
                                  hasText: _hasFocus.value.hasText,
                                  isFocused: _hasFocus.value.isFocused,
                                );
                                return null;
                              },
                            ),
                          ),
                        ),
                        value.hasError
                            ? Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: scaler.insets.only(
                                    top: 1.0,
                                    right: 2.0,
                                    bottom: 0.25,
                                  ),
                                  child: EvoteText(
                                    "${value.error}",
                                    style: EvoteTextStyle.medium.copyWith(
                                      color: EvoteColors.red,
                                      fontSize: scaler.fontSizer.sp(
                                        value.hasError ? 86.5 : 0,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

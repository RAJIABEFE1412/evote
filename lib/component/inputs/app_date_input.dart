import 'package:evote/component/inputs/app_text_field.dart';

import 'package:evote/utils/typedefs.dart';
import 'package:flutter/material.dart';

import 'package:evote/utils/intl_formatter.dart';

class EvoteDateInput extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final OnValidate<String>? validator;
  final DateTime? lastDate;
  final DateTime? firstDate;
  final DateTime? initialDate;
  final bool isEnabled;
  final bool formatDate;

  EvoteDateInput(
    this.controller, {
    this.hintText = "Date",
    this.validator,
    this.isEnabled = true,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.formatDate = true,
  }) : assert(controller != null);

  @override
  State<StatefulWidget> createState() => _EvoteDateInputState();
}

class _EvoteDateInputState extends State<EvoteDateInput> {
  late TextEditingController _localCtrl;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null &&
        widget.controller.text != null &&
        widget.controller.text.isNotEmpty) {
      _localCtrl = TextEditingController(text: widget.controller.text);
    } else {
      _localCtrl = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.green,
      ),
      child: Builder(
        builder: (context) {
          return InkWell(
            onTap: widget.isEnabled
                ? () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    final date = await showDatePicker(
                      context: context,
                      initialDate: widget.initialDate ?? DateTime.now(),
                      firstDate: widget.firstDate ?? DateTime(1000),
                      lastDate: widget.lastDate ?? DateTime(3000),
                    );
                    if (date != null) {
                      widget.controller.text = date.toIso8601String();
                      _localCtrl.text = EvoteFormatter.formatDate(
                        date.toIso8601String(),
                        format: "dd-MMM-yyyy",
                      );
                    }
                  }
                : null,
            child: EvoteTextField(
              controller: _localCtrl,
              hintText: widget.hintText,
              validator: widget.validator,
              isEnabled: false,
              suffixIcon: Icon(
                Icons.calendar_today_outlined,
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:evote/component/app_text.dart';
import 'package:evote/component/buttons/app_button.dart';
import 'package:evote/component/buttons/monee_flat_button.dart';
import 'package:evote/component/others/dialog_message.dart';
import 'package:evote/models/podos/selection.dart';
import 'package:evote/styles/colors.dart';
import 'package:evote/styles/text_styles.dart';
import 'package:evote/utils/dimensions.dart';
import 'package:evote/utils/extensions.dart';
import 'package:evote/utils/helpers.dart';
import 'package:evote/utils/typedefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialog_scaffold.dart';

Future<T?> formSubmit<T>({
  required BuildContext context,
  required bool showError,
  required Future<T> future,
  OnChanged<String>? errorChanger,
  String errorMessage =
      "An unexpected error occurred and the request failed, please try again",
  String? prompt = "Processing your request",
  String? successMessage,
  bool? forceErrorMessage = false,
}) async {
  ValueNotifier<FutureState> isResolved = ValueNotifier(FutureState.Loading);
  final T? result = await showGeneralDialog<T>(
    context: context,
    barrierDismissible: false,
    pageBuilder: (context, ____, _______) {
      return WillPopScope(
        child: ValueListenableBuilder(
          valueListenable: isResolved,
          builder: (context, FutureState val, _) {
            return EvoteDialogScaffold(
              future: future,
              padded: true,
              child: FutureBuilder(
                future: future,
                builder: (ctx, AsyncSnapshot<T> res) {
                  if (res.hasData) {
                    WidgetsBinding.instance!.addPostFrameCallback(
                      (_) {
                        Timer(
                          Duration(milliseconds: !showError ? 0 : 1000),
                          () {
                            val = FutureState.Complete;
                            Navigator.of(ctx).pop(res.data);
                          },
                        );
                      },
                    );
                    if (successMessage == null) {
                      return DialogMessage(
                        message: "",
                        messageType: MessageType.Pending,
                      );
                    }
                    return DialogMessage(
                      message: successMessage,
                      messageType: MessageType.Success,
                    );
                  }
                  if (res.hasError) {
                    WidgetsBinding.instance!.addPostFrameCallback(
                      (_) {
                        isResolved.value = FutureState.Fail;
                        if (errorChanger != null) {
                          errorChanger(parseError(res.error, errorMessage));
                        }
                        // Navigator.of(ctx).pop();
                      },
                    );

                    log("What's wrong??? ${isResolved.value}");

                    return DialogMessage(
                      message: parseError(res.error, errorMessage),
                      messageType: MessageType.Error,
                      route: "",
                    );
                  }

                  log("ohk....... how many times");
                  return DialogMessage(
                    message: prompt,
                    messageType: MessageType.Pending,
                  );
                },
              ),
              showClose: val != FutureState.Loading,
            );
          },
        ),
        onWillPop: () async => isResolved.value == FutureState.Complete,
      );
    },
  );
  return result;
}

Future<bool> confirmDialog({
  required BuildContext context,
  required String message,
  String? title,
  MessageType type = MessageType.Warning,
  String confirmText = "Proceed",
  String cancelText = "Cancel",
}) async {
  final scaler = (context.scaler);
  final resolution = await showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        contentPadding: scaler.insets.only(top: 3, left: 3, right: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(scaler.sizer.setWidth(2)),
        ),
        title: title != null
            ? EvoteText(
                title,
                style: EvoteTextStyle.bold.copyWith(
                  fontSize: scaler.fontSizer.sp(
                    190,
                  ),
                ),
              )
            : null,
        content: EvoteText(
          message,
        ),
        actions: <Widget>[
          EvoteFlatButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            textColor: EvoteColors.black,
            text: cancelText,
          ),
          EvoteFlatButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            textColor: EvoteColors.orange,
            text: confirmText,
          ),
        ],
      );
    },
  );
  return resolution ?? false;
}

showAlert(
  BuildContext context, {
  Widget? child,
  bool? barrierDismissible = false,
}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible!,
    builder: (context) {
      return AlertDialog(content: child);
    },
  );
}

Future<bool> showAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  required Function() doSomething,
  String? cancelActionText,
  required String defaultActionText,
}) async {
  if (!Platform.isIOS) {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          if (cancelActionText != null)
            TextButton(
              child: Text(cancelActionText),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          TextButton(
            child: Text(defaultActionText),
            onPressed: () {
              Navigator.of(context).pop(true);
              doSomething();
            },
          ),
        ],
      ),
    );
  }
  return await showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        if (cancelActionText != null)
          CupertinoDialogAction(
            child: Text(cancelActionText),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        CupertinoDialogAction(
          child: Text(defaultActionText),
          onPressed: () {
            Navigator.of(context).pop(true);
            doSomething();
          },
        ),
      ],
    ),
  );
}

enum FutureState {
  Loading,
  Complete,
  Fail,
}

void alertDialog<T>({
  required BuildContext context,
  required OnPressed action,
  required String message,
  MessageType type = MessageType.Warning,
  bool dismissable = false,
}) async {
  final scaler = EvoteScaleUtil(context);
  bool isResolved = dismissable;
  await showDialog<T>(
    context: context,
    barrierDismissible: dismissable,
    builder: (context) {
      return WillPopScope(
        child: AlertDialog(
          contentPadding: scaler.insets.only(top: 3, left: 10, right: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(scaler.sizer.setWidth(2)),
          ),
          content: DialogMessage(
            message: message,
            messageType: type,
          ),
          actions: <Widget>[
            EvoteButton(
              color: EvoteColors.transparent,
              onPressed: action,
              textColor: EvoteColors.orange,
              text: "OK",
            ),
          ],
        ),
        onWillPop: () async => isResolved,
      );
    },
  );
}

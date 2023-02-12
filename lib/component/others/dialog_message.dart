import 'package:evote/component/app_text.dart';
import 'package:evote/component/buttons/app_button.dart';
import 'package:evote/component/inputs/app_sized_box.dart';
import 'package:evote/component/others/app_loader.dart';
import 'package:evote/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:evote/utils/extensions.dart';

class DialogMessage extends StatelessWidget {
  final dynamic message;
  final MessageType messageType;
  final String? route;
  final TextAlign textAlign;
  final bool _isConfirm;
  final bool _isAction;

  const DialogMessage({
    Key? key,
    required this.message,
    this.messageType = MessageType.Info,
    this.textAlign = TextAlign.center,
    this.route,
  })  : _isConfirm = false,
        _isAction = false,
        super(key: key);

  const DialogMessage.action({
    Key? key,
    required this.message,
    this.messageType = MessageType.Warning,
    this.textAlign = TextAlign.center,
    required this.route,
  })  : _isAction = true,
        _isConfirm = false,
        super(key: key);

  const DialogMessage.confirm({
    Key? key,
    required this.message,
    this.messageType = MessageType.Info,
    this.textAlign = TextAlign.center,
    required this.route,
  })  : _isConfirm = true,
        _isAction = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: _isConfirm || _isAction
          ? CrossAxisAlignment.stretch
          : CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (!_isConfirm) _messageIcon(),
        const EvoteSizedBox(height: 1),
        Flexible(
          child: Text(
            _parsedMessage(),
            textAlign: TextAlign.center,
          ),
        ),
        if (_isConfirm || _isAction) const EvoteSizedBox(height: 3),
        if (messageType == MessageType.Info)
          TextButton(
            onPressed: () {},
            child: EvoteText("Ok"),
          ),
        if (_isAction)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              EvoteButton(
                text: "Proceed",

                // color: EvoteColors.red,
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              EvoteButton(
                text: "Cancel",
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          )
      ],
    );
  }

  Widget _messageIcon() {
    switch (messageType) {
      case MessageType.Error:
        return const Icon(
          Icons.error_outline,
          size: 30,
          color: EvoteColors.red,
        );

      case MessageType.Success:
        return const Icon(
          Icons.sentiment_satisfied,
          size: 30,
          color: EvoteColors.green,
        );

      case MessageType.Warning:
        return Icon(
          Icons.warning,
          size: 30,
          color: EvoteColors.red.withGreen(100),
        );

      case MessageType.Pending:
        return const Apploader();

      default:
        return const Icon(
          Icons.notifications,
          size: 30,
          color: EvoteColors.black,
        );
    }
  }

  String _parsedMessage() {
    if (message is String) {
      return message;
    } else if (message is Map || message is List) {
      final List<String> messageArr = message is Map
          ? message.values.map((it) => "$it").toList()
          : message.map((it) => "$it").toList();
      return messageArr.join("; ");
    } else {
      return "";
    }
  }
}

enum MessageType {
  Error,
  Warning,
  Success,
  Info,
  Infoma,
  Pending,
}

// class ScaleTransitionWidget extends StatefulWidget {
//   @override
//   _ScaleTransitionWidgetState createState() => _ScaleTransitionWidgetState();
// }

// class _ScaleTransitionWidgetState extends State<ScaleTransitionWidget>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   @override
//   initState() {
//     super.initState();
//     _controller = AnimationController(
//         duration: const Duration(
//           milliseconds: 2000,
//         ),
//         vsync: this,
//         value: 0.1,
//         lowerBound: 0,
//         upperBound: 1);
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     );
//     _controller.repeat(reverse: true);
//   }

//   @override
//   dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final scaler = context.scaler;
//     return Container(
//       color: Colors.white,
//       height: scaler.sizer.height,
//       width: scaler.sizer.width,
//       child: ScaleTransition(
//         scale: _animation,
//         alignment: Alignment.center,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               logo,
//               height: scaler.sizer.setHeight(20),
//               width: scaler.sizer.setHeight(20),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

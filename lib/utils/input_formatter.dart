import 'package:evote/utils/intl_formatter.dart';
import 'package:flutter/services.dart';

// class MoneeInputFormatter {
//   MaskTextInputFormatter get creditCard {
//     return MaskTextInputFormatter(
//       mask: "#### #### #### #### ###",
//       filter: {"#": RegExp(r'[0-9]')},
//     );
//   }

//   MaskTextInputFormatter get creditCardYear {
//     return MaskTextInputFormatter(
//       mask: "##/##",
//       filter: {"#": RegExp(r'[0-9]')},
//     );
//   }

//   MaskTextInputFormatter get creditCardCvv {
//     return MaskTextInputFormatter(
//       mask: "###",
//       filter: {"#": RegExp(r'[0-9]')},
//     );
//   }

//   MaskTextInputFormatter get phoneNumber {
//     return MaskTextInputFormatter(
//       mask: "### ### #### #",
//       filter: {"#": RegExp(r'[0-9]')},
//     );
//   }

//   MaskTextInputFormatter get phoneNumberAlt {
//     return MaskTextInputFormatter(
//       mask: "#### ### ####",
//       filter: {"#": RegExp(r'[0-9]')},
//     );
//   }
// }

// class AmountFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     try {
//       if (oldValue == newValue) {
//         return TextEditingValue(
//           text: newValue.text,
//           selection: TextSelection.collapsed(offset: newValue.text.length),
//           composing: TextRange.empty,
//         );
//       }
//       final amount = newValue.text != null
//           ? newValue.text.replaceAll(RegExp(r'[^0-9\.]'), "")
//           : "";
//       final isValidNum = amount.isNotEmpty && int.tryParse(amount) != null;
//       if (isValidNum) {
//         final formattedText = EvoteFormatter.formatCurrencyInput(amount);
//         return TextEditingValue(
//           text: formattedText,
//           selection: TextSelection.collapsed(offset: formattedText.length),
//           composing: TextRange.empty,
//         );
//       } else {
//         return newValue;
//       }
//     } catch (e) {
//       return oldValue;
//     }
//   }
// }

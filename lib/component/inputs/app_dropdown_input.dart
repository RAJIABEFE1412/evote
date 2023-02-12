// import 'dart:developer';

// import 'package:evote/component/inputs/app_text_field.dart';
// import 'package:evote/components/inputs/app_text_field.dart';
// import 'package:evote/components/layouts/sheets/app_selection_full_sheet.dart';
// import 'package:evote/inventory_icon_icons.dart';
// import 'package:evote/models/podos/selection.dart';
// import 'package:evote/style/colors.dart';
// import 'package:evote/styles/colors.dart';
// import 'package:evote/utils/extensions.dart';
// import 'package:evote/utils/modals.dart';
// import 'package:evote/utils/typedefs.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:provider/provider.dart';

// class EvoteDropdownInput<T> extends StatefulWidget {
//   final String hintText;
//   final TextEditingController controller;
//   final OnValidate<String>? validator;
//   final List<SelectionData<T>> items;
//   final OnChanged<int>? onChanged;
//   final bool fullDialog;
//   final bool pop;
//   final bool isEnabled;
//   final bool isSelect;
//   final bool _isDebit;

//   EvoteDropdownInput(
//     this.controller, {
//     this.hintText = "Dropdown",
//     this.fullDialog = true,
//     this.isSelect = false,
//     this.validator,
//     required this.items,
//     this.isEnabled = true,
//     this.onChanged,
//     this.pop = false,
//   })  : assert(items != null || items.isNotEmpty),
//         this._isDebit = false;
//   EvoteDropdownInput.debit(
//     this.controller, {
//     this.hintText = "Dropdown",
//     this.fullDialog = false,
//     this.validator,
//     required this.items,
//     this.isSelect = false,
//     this.isEnabled = true,
//     this.onChanged,
//     this.pop = false,
//   })  : assert(items != null || items.isNotEmpty),
//         this._isDebit = true;

//   @override
//   State<StatefulWidget> createState() => _EvoteDropdownInputState<T>();
// }

// class _EvoteDropdownInputState<T> extends State<EvoteDropdownInput> {
//   late TextEditingController _localCtrl;
//   late Box db;
//   Color? backgroundColorElse(int index) {
//     return Colors.green;
//   }

//   @override
//   void initState() {
//     super.initState();

//     _populateCtrl();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     log("init change -- ${widget.controller.text}, ----  ${_localCtrl.text}");
//     _populateCtrl();
//   }

//   void _populateCtrl() {
//     if (widget.controller != null &&
//         widget.controller.text != null &&
//         widget.controller.text.isNotEmpty) {
//       try {
//         log("widget ---- ${widget.controller.text}");
//         final SelectionData<dynamic>? selection = widget.items.firstWhere(
//           (it) {
//             return ((widget.isSelect ? it.selection : it.title ?? "")
//                     .toString()
//                     .toLowerCase()
//                     .trim() ==
//                 widget.controller.text.toLowerCase().trim());
//           },
//           // orElse: () => null,
//         );
//         _localCtrl = TextEditingController(text: selection?.title ?? "");
//       } catch (e) {
//         print(e);
//         // SelectionData(selection: "", title: "");
//         _localCtrl = TextEditingController(text: "");
//       }
//     } else {
//       _localCtrl = TextEditingController();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final scaler = context.scaler;

//     return Builder(
//       builder: (context) {
//         return InkWell(
//           onTap: widget.isEnabled
//               ? () async {
//                   if (widget.fullDialog) {
//                     await Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => FullSelectionBottomSheet(
//                           title: widget.hintText,
//                           onSelect: (SelectionData s) {
//                             log("here -- ${s.selection}");
//                             widget.controller.text = widget.isSelect
//                                 ? s.selection.toString()
//                                 : s.title ?? "";
//                             _localCtrl.text = s.title ?? "";
//                             if (widget.onChanged != null) {
//                               widget.onChanged!(widget.items.indexOf(s));
//                             }
//                           },
//                           items: widget.items,
//                         ),
//                         fullscreenDialog: true,
//                       ),
//                     );
//                   } else if (widget._isDebit) {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showSelectionSheetDebit(
//                       context,
//                       widget.hintText,
//                       widget.items,
//                       (data) {
//                         widget.controller.text = data.title ?? "";
//                         _localCtrl.text = data.title ?? "";
//                         if (widget.onChanged != null) {
//                           if (widget.pop) Navigator.pop(context);
//                           widget.onChanged!(widget.items.indexOf(data));
//                         }
//                       },
//                     );
//                   } else {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     showSelectionSheet(
//                       context,
//                       widget.hintText,
//                       widget.items,
//                       (data) {
//                         widget.controller.text = data.title ?? "";
//                         _localCtrl.text = data.title ?? "";
//                         if (widget.onChanged != null) {
//                           if (widget.pop) Navigator.pop(context);
//                           widget.onChanged!(widget.items.indexOf(data));
//                         }
//                       },
//                     );
//                   }
//                 }
//               : null,
//           child: EvoteTextField(
//             isEnabled: false,
//             controller: _localCtrl,
//             hintText: widget.hintText,
//             validator: widget.validator,
//             suffixIcon: Padding(
//               padding: scaler.insets.all(2.5),
//               child: Container(
//                 height: scaler.sizer.setHeight(0.5),
//                 width: scaler.sizer.setWidth(0.5),
//                 decoration: BoxDecoration(
//                   color: EvoteColors.greenDark.withOpacity(0.1),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Center(
//                   child: RotatedBox(
//                     quarterTurns: 1,
//                     child: Icon(
//                       Icons.arrow_drop_down_rounded,
//                       size: scaler.sizer.setHeight(
//                         2.0,
//                       ),
//                       color: EvoteColors.greenDark,
//                       // fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             //  Icon(Icons.keyboard_arrow_down),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   void didUpdateWidget(EvoteDropdownInput oldWidget) {
//     log("did update widget.........");

//     super.didUpdateWidget(oldWidget);
//     if (this.widget.controller.text.trim().isEmpty) {
//       _localCtrl.clear();
//     } else {
//       _populateCtrl();
//     }
//   }
// }

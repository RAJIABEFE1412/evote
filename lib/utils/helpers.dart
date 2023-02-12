import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

bool contains(String base, String comparator) =>
    lower(base).contains(lower(comparator));

Future<File?> exractFile(Map<String, String> data) async {
  try {
    final byteArray = base64Decode(data['b64']!);
    final file = File("${data['path']}/avatar.png");
    await file.writeAsBytes(byteArray);
    return file;
  } catch (_) {
    return null;
  }
}

// String get getBaseUrl {
//   log("hmmmmm");
//   final model = ListTileState.instance;
//   int md = model.appDb.get("masterData", defaultValue: 0);
//   return model.masterData[md].baseUrl!;
// }

// String get logo {
//   return model.masterData[0].iconPath!;
// }

// String get name {
//   // final model = ListTileState.instance;
//   // final acctModel = AccountState.instance;
//   // int md = appDb.get("masterData", defaultValue: 0);
//   return "Evotesmart";
// }

// String get currency {
//   // final model = ListTileState.instance;
//   // final acctModel = AccountState.instance;
//   int md = appDb.get("masterData", defaultValue: 0);
//   return model.masterData[md].defaultCurrency!;
// }

// String getSymbol() {
//   String symbol = '₦';
//   // AccountState as = AccountState.instance;
//   Map<String, dynamic>? accts;
//   var a = db.get(
//     "result",
//     defaultValue: null,
//   );

//   if (a == null) {
//     return symbol;
//   }
//   var banks = [
//     ...a,
//     ...a,
//     ...a,
//     ...a,
//   ];
//   accts = Map<String, dynamic>.from(banks[0]); //as.selectedAccount.value]);
//   // as is from account state
//   symbol = worldCurrency[accts['walletCurrency']]!;
//   return symbol;
// }

String successmsg({
  String? successMsg,
  String? validatedMsg,
}) {
  if (successMsg != null && validatedMsg != null) {
    return "$successMsg $validatedMsg";
  } else if (successMsg != null) {
    return successMsg;
  } else if (validatedMsg != null) {
    return validatedMsg;
  } else {
    return "Your Transaction was successful";
  }
}

num calculateDue(num amountPaid, num amountDue) {
  if (amountPaid >= amountDue) {
    return 0;
  } else if (amountDue == 0) {
    return 0;
  } else if (amountPaid == 0) {
    return amountDue;
  } else {
    return amountDue - amountPaid;
  }
}

// Future<String> handleEmptyWalletNum() async {
//   try {
//     final db = Hive.box("user_data");
//     final req = await WalletHttpService().accounts();
//     final defaultAcct = req[0] as Map;
//     defaultAcct.removeWhere((k, v) => v == null || v == "null");
//     db.putAll(defaultAcct);
//     return defaultAcct["walletNumber"] ?? "";
//   } catch (e) {
//     return "";
//   }
// }

String encodeString(String string) {
  return base64Encode(Utf8Encoder().convert(string));
}

String formatMobileNumber(String mobileNum, {bool hasCountryCode = true}) {
  mobileNum = mobileNum.replaceAll(" ", '');
  if (hasCountryCode) {
    mobileNum = mobileNum.length == 10 ? mobileNum : mobileNum.substring(1);
    return mobileNum;
  } else {
    return mobileNum;
  }
}

// void setLastTel(String mobile, String tel) async {
//   try {
//     final appDb = Hive.box("app_data");
//     appDb.put("lastTel", tel);
//     // final db = await SharedPreferences.getInstance();
//     // await db.setString("lastTel", mobile);
//   } catch (_) {}
// }

// Future<String> lastTel() async {
//   try {
//     final appDb = Hive.box("app_data");
//     return appDb.get(
//       "lastTel",
//       defaultValue: "",
//     );
//   } catch (_) {
//     return "";
//   }
// }

num? extractAmount(String amount) {
  if (amount == null || amount.isEmpty) {
    return null;
  } else {
    final val = amount.startsWith("NGN")
        ? amount.substring(3)
        : amount.startsWith("N")
            ? amount.substring(0)
            : amount;
    final number = num.tryParse(val.replaceAll(RegExp(r'[^0-9\.]'), ""));

    if (number != null) {
      return number;
    } else {
      return number;
    }
  }
}

num? extractAmountEvote(String amount) {
  if (amount == null || amount.isEmpty) {
    return null;
  } else {
    final val = amount.substring(0, 4);
    log('vale -- $val');
    final number = num.tryParse(val.replaceAll(RegExp(r'[^0-9\.]'), ""));

    if (number != null) {
      return number;
    } else {
      return number;
    }
  }
}

// launchURL(String url) async {
//   // const url = 'https://instagram.com/';
//   // const url2 = 'https://twitter.com/';
//   // const url3 = 'https://m.facebook.com/';
//   // const url4 = 'https://google.com/';
//   // const url5 = 'https://myEvote.io/faq-mobile';
//   // const url6 = 'https://myEvote.io/terms-mobile';
//   // const url7 = 'https://myEvote.io/privacy-mobile';
//   log("url -- $url");

//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

String lower(String text) => text.toLowerCase();

String parseError(
  dynamic errorResponse,
  String defaultMessage, [
  bool ignore401 = false,
]) {
  print("xxxx: $errorResponse");
  try {
    final fallbackMessage = defaultMessage != null && defaultMessage.isNotEmpty
        ? defaultMessage
        : "Your request failed due to an unexpected error, please try again";
    try {
      final int statusCode = errorResponse["statusCode"] ?? 400;
      final dynamic error = errorResponse["data"];

      print("error: $error");

      if (error is Map) {
        if (error["message"] != null &&
            error["message"] is String &&
            error["message"].isNotEmpty) {
          return error["message"];
        } else if (error.containsKey("errors") && error["errors"] != null) {
          return _parseErrorArray(error["errors"]) ??
              _fallBackMessage(statusCode, defaultMessage);
        } else {
          return _fallBackMessage(statusCode, fallbackMessage);
        }
      }
      if (error is String) {
        log('here haaa $error');
        return error != null && error.isNotEmpty
            ? error
            : _fallBackMessage(statusCode, fallbackMessage);
      }
      return _fallBackMessage(statusCode, fallbackMessage);
    } catch (_) {
      return fallbackMessage;
    }
  } catch (_) {
    return defaultMessage;
  }
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

String parseSuccess(dynamic data, String defaultMessage) {
  final fallbackMessage = defaultMessage != null && defaultMessage.isNotEmpty
      ? defaultMessage
      : "Success";
  try {
    if (data is Map) {
      if (data["message"] != null &&
          data["message"] is String &&
          data["message"].isNotEmpty) {
        return data["message"];
      }
      return fallbackMessage;
    }
    return fallbackMessage;
  } catch (_) {
    return fallbackMessage;
  }
}

String _fallBackMessage(int statusCode, String defaultMessage) {
  if (statusCode == 405) {
    return "Sorry, you are not permitted to carry out this action at this time";
  } else if (statusCode == 404) {
    return "Sorry, the requested data could not be found at this time";
  } else if (statusCode == 401) {
    return "Unauthorized";
  } else if (statusCode >= 400 && statusCode < 500) {
    return "Sorry, your request could not be resolved at this time, please retry";
  } else if (statusCode >= 500 && statusCode < 600) {
    return "Sorry, your request could not be resolved at this time because of an unexpected error";
  } else {
    return defaultMessage;
  }
}

_parseAndDecode(String response) {
  return jsonDecode(response);
}

String? _parseErrorArray(Map error) {
  try {
    final data = Map<String, List>.from(error);
    List errorMessages = [];
    data.keys.forEach((it) {
      errorMessages.addAll(data[it]!);
    });
    return errorMessages.join(", ");
  } catch (_) {
    return null;
  }
}

bool acctNumValid(String text) {
  return text != null && text.isNotEmpty && text.length == 10;
}

String shortenName(String nameRaw, [int? maxium]) {
  String result = '';
  //* Limiting val should not be gt input length (.substring range issue)
  final max = nameRaw.split(" ");
  //* Get short name
  if (maxium != null) {
    if (maxium > max.length) {
      return max[0].split("").first.toString();
    } else {
      max.removeWhere((element) => element == "");
      for (var i = 0; i < maxium; i++) {
        result = "$result${max[i].split("").first.toString()}";

        //* Return with '..' if input string was sliced

      }
      return result;
    }
  }
  max.removeWhere((element) => element == "");
  max.forEach((element) {
    result = "$result${element.split("").first.toString()}";
  });
  //* Return with '..' if input string was sliced

  return result;
}

String firstName(String name) {
  return name.split(' ').first;
}

bool parseFixed(dynamic val) {
  if (val is bool) {
    return val;
  }
  return "$val".toLowerCase().startsWith("t");
}

Color getLightBgColor(int index) {
  // if (index == 0) return EvoteColors.lightBluebackground;
  // if (index == 1) return EvoteColors.lightGreen;
  // if (index == 2) return Color(0xD2F5D8BE);
  // if (index == 3) return Color(0xFFC7EED8);
  return Color(0xFFC7EED8); // EvoteColors.lightBluebackground;
}

const publicKey = """
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoQh0w
Eqx/R2H1v00IU12Oc30fosRC/frhH89L6G+fzeaqI19MYQhEP
MU13wpeqRONCUta+2iC1sgCNQ9qGGf19yGdZUfueaB1Nu9rdu
eQKXgVurGHJ+5N71UFm+OP1XcnFUCK4wT5d7ZIifXxuqLehP9
Ts6sNjhVfa+yU+VjF5HoIe69OJEPo7OxRZcRTe17khc93Ic+P
fyqswQJJlY/bgpcLJQnM+QuHmxNtF7/FpAx9YEQsShsGpVo7Ja
KgLo+s6AFoJ4QldQKir2vbN9vcKRbG3piElPilWDpjXQkOJZhU
loh/jd7QrKFimZFldJ1r6Q59QYUyGKZARUe0KZpMQIDAQAB
-----END PUBLIC KEY-----
""";
const checkMark = "\u2705";
const cancel = "\u274C";
const passwordHelper =
    "Make sure it's at least 6 characters including lower and uppercase letters (pAssword $checkMark, password $cancel)";

const bullet = "\u2022";
const bullets = "$bullet$bullet$bullet$bullet";
const String appName = 'Payment Card Demo';
const String error =
    "Dear Customer, you are not eligible for this loan at this time. Kindly call our contact center on 0123456789-3 for details";
const String fieldReq = 'This field is required';
const String pay = 'Validate';
const String numberIsInvalid = 'Card is invalid';
const String completeProfile =
    '''You cannot request for a loan while your current profile information is incomplete.\n\nTo access loans request, you need to update your profile.''';

const String access = "Please enable these\npermission on your phone.";
const String contact =
    "Evote reviews and collects information from your phone contacts, which may include name and phone number for better risk control management.";
const String location =
    "Evote collects and monitors information about the location of your device in order to verify addresses, which helps us make better credit risk decisions and speed up the “know your customer” (KYC) process.";

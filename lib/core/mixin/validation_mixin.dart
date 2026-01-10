import 'package:flutter/material.dart';

import '../providers/app_text.dart';

mixin FormValidationMixin {
  
  final _passwordRegEx = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  final _upperCaseRegEx = RegExp(r'[A-Z]');
  final _lowerCaseRegEx = RegExp(r'[a-z]');
  final _numberRegEx = RegExp(r'[0-9]');
  final _emailRegEx = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  final _mobileRegEx = RegExp(r'^[0-9]{10}$');

  String? validateNull(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppText(context, isFunction: true).required;
    }
    return null;
  }

  String? validateOTP(BuildContext context, String? value) {
    if (value == null || value.isEmpty || value.length < 4) {
      return AppText(context, isFunction: true).otpRequired;
    }
    return null;
  }

  String? validateMobile(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppText(context, isFunction: true).mobilenumbercannotbeempty;
    }
    if (!_mobileRegEx.hasMatch(value)) {
      return AppText(context, isFunction: true).invalidmobilenumberMustbe10digits;
    }
    return null;
  }

  String? validateEmail(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppText(context, isFunction: true).emailcannotbeempty;
    }
    if (!_emailRegEx.hasMatch(value)) {
      return AppText(context, isFunction: true).iinvalidemailformat;
    }
    return null;
  }

  String? validatePassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppText(context, isFunction: true).passwordcannotbeempty;
    }

    if (value.length < 8) {
      return AppText(context, isFunction: true).passwordmustbeatleast8characterslong;
    }

    if (!value.contains(_upperCaseRegEx)) {
      return AppText(context, isFunction: true).passwordmustcontainatleast1uppercaseletter;
    }

    if (!value.contains(_lowerCaseRegEx)) {
      return AppText(context, isFunction: true).passwordmustcontainatleast1lowercaseletter;
    }

    if (!value.contains(_numberRegEx)) {
      return AppText(context, isFunction: true).passwordmustcontainatleast1number;
    }

    if (!_passwordRegEx.hasMatch(value)) {
      return AppText(context, isFunction: true).passwordmustincludeuppercaselowercaselettersandanumber;
    }

    return null;
  }
}

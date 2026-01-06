import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../../core/services/hive_services/box_kes.dart';
import '../../../../injection_container.dart';
import 'container_form_verify_b2b.dart';
import 'container_form_verify_b2c.dart';

class ContainerFormVerify extends StatelessWidget {
  final String mobile;
  final String? otp;
  const ContainerFormVerify({super.key, required this.mobile, this.otp});

  // Helper method to check if user is B2B Team
  bool _isB2BTeam() {
    try {
      final userTeam = sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.userTeam);
      return userTeam == 'B2B Team';
    } catch (e) {
      return false; // Default to B2C if error
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isB2B = _isB2BTeam();
    
    if (isB2B) {
      return ContainerFormVerifyB2B(mobile: mobile, otp: otp);
    } else {
      return ContainerFormVerifyB2C(mobile: mobile, otp: otp);
    }
  }
}

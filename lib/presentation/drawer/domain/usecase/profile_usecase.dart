import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_services/result_model.dart';
import '../../../auth/domain/model/user_model.dart';
import '../repository/profile_repository.dart';

class ProfileUsecase {
  final ProfileRepository profileRepository;
  ProfileUsecase({required this.profileRepository});

  Future<Either<Failure, Result<User>>> getProfile() async => await profileRepository.getProfile();

  Future<Either<Failure, Result<User>>> updateProfile({
    String? email,
    String? fullNameArabic,
    String? fullNameEnglish,
    String? mobileNumber,
    String? countryCode,
    String? gender,
    File? profileImage,
  }) async =>
      await profileRepository.updateProfile(
        email: email,
        fullNameArabic: fullNameArabic,
        fullNameEnglish: fullNameEnglish,
        mobileNumber: mobileNumber,
        countryCode: countryCode,
        gender: gender,
        profileImage: profileImage,
      );
}


import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../model/support_params.dart';
import '../repository/support_repository.dart';

class SupportUsecase {
  final SupportRepository supportRepository;
  SupportUsecase({required this.supportRepository});

  Future<Either<Failure, Unit>> sendSupport(SupportParams supportParams) async => await supportRepository.sendSupport(supportParams);
}

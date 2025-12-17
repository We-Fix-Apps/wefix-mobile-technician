import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_services/result_model.dart';
import '../repoistory/scan_repistory.dart';

class ScanUsecase {
  final ScanRepistory scanRepistory;
  ScanUsecase({required this.scanRepistory});
  Future<Either<Failure, Result<String>>> call(String qrCode) async => await scanRepistory.scan(qrCode);
}

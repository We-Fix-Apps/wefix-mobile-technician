import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_services/result_model.dart';
import '../model/contents_model.dart';
import '../repository/content_repository.dart';

class ContentUsecase {
  final ContentRepository contentRepository;
  ContentUsecase({required this.contentRepository});

  Future<Either<Failure, Result<ContentsModel>>> call() async => await contentRepository.getContent();
}

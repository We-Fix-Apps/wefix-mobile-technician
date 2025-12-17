import 'package:dartz/dartz.dart';

import '../../../errors/failure.dart';
import '../../../services/api_services/result_model.dart';
import '../model/language_model.dart';
import '../repoistory/language_repoistory.dart';

class LanguageUsecase {
  final LanguageRepoistory languageReoistory;

  LanguageUsecase({required this.languageReoistory});

  Future<Either<Failure, Result<AppLanguageModel>>> getLanguage() async => await languageReoistory.getLanguage();
}

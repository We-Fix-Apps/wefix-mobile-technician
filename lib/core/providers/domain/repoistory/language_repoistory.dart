import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../constant/app_links.dart';
import '../../../errors/dio_exp.dart';
import '../../../errors/failure.dart';
import '../../../services/api_services/api_client.dart';
import '../../../services/api_services/dio_helper.dart';
import '../../../services/api_services/result_model.dart';
import '../model/language_model.dart';

abstract class LanguageRepoistory {
  Future<Either<Failure, Result<AppLanguageModel>>> getLanguage();
}

class LanguageRepoistoryImpl implements LanguageRepoistory {
  final _clinet = ApiClient(DioProvider().dio);

  @override
  Future<Either<Failure, Result<AppLanguageModel>>> getLanguage() async {
    try {
      final responseLanguage = await _clinet.getRequest(endpoint: AppLinks.language);
      AppLanguageModel languageModel = AppLanguageModel.fromJson(responseLanguage.data);
      return Right(Result.success(languageModel));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

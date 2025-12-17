import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
 
import '../../../../core/constant/app_links.dart';
import '../../../../core/errors/dio_exp.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_services/api_client.dart';
import '../../../../core/services/api_services/dio_helper.dart';
import '../../../../core/services/api_services/result_model.dart';
import '../../../../core/services/hive_services/box_kes.dart';
import '../../../../injection_container.dart';
import '../model/contents_model.dart';

abstract class ContentRepository {
  Future<Either<Failure, Result<ContentsModel>>> getContent();
}

class ContentRepositoryImpl implements ContentRepository {
  @override
  Future<Either<Failure, Result<ContentsModel>>> getContent() async {
    try {
      final ApiClient client = ApiClient(DioProvider().dio);
      final token = await sl<Box>(instanceName: BoxKeys.appBox).get(BoxKeys.usertoken);
      final contentResponse = await client.getRequest(endpoint: AppLinks.about, authorization: 'Bearer $token');
      ContentsModel contentsModel = ContentsModel.fromJson(contentResponse.data);
      return Right(Result.success(contentsModel));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

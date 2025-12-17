import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_services/result_model.dart';
import '../model/home_model.dart';
import '../repoistory/home_repoistory.dart';

class HomeUsecase {
  final HomeRepoistory homeRepoistory;
  HomeUsecase({required this.homeRepoistory});

  Future<Either<Failure, Result<HomeModel>>> getHomeData() async => await homeRepoistory.getHomeData();
  Future<Either<Failure, Result<bool>>> checkUser() async => await homeRepoistory.checkUser();
}

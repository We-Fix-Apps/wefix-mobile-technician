import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_services/result_model.dart';
import '../../../auth/domain/model/user_model.dart';
import '../model/notification_model.dart';
import '../repository/layout_repoistory.dart';
import '../repository/notification_repository.dart';

class LayoutUsecase {
  final NotificationRepository notificationRepository;
  final LayoutRepoistory layoutRepoistory;

  LayoutUsecase({required this.layoutRepoistory, required this.notificationRepository});

  Future<Either<Failure, Result<User>>> profile() async => await layoutRepoistory.getProfile();
  Future<Either<Failure, Result<bool>>> checkAccess() async => await layoutRepoistory.checkAccess();
  Future<Either<Failure, Result<NotificationModel>>> getNotifications() async => await notificationRepository.getNotifications();
}

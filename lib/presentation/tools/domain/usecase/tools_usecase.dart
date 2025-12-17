import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_services/result_model.dart';
 import '../../../ticktes_details/domain/model/tickets_details_model.dart';
import '../repoistory/tools_repoistory.dart';

class ToolsUsecase {
  final ToolsRepoistory toolsRepoi;
  ToolsUsecase({required this.toolsRepoi});

  Future<Either<Failure, Result<List<TicketTool>>>> getDriverTools() async => await toolsRepoi.getDriverTools();
  Future<Either<Failure, Unit>> deleteDriverTools(int id) async => await toolsRepoi.deleteDriverTools(id);
}

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/client/api_url.dart';
import '/core/request/request.dart';
import '/feature/firm/data/repository/repo.dart';
import '../../../batch/domain/domain.dart';
import '../../domain/models/firm_model.dart';

part 'controller.g.dart';

@riverpod
Future<List<FirmModel>> fetchAllFirm(FetchAllFirmRef ref) async {
  final repository = ref.watch(firmRepositoryProvider);
  final firms = await repository.fetchAllFirm();
  return firms;
}

@riverpod
Future<List<ModelBatch>> fetchAllBatchByFirm(
    FetchAllBatchByFirmRef ref, String firmId) async {
  final client = ref.watch(requestClientStrategyProvider);

  return await client
      .request<List>(
        RequestOptions(
          path: ApiEndpoints.poultryBatches,
          method: "GET",
          queryParameters: {
            "firmId": firmId,
          },
        ),
      )
      .then(
        (value) => value.data!
            .map(
              (e) => ModelBatch.fromJson(e),
            )
            .toList(),
      );
}

@riverpod
Future<ModelBatchDetails> fetchBatchById(
    FetchBatchByIdRef ref, String batchId) async {
  // final client = ref.watch(requestClientProvider).client;
  final client = ref.watch(requestClientStrategyProvider);
  final result = await client
      .request(
        RequestOptions(
          path: "${ApiEndpoints.poultryBatches}/$batchId",
          method: "GET",
          queryParameters: {
            "batchId": batchId,
          },
        ),
      )
      .then((value) => ModelBatchDetails.fromJson(value.data!));

  return result;
}

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/request/request.dart';
import '/feature/auth/data/remote/remote.dart';

part 'client.g.dart';

const baseUrl = "https://poultrymanagerbd.com/api";

@Riverpod(keepAlive: true)
RequestStrategy requestClientStrategy(RequestClientStrategyRef ref) {
  final user = ref.watch(authRepositoryProvider).currentUser;

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 20),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  return AddBearerTokenStrategy(
    HandleErrorStrategy(
      RequestClient(dio),
    ),
    user?.token,
  );
}

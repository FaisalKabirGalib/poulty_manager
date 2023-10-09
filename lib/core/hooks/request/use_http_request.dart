import 'package:dio/dio.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/core/request/request.dart';

part 'use_http_request.g.dart';

@riverpod
AsyncValue useRequest<R>(UseRequestRef ref, RequestOptions requestOptions) {
  final strategy = ref.watch(requestClientStrategyProvider);
  requestRunner() => strategy.request<R>(requestOptions);
  return useRequestHook(requestRunner);
}

AsyncValue<T> useRequestHook<T>(Future<Response<T>> Function() request) {
  //use the useCallback hook to handle the request
  final result = useState<AsyncValue<T>>(const AsyncValue.loading());

  final requestFunc = useCallback(request, [request]);

  requestFunc().then((value) {
    result.value = AsyncValue.data(value.data as T);
  }).catchError((error, st) {
    result.value = AsyncValue.error(error, st);
  });

  return result.value;
}

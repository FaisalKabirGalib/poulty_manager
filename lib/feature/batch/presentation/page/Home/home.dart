import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poulty_manager/core/client/api_url.dart';
import 'package:poulty_manager/core/hooks/request/use_http_request.dart';
import 'package:styled_widget/styled_widget.dart';

import '/core/widget/async/async_value_widget.dart';

class BatchMainHome extends HookConsumerWidget {
  const BatchMainHome({Key? key, required this.firmId}) : super(key: key);
  final String firmId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchBatchList = ref.watch(
      useRequestProvider(
        RequestOptions(
          path: ApiEndpoints.poultryBatches,
          method: "GET",
          queryParameters: {
            "firmId": firmId,
          },
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Styled.text("ব্যাচ ম্যানেজমেন্ট")
            .textColor(Colors.white)
            .fontSize(18),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          AsyncValueWidget(
            value: fetchBatchList,
            data: (batches) {
              return Text(batches.toString());
              // return ListView.builder(
              //   itemCount: batches.length,
              //   itemBuilder: (context, index) {
              //     final batch = batches[index];
              //     return SingleBatchShow(batch: batch, serial: index + 1);
              //   },
              // );
            },
          ).padding(horizontal: 10, vertical: 16),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {
                context.push("/firm/$firmId/batch/new");
              },
              child: const Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}

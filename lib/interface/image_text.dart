import 'package:flutter/material.dart';
import 'package:poulty_manager/gen/assets.gen.dart';
import 'package:styled_widget/styled_widget.dart';

import '../config/theme/color.dart';

interface class ImageWithText {
  final Widget image;
  final Widget text;
  final Function? onPressed;

  ImageWithText(
      {required this.image, required this.text, required this.onPressed});
}

class CreateGridItem implements ImageWithText {
  @override
  final Widget image;
  @override
  final Widget text;
  @override
  final Function? onPressed;

  CreateGridItem(
      {required this.image, required this.text, required this.onPressed});

  factory CreateGridItem.init(AssetGenImage img, String text, [Function? fn]) {
    return CreateGridItem(
      image: img.image(
        height: 50,
      ),
      text: Styled.text(text).fontSize(10),
      onPressed: fn,
    );
  }
}

extension GridHelper on List<ImageWithText> {
  Widget grid({
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    int? crossAxisCount,
    double mainAxisSpacing = 0.0,
    double crossAxisSpacing = 0.0,
    double childAspectRatio = 1.0,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double? cacheExtent,
    List<Widget> children = const <Widget>[],
    int? semanticChildCount,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    String? restorationId,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shadowColor: Colors.grey[200],
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Styled.text('হেডিং টেক্সট ').bold().padding(left: 10, top: 10),
          GridView.count(
            crossAxisCount: crossAxisCount ?? 4,
            shrinkWrap: shrinkWrap,
            primary: primary,
            physics: const NeverScrollableScrollPhysics(),
            children: map(
              (e) => gridItem(e),
            ).toList(),
          )
        ],
      ),
    );
  }

  Widget gridItem(ImageWithText item) {
    return InkWell(
      onTap: item.onPressed as void Function()?,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          item.image,
          item.text,
        ],
      ),
    );
  }
}

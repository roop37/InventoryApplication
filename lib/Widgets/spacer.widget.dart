import 'package:flutter/material.dart';

// ignore: constant_identifier_names

class SpacerWidget extends StatelessWidget {
  const SpacerWidget({Key? key, this.height, this.width}) : super(key: key);

  final double? height;
  final double? width;

  const SpacerWidget.vertical(this.height, {Key? key})
      : width = null,
        super(key: key);

  const SpacerWidget.horizontal(this.width, {Key? key})
      : height = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}

class SliverSpacer extends StatelessWidget {
  final double? height;
  final double? width;

  const SliverSpacer({Key? key, this.height, this.width}) : super(key: key);

  const SliverSpacer.vertical(this.height, {Key? key})
      : width = null,
        super(key: key);

  const SliverSpacer.horizontal(this.width, {Key? key})
      : height = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SpacerWidget(height: height, width: width),
    );
  }
}

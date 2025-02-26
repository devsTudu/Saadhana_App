import '/flutter_flow/flutter_flow_util.dart';
import 'balance_page_widget.dart' show BalancePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BalancePageModel extends FlutterFlowModel<BalancePageWidget> {
  ///  Local state fields for this page.
  /// Current Balance of the user
  int? currBal = 10;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

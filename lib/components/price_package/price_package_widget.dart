import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'price_package_model.dart';
export 'price_package_model.dart';

class PricePackageWidget extends StatefulWidget {
  const PricePackageWidget({
    super.key,
    String? title,
    required this.points,
    int? price,
  })  : this.title = title ?? 'title',
        this.price = price ?? 100;

  /// Name of Product
  final String title;

  /// Points that will be received
  final int? points;

  /// Price to be paid
  final int price;

  @override
  State<PricePackageWidget> createState() => _PricePackageWidgetState();
}

class _PricePackageWidgetState extends State<PricePackageWidget> {
  late PricePackageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PricePackageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.title,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
            ),
            Text(
              valueOrDefault<String>(
                widget.points?.toString(),
                '100',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
            ),
            Text(
              valueOrDefault<String>(
                widget.price.toString(),
                '10',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

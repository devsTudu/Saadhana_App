import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'habit_suggestion_item_model.dart';
export 'habit_suggestion_item_model.dart';

class HabitSuggestionItemWidget extends StatefulWidget {
  const HabitSuggestionItemWidget({
    super.key,
    String? title,
    required this.description,
    required this.displayIcon,
    Color? iconColor,
  })  : this.title = title ?? 'Daily Practice',
        this.iconColor = iconColor ?? const Color(0xFF72F677);

  final String title;

  /// Short Description
  final String? description;

  /// Display Icon for attraction
  final Widget? displayIcon;

  /// Color of the display Icon
  final Color iconColor;

  @override
  State<HabitSuggestionItemWidget> createState() =>
      _HabitSuggestionItemWidgetState();
}

class _HabitSuggestionItemWidgetState extends State<HabitSuggestionItemWidget> {
  late HabitSuggestionItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HabitSuggestionItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: 160.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).accent1,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: widget.displayIcon!,
              ),
              Text(
                valueOrDefault<String>(
                  widget.title,
                  'Name Habit',
                ),
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.description,
                  'Daily practice of this healthy habit for better life',
                ).maybeHandleOverflow(
                  maxChars: 60,
                ),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
              ),
            ].divide(SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}

import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'journal_card_special_model.dart';
export 'journal_card_special_model.dart';

class JournalCardSpecialWidget extends StatefulWidget {
  const JournalCardSpecialWidget({
    super.key,
    required this.journalAddress,
  });

  /// address of the journal
  final JournalAddressStruct? journalAddress;

  @override
  State<JournalCardSpecialWidget> createState() =>
      _JournalCardSpecialWidgetState();
}

class _JournalCardSpecialWidgetState extends State<JournalCardSpecialWidget> {
  late JournalCardSpecialModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalCardSpecialModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      constraints: BoxConstraints(
        minWidth: MediaQuery.sizeOf(context).width * 0.35,
        minHeight: MediaQuery.sizeOf(context).height * 0.1,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    valueOrDefault<String>(
                      FFAppState()
                          .userhabit
                          .elementAtOrNull(widget.journalAddress!.habitidx)
                          ?.title,
                      'Name Habit',
                    ).maybeHandleOverflow(
                      maxChars: 15,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      dateTimeFormat(
                        "relative",
                        (FFAppState()
                                .userhabit
                                .elementAtOrNull(
                                    widget.journalAddress!.habitidx)
                                ?.journal
                                .elementAtOrNull(
                                    widget.journalAddress!.journalidx))
                            ?.date,
                        locale: FFLocalizations.of(context).languageShortCode ??
                            FFLocalizations.of(context).languageCode,
                      ),
                      'Date Written',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, -1.0),
              child: MarkdownBody(
                data: valueOrDefault<String>(
                  (FFAppState()
                          .userhabit
                          .elementAtOrNull(widget.journalAddress!.habitidx)
                          ?.journal
                          .elementAtOrNull(widget.journalAddress!.journalidx))
                      ?.contentJournal,
                  'comment',
                ),
                selectable: true,
                onTapLink: (_, url, __) => launchURL(url!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

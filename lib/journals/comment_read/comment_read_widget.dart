import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'comment_read_model.dart';
export 'comment_read_model.dart';

class CommentReadWidget extends StatefulWidget {
  const CommentReadWidget({
    super.key,
    required this.indexHabit,
    required this.indexJournal,
  });

  final int? indexHabit;
  final int? indexJournal;

  static String routeName = 'comment_read';
  static String routePath = '/commentRead';

  @override
  State<CommentReadWidget> createState() => _CommentReadWidgetState();
}

class _CommentReadWidgetState extends State<CommentReadWidget> {
  late CommentReadModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentReadModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'comment_read'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            fillColor: FlutterFlowTheme.of(context).primary,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
            onPressed: () async {
              logFirebaseEvent('COMMENT_READ_PAGE_arrow_back_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.safePop();
            },
          ),
          title: Text(
            valueOrDefault<String>(
              FFAppState()
                  .userhabit
                  .elementAtOrNull(widget.indexHabit!)
                  ?.title,
              'Habit Name',
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'ta9tgzo3' /* Added on */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            dateTimeFormat(
                              "MMMEd",
                              (FFAppState()
                                      .userhabit
                                      .elementAtOrNull(widget.indexHabit!)
                                      ?.journal
                                      .elementAtOrNull(widget.indexJournal!))
                                  ?.date,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            'Mar 31, 2025',
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'glj1v1xd' /* Writen By */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            (FFAppState()
                                    .userhabit
                                    .elementAtOrNull(widget.indexHabit!)
                                    ?.journal
                                    .elementAtOrNull(widget.indexJournal!))
                                ?.writer,
                            'Writer Name',
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'lmy7m1es' /* Hidden from AI */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Builder(
                          builder: (context) {
                            if (valueOrDefault<bool>(
                              (FFAppState()
                                      .userhabit
                                      .elementAtOrNull(widget.indexHabit!)
                                      ?.journal
                                      .elementAtOrNull(widget.indexJournal!))
                                  ?.secret,
                              true,
                            )) {
                              return Text(
                                FFLocalizations.of(context).getText(
                                  '8gm0fchn' /* Yes 🔒 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              );
                            } else {
                              return Text(
                                FFLocalizations.of(context).getText(
                                  'd5mc7edu' /* No 🔓 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                  child: MarkdownBody(
                    data: valueOrDefault<String>(
                      (FFAppState()
                              .userhabit
                              .elementAtOrNull(widget.indexHabit!)
                              ?.journal
                              .elementAtOrNull(widget.indexJournal!))
                          ?.contentJournal,
                      'Habit Comment',
                    ),
                    selectable: true,
                    onTapLink: (_, url, __) => launchURL(url!),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

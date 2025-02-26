import '/components/ask_a_i_page/ask_a_i_page_widget.dart';
import '/components/comment_block/comment_block_widget.dart';
import '/components/journal_page/journal_page_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'habit_view_model.dart';
export 'habit_view_model.dart';

class HabitViewWidget extends StatefulWidget {
  const HabitViewWidget({
    super.key,
    required this.index,
  });

  /// Location of this habit in the list
  final int? index;

  static String routeName = 'habit_view';
  static String routePath = '/habitView';

  @override
  State<HabitViewWidget> createState() => _HabitViewWidgetState();
}

class _HabitViewWidgetState extends State<HabitViewWidget>
    with TickerProviderStateMixin {
  late HabitViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HabitViewModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'habit_view'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HABIT_VIEW_PAGE_habit_view_ON_INIT_STATE');
      logFirebaseEvent('habit_view_update_page_state');
      _model.dateLists = FFAppState()
          .userhabit
          .elementAtOrNull(widget.index!)!
          .dates
          .toList()
          .cast<DateTime>();
      safeSetState(() {});
      logFirebaseEvent('habit_view_update_page_state');
      _model.doneToday = valueOrDefault<int>(
        functions.numberOfTimesToday(_model.dateLists.toList()),
        0,
      );
      _model.totalDone = functions.numberOfDays(_model.dateLists.toList());
      _model.allComments = functions.combineAllComments(FFAppState()
          .userhabit
          .elementAtOrNull(widget.index!)
          ?.journal
          .toList());
      safeSetState(() {});
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.698, 0),
            end: Offset(0, 0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.698, 0),
            end: Offset(0, 0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.698, 0),
            end: Offset(0, 0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      logFirebaseEvent('HABIT_VIEW_PAGE_habit_view_ON_DISPOSE');
      if (_model.doneToday <= 0) {
        logFirebaseEvent('habit_view_update_app_state');
        FFAppState().updateUserhabitAtIndex(
          widget.index!,
          (e) => e..score = 0.0,
        );
        FFAppState().update(() {});
      } else {
        logFirebaseEvent('habit_view_update_app_state');
        FFAppState().updateUserhabitAtIndex(
          widget.index!,
          (e) => e
            ..score = valueOrDefault<double>(
              _model.totalDone /
                  (valueOrDefault<int>(
                        functions
                            .numberOfDaysFromStart(_model.dateLists.toList()),
                        1,
                      ) +
                      1) *
                  10,
              0.0,
            ),
        );
        FFAppState().update(() {});
      }

      logFirebaseEvent('habit_view_update_app_state');
      FFAppState().isDarkMode = false;
      safeSetState(() {});
    }();

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('HABIT_VIEW_PAGE_Icon_nd2fmesr_ON_TAP');
              logFirebaseEvent('Icon_navigate_back');
              context.safePop();
            },
            child: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'ztln9x0f' /* Habit Details */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              if (FFAppState()
                      .userhabit
                      .elementAtOrNull(widget.index!)
                      ?.hasDue ??
                  true)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: Text(
                    'Due ${dateTimeFormat(
                      "relative",
                      FFAppState()
                          .userhabit
                          .elementAtOrNull(widget.index!)
                          ?.dueDate,
                      locale: FFLocalizations.of(context).languageCode,
                    )}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('HABIT_VIEW_PAGE_Icon_8yti5hy5_ON_TAP');
                  logFirebaseEvent('Icon_alert_dialog');
                  var confirmDialogResponse = await showDialog<bool>(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Delete Confirm'),
                            content: Text(
                                'Are you sure, you want to remove \"${valueOrDefault<String>(
                              FFAppState()
                                  .userhabit
                                  .elementAtOrNull(widget.index!)
                                  ?.title,
                              'Habit',
                            )}\" as Habit'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: Text('Confirm'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;
                  if (confirmDialogResponse) {
                    logFirebaseEvent('Icon_update_app_state');
                    FFAppState().removeAtIndexFromUserhabit(widget.index!);
                    FFAppState().update(() {});
                    logFirebaseEvent('Icon_show_snack_bar');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Habit not deleted',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).accent3,
                      ),
                    );
                  } else {
                    logFirebaseEvent('Icon_navigate_back');
                    context.safePop();
                    logFirebaseEvent('Icon_show_snack_bar');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Habit not deleted',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).accent2,
                      ),
                    );
                  }
                },
                child: Icon(
                  Icons.delete_forever,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 3.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            1.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 5.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                    "relative",
                                    FFAppState()
                                        .userhabit
                                        .elementAtOrNull(widget.index!)
                                        ?.createDate,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  'Created date',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 5.0, 10.0, 0.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, -1.0),
                                        child: AutoSizeText(
                                          valueOrDefault<String>(
                                            FFAppState()
                                                .userhabit
                                                .elementAtOrNull(widget.index!)
                                                ?.title,
                                            'Habit Name',
                                          ).maybeHandleOverflow(
                                            maxChars: 30,
                                            replacement: '…',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      FFAppState()
                                          .userhabit
                                          .elementAtOrNull(widget.index!)
                                          ?.description,
                                      'Description a very very long sentences will be here and lots of space will be used here so need to be cautious about this space and look',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '00fseq0w' /* Today */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'HABIT_VIEW_ConditionalBuilder_php4ovkt_O');
                                        logFirebaseEvent(
                                            'ConditionalBuilder_update_app_state');
                                        FFAppState().updateUserhabitAtIndex(
                                          widget.index!,
                                          (e) => e
                                            ..updateDates(
                                              (e) => e.add(getCurrentTimestamp),
                                            ),
                                        );
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'ConditionalBuilder_update_page_state');
                                        _model.dateLists = FFAppState()
                                            .userhabit
                                            .elementAtOrNull(widget.index!)!
                                            .dates
                                            .toList()
                                            .cast<DateTime>();
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'ConditionalBuilder_update_page_state');
                                        _model.doneToday = valueOrDefault<int>(
                                          functions.numberOfTimesToday(
                                              _model.dateLists.toList()),
                                          0,
                                        );
                                        _model.totalDone =
                                            functions.numberOfDays(
                                                _model.dateLists.toList());
                                        safeSetState(() {});
                                      },
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.doneToday > 0) {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'HABIT_VIEW_PAGE_done_icon_ON_TAP');
                                                logFirebaseEvent(
                                                    'done_icon_update_app_state');
                                                FFAppState()
                                                    .updateUserhabitAtIndex(
                                                  widget.index!,
                                                  (e) => e
                                                    ..updateDates(
                                                      (e) => e.add(
                                                          getCurrentTimestamp),
                                                    ),
                                                );
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'done_icon_update_page_state');
                                                _model.dateLists = FFAppState()
                                                    .userhabit
                                                    .elementAtOrNull(
                                                        widget.index!)!
                                                    .dates
                                                    .toList()
                                                    .cast<DateTime>();
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'done_icon_update_page_state');
                                                _model.doneToday =
                                                    valueOrDefault<int>(
                                                  functions.numberOfTimesToday(
                                                      _model.dateLists
                                                          .toList()),
                                                  0,
                                                );
                                                _model.totalDone =
                                                    functions.numberOfDays(
                                                        _model.dateLists
                                                            .toList());
                                                safeSetState(() {});
                                              },
                                              onDoubleTap: () async {
                                                logFirebaseEvent(
                                                    'HABIT_VIEW_PAGE_done_icon_ON_DOUBLE_TAP');
                                                if (_model.doneToday > 0) {
                                                  logFirebaseEvent(
                                                      'done_icon_update_page_state');
                                                  _model.dateLists = functions
                                                      .removeTodays(_model
                                                          .dateLists
                                                          .toList())
                                                      .toList()
                                                      .cast<DateTime>();
                                                  safeSetState(() {});
                                                  logFirebaseEvent(
                                                      'done_icon_update_app_state');
                                                  FFAppState()
                                                      .updateUserhabitAtIndex(
                                                    widget.index!,
                                                    (e) => e
                                                      ..updateDates(
                                                        (e) => e.removeAt(
                                                            functions.numberOfDays(
                                                                _model.dateLists
                                                                    .toList())),
                                                      ),
                                                  );
                                                  safeSetState(() {});
                                                }
                                                logFirebaseEvent(
                                                    'done_icon_update_page_state');
                                                _model.dateLists = FFAppState()
                                                    .userhabit
                                                    .elementAtOrNull(
                                                        widget.index!)!
                                                    .dates
                                                    .toList()
                                                    .cast<DateTime>();
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'done_icon_update_page_state');
                                                _model.doneToday =
                                                    valueOrDefault<int>(
                                                  functions.numberOfTimesToday(
                                                      _model.dateLists
                                                          .toList()),
                                                  0,
                                                );
                                                _model.totalDone =
                                                    functions.numberOfDays(
                                                        _model.dateLists
                                                            .toList());
                                                _model.dateLists = FFAppState()
                                                    .userhabit
                                                    .elementAtOrNull(
                                                        widget.index!)!
                                                    .dates
                                                    .toList()
                                                    .cast<DateTime>();
                                                safeSetState(() {});
                                              },
                                              child: Icon(
                                                Icons.done_all,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            );
                                          } else {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'HABIT_VIEW_PAGE_not_done_ON_TAP');
                                                logFirebaseEvent(
                                                    'not_done_update_app_state');
                                                FFAppState()
                                                    .updateUserhabitAtIndex(
                                                  widget.index!,
                                                  (e) => e
                                                    ..updateDates(
                                                      (e) => e.add(
                                                          getCurrentTimestamp),
                                                    ),
                                                );
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'not_done_update_page_state');
                                                _model.dateLists = FFAppState()
                                                    .userhabit
                                                    .elementAtOrNull(
                                                        widget.index!)!
                                                    .dates
                                                    .toList()
                                                    .cast<DateTime>();
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'not_done_update_page_state');
                                                _model.doneToday =
                                                    valueOrDefault<int>(
                                                  functions.numberOfTimesToday(
                                                      _model.dateLists
                                                          .toList()),
                                                  0,
                                                );
                                                _model.totalDone =
                                                    functions.numberOfDays(
                                                        _model.dateLists
                                                            .toList());
                                                safeSetState(() {});
                                              },
                                              child: Icon(
                                                Icons.check,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        _model.doneToday.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'to2zb9ob' /* / */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        _model.totalDone.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'skcugqzw' /*  Overall */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation1']!),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            1.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          StickyHeader(
                            overlapHeaders: false,
                            header: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'mbkn9ltj' /* Comments */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HABIT_VIEW_PAGE_Icon_jqn84o3g_ON_TAP');
                                            logFirebaseEvent(
                                                'Icon_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: AskAIPageWidget(
                                                      index: widget.index!,
                                                      comments:
                                                          _model.allComments,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Icon(
                                            Icons.smart_toy,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HABIT_VIEW_PAGE_Icon_2pkbrnjt_ON_TAP');
                                            logFirebaseEvent(
                                                'Icon_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: Container(
                                                      height: 350.0,
                                                      child: JournalPageWidget(
                                                        index: widget.index!,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Icon(
                                            Icons.comment_bank,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            content: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Builder(
                                      builder: (context) {
                                        final journalList = FFAppState()
                                                .userhabit
                                                .elementAtOrNull(widget.index!)
                                                ?.journal
                                                .sortedList(
                                                    keyOf: (e) => e.date!,
                                                    desc: true)
                                                .toList() ??
                                            [];

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: journalList.length,
                                          itemBuilder:
                                              (context, journalListIndex) {
                                            final journalListItem =
                                                journalList[journalListIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 1.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 0.0,
                                                      color: Color(0xFFE0E3E7),
                                                      offset: Offset(
                                                        0.0,
                                                        1.0,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .commentBlockModels
                                                      .getModel(
                                                    journalListIndex.toString(),
                                                    journalListIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: CommentBlockWidget(
                                                    key: Key(
                                                      'Keyxev_${journalListIndex.toString()}',
                                                    ),
                                                    commenter:
                                                        valueOrDefault<String>(
                                                      (FFAppState()
                                                              .userhabit
                                                              .elementAtOrNull(
                                                                  widget
                                                                      .index!)
                                                              ?.journal
                                                              .elementAtOrNull(
                                                                  journalListIndex))
                                                          ?.writer,
                                                      '[User]',
                                                    ),
                                                    content:
                                                        valueOrDefault<String>(
                                                      (FFAppState()
                                                              .userhabit
                                                              .elementAtOrNull(
                                                                  widget
                                                                      .index!)
                                                              ?.journal
                                                              .elementAtOrNull(
                                                                  journalListIndex))
                                                          ?.contentJournal,
                                                      'Content of journal',
                                                    ),
                                                    time: FFAppState()
                                                        .userhabit
                                                        .elementAtOrNull(
                                                            widget.index!)!
                                                        .journal
                                                        .elementAtOrNull(
                                                            journalListIndex)!
                                                        .date!,
                                                    idxJournal:
                                                        journalListIndex,
                                                    idxHabit: widget.index!,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation2']!),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 24.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            1.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation3']!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

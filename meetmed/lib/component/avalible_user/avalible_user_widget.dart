import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'avalible_user_model.dart';
export 'avalible_user_model.dart';

class AvalibleUserWidget extends StatefulWidget {
  const AvalibleUserWidget({super.key});

  @override
  State<AvalibleUserWidget> createState() => _AvalibleUserWidgetState();
}

class _AvalibleUserWidgetState extends State<AvalibleUserWidget> {
  late AvalibleUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvalibleUserModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: StreamBuilder<List<UsersRecord>>(
            stream: queryUsersRecord(
              queryBuilder: (usersRecord) => usersRecord.where(
                'role',
                isEqualTo: 'med',
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<UsersRecord> columnUsersRecordList =
                  snapshot.data!.where((u) => u.uid != currentUserUid).toList();

              return Column(
                mainAxisSize: MainAxisSize.max,
                children:
                    List.generate(columnUsersRecordList.length, (columnIndex) {
                  final columnUsersRecord = columnUsersRecordList[columnIndex];
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: Color(0x4D4B986C),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40.0),
                              child: Image.network(
                                columnUsersRecord.photoUrl,
                                width: 80.0,
                                height: 80.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  columnUsersRecord.displayName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.black,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Text(
                                  'Pediatrician',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              await ChatsRecord.collection.doc().set({
                                ...createChatsRecordData(
                                  time: getCurrentTimestamp,
                                  lastmessage: 'need help',
                                ),
                                ...mapToFirestore(
                                  {
                                    'userid': functions.users(
                                        currentUserReference!,
                                        columnUsersRecord.reference),
                                    'userNames': functions.listname(
                                        currentUserDisplayName,
                                        columnUsersRecord.displayName),
                                  },
                                ),
                              });

                              context.pushNamed('book');
                            },
                            text: 'meet',
                            options: FFButtonOptions(
                              width: 80.0,
                              height: 36.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF4B986C),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                    ),
                  );
                }).divide(SizedBox(height: 0.0)),
              );
            },
          ),
        ),
      ),
    );
  }
}

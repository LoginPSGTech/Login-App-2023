import 'package:flutter/cupertino.dart';
import 'package:login/api/auth.dart';
import 'package:login/models/team.dart';

import 'api.dart';
import 'endpoints.dart';

class TeamEventApi {
  static Future<void> createTeam(CreateTeamModel createTeam, BuildContext context) async {
    Function authPostUser = await AuthApi.payloadAuth(ApiWrapper.post, context);
    await authPostUser(ApiEndpoints.createTeam, createTeam.toJson(), authenticate: true);
  }

  static Future<void> joinTeam(JoinTeamModel joinTeam, BuildContext context) async {
    Function authJoinTeam = await AuthApi.payloadAuth(ApiWrapper.post, context);
    await authJoinTeam(ApiEndpoints.joinTeam, joinTeam.toJson(), authenticate: true);
  }

  static Future<void> deregisterEvent(String eventId, BuildContext context) async {
    Function authDeregisterEvent = await AuthApi.payloadLessAuth(ApiWrapper.delete, context);
    await authDeregisterEvent("${ApiEndpoints.registerEvent}$eventId", authenticate: true);
  }
}

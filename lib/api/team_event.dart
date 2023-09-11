import 'package:login/api/auth.dart';
import 'package:login/models/team.dart';

import 'api.dart';
import 'endpoints.dart';

class TeamEventApi {
  static Future<void> createTeam(CreateTeamModel createTeam) async {
    Function authPostUser = await AuthApi.payloadAuth(ApiWrapper.post);
    await authPostUser(ApiEndpoints.createTeam, createTeam.toJson(), authenticate: true);
  }

  static Future<void> joinTeam(JoinTeamModel joinTeam) async {
    Function authJoinTeam = await AuthApi.payloadAuth(ApiWrapper.post);
    await authJoinTeam(ApiEndpoints.joinTeam, joinTeam.toJson(), authenticate: true);
  }

  static Future<void> deregisterEvent(String eventId) async {
    Function authDeregisterEvent = await AuthApi.payloadLessAuth(ApiWrapper.delete);
    await authDeregisterEvent("${ApiEndpoints.registerEvent}$eventId", authenticate: true);
  }
}

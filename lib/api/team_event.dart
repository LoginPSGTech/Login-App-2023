import 'package:login/api/auth.dart';
import 'package:login/models/team_event.dart';

import 'api.dart';
import 'endpoints.dart';

class TeamEventApi {
  static Future<void> createTeam(TeamEventModel teamEvent) async {
    Function authPostUser = await AuthApi.authPost(ApiWrapper.post);
    await authPostUser(ApiEndpoints.registerEvent, teamEvent.toJson(), authenticate: true);
  }

  static Future<void> joinTeam(TeamEventModel teamEvent) async {
    Function authPostUser = await AuthApi.authPost(ApiWrapper.post);
    await authPostUser(ApiEndpoints.joinTeam, teamEvent.toJson(), authenticate: true);
  }
}

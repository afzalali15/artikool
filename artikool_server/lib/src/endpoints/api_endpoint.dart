import 'package:serverpod/serverpod.dart';

class ApiEndpoint extends Endpoint {
  Future<String> getDays(Session session, DateTime dob) async {
    Duration diff = DateTime.now().difference(dob);
    if (diff.isNegative) return 'You look like a time traveler, aren\'t you?';

    return 'You have spent ${diff.inDays} day(s) on earth.';
  }
}

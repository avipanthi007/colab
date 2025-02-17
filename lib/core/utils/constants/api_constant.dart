import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String baseUrl = dotenv.get("BaseUrl");
  static String login = "/validUser";
  static String expiredPermits =
      "/permit_trigger_list?client_id=1&project_id=1&mainId=35&type_of_date=EXPIRED&status=null&page=1";
}

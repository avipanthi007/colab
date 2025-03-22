import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  
  static String baseUrl = dotenv.get("BaseUrl");
  static String login = "/validUser";
  static String expiredPermits = "/permit_trigger_list";
  static String approvers = "/drawing_employees_v01";
  static String contractors = "/get_contractor_for_debit_v01";
  static String labours = "/trade_v01";
  static String location = "/get_locations_v01";
  static String permitCount = "/get_permit_type_counts";
  static String subLocation = "/get_sub_locations_v01";
  static String subsubLocation = "/get_sub_sub_locations_v01";
  static String activityHead = "/get_activity_head";
  static String linkingActivity = "/get_linking_activity";
  static String triggerPermit = "/save_permit_trigger";
  static String triggerConfig = "/permit?client_id=1&project_id=1";
}

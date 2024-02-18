class Apis {
  static const String posts = "/posts";

  static const String POSTS_BASE_URL = "https://jsonplaceholder.typicode.com";

  static const String UTKORSHO_BASE_URL = "http://10.10.10.31:38080";

  static const String class_endpoint = "/api/v1/classes";

  static const String UTKORSHO_BASE_URL_CS =
      "http://10.10.10.31:28089/course-service/";

  static const String auth_login =
      "/auth/login"; //post method requires login id and password

  static const String auth_register =
      "/auth/register"; //post method requires name, phone, gender, religion, dist, email, pass, parentPhone, boardId, examYearId, sessionId, groupId, classId

  static const String group_endpoint = "api/v1/groups";

  static const String add_group_endpoint =
      "api/v1/groups"; //post method requires group name as payload

  static const String delete_group_endpoint =
      "api/v1/groups/{groupId}"; //post method requires group id as payload

  static const String edit_group_endpoint =
      "api/v1/groups/{groupId}"; //post method requires group id as payload

  static const String get_single_group_endpoint =
      "api/v1/groups/{groupId}"; //post method requires group id as payload

  static const String test_endpoint =
      "/api/v1/hello"; //get method requires access token in the header
}

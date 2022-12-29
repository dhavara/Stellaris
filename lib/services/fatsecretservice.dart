part of 'services.dart';

class FatsecretService {
  static Future<List<SearchFood>> searchFood(
      String query, int pageNumber, AccessTokenResponse accessToken) async {
    // if (accessToken.isExpired()) {
    //   AccessTokenService().refreshAccessToken(accessToken, Const.clientId);
    // }

    Map<String, String> queryParams = {
      'method': 'foods.search',
      'search_expression': query,
      'page_number': pageNumber.toString(),
      'format': 'json',
    };

    var response = await http.get(
      Uri.https(Const.baseUrl, "/rest/server.api", queryParams),
      headers: <String, String>{
        'Content-Type': 'application/json;',
        'Authorization': 'Bearer ${accessToken.accessToken}'
      },
    );

    Map<String, dynamic> job = json.decode(response.body);
    List<SearchFood> result = [];
    if (response.statusCode == 200) {
      if (job['foods']['food'] != null) {
        result = (job['foods']['food'] as List)
            .map((e) => SearchFood.fromMap(e))
            .toList();
      }
    }
    print(result);

    return result;
  }

  static Future<List<Food>> getFood(
      String foodId, AccessTokenResponse accessToken) async {
    // if (accessToken.isExpired()) {
    //   AccessTokenService().refreshAccessToken(accessToken, Const.clientId);
    // }

    Map<String, String> queryParams = {
      'method': 'food.get.v2',
      'food_id': foodId,
      'format': 'json',
    };

    var response = await http.get(
      Uri.https(Const.baseUrl, "/rest/server.api", queryParams),
      headers: <String, String>{
        'Content-Type': 'application/json;',
        'Authorization': 'Bearer ${accessToken.accessToken}'
      },
    );

    var job = json.decode(response.body); // For some reason this returns an _InternalLinkedHashMap<String, dynamic>, assertion or cast won't fix
    var foodJson = json.encode(job['food']); // "Recreating" the JSON works fine
    List<Food> result = [];
    print(foodJson);
    if (response.statusCode == 200) {
      Food data = Food.fromJson(foodJson); // Initialize Food model from the recreated JSON
      result.add(data); // Add the model to the List so it can return as a List
    }
    print(result);

    return result;
  }
}

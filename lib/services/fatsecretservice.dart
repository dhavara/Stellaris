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
        'Content-Type': 'application/json;' 'charset=UTF-8',
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
        'Content-Type': 'application/json;' 'charset=UTF-8',
        'Authorization': 'Bearer ${accessToken.accessToken}'
      },
    );

    Map<String, dynamic> job = json.decode(response.body);
    List<Food> result = [];
    print(job);
    print(job['food']);
    if (response.statusCode == 200) {
      if (job['food'] != null) {
        result = (job['food'] as List)
          .map((e) => Food.fromMap(e))
          .toList();
        // Food food = (job['food']).map((e) => Food.fromMap(e));
        // result.add(food);
      }
    }

    return result;
  }
}

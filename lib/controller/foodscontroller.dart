part of 'controller.dart';

class FoodsController {
  // Handling API Request from AccessTokenService
  static Future<AccessTokenResponse> reqAccessToken(
      String clientId, String clientSecret) async {
    AccessTokenResponse? accessToken;
    await AccessTokenService()
        .requestAccessToken(clientId, clientSecret)
        .then((value) {
      accessToken = value;
    });
    return accessToken!;
  }

  // Handling API Request from FatsecretService
  static Future<dynamic> getSearchData(
      String expression, int page, List<SearchFood> foodsList) async {
    bool isLoading = true;

    print(page);
    await FatsecretService.searchFood(expression, page,
            await reqAccessToken(Const.clientId, Const.clientSecret))
        .then((value) {
      if (page == 1) {
        foodsList = value;
        isLoading = false;
      } else {
        foodsList += value;
        isLoading = false;
      }
    });
    return [foodsList, isLoading];
  }

  // Handling API Request from FatsecretService
  static Future<dynamic> getFoodData(String foodId) async {
    List<Food> foodList = [];
    bool isLoading = true;
    await FatsecretService.getFood(
            foodId, await reqAccessToken(Const.clientId, Const.clientSecret))
        .then((value) {
      foodList = value;
      isLoading = false;
    });
    return [foodList, isLoading];
  }
}

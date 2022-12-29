part of '../../pages.dart';

class FoodDetailPage extends StatefulWidget {
  final String? foodId;
  final String? brandName;

  FoodDetailPage(this.foodId, this.brandName);

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  bool isLoading = true;

  late Future<AccessTokenResponse> tokenData;
  Future<AccessTokenResponse> reqAccessToken(
      String clientId, String clientSecret) async {
    AccessTokenResponse? accessToken;
    await AccessTokenService()
        .requestAccessToken(clientId, clientSecret)
        .then((value) {
      if (mounted) {
        setState(() {
          accessToken = value;
        });
      }
    });
    return accessToken!;
  }

  late Future<dynamic> foodData;
  Future<dynamic> getFoodData(
      String foodId, Future<AccessTokenResponse> accessToken) async {
    List<Food> resultGetFood = [];
    await FatsecretService.getFood(foodId, await accessToken).then((value) {
      if (mounted) {
        setState(() {
          resultGetFood = value;
          isLoading = false;
        });
      }
    });
    print(resultGetFood);
    return resultGetFood;
    // return listFoods;
  }

  @override
  void initState() {
    super.initState();
    tokenData = reqAccessToken(Const.clientId, Const.clientSecret);
    foodData = getFoodData(widget.foodId!, tokenData);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String brandName = widget.brandName != null ? widget.brandName! : "";
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Food Details'),
          backgroundColor: const Color(0xFF91C788),
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 9,
                      child: SingleChildScrollView(
                        child: Container(
                            width: double.infinity,
                            child: FutureBuilder<dynamic>(
                                future: foodData,
                                builder: (context, snapshot) {
                                  var food = snapshot.data;
                                  if (snapshot.hasData) {
                                    return DetailedFoodCard(food[0], brandName);
                                  } else if (snapshot.hasError) {
                                    return Text(snapshot.error.toString());
                                  } else {
                                    return Center(
                                        child: const Text('Loading...'));
                                  }
                                })),
                      ),
                    )
                  ]),
            ),
            isLoading == true ? LoadingUi.loadingBlock() : Container()
          ],
        ));
  }
}

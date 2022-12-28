part of '../../pages.dart';

class FoodDetailPage extends StatefulWidget {
  final String? foodId;

  FoodDetailPage(this.foodId);

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  bool isLoading = true;

  Future<AccessTokenResponse> reqAccessToken(
      String clientId, String clientSecret) async {
    AccessTokenResponse? accessToken;
    await AccessTokenService()
        .requestAccessToken(clientId, clientSecret)
        .then((value) {
      setState(() {
        accessToken = value;
      });
    });
    return accessToken!;
  }

  List<Food> foodData = [];
  Future<dynamic> getFoodData(String foodId) async {
    await FatsecretService.getFood(
            foodId, await reqAccessToken(Const.clientId, Const.clientSecret))
        .then((value) {
      setState(() {
        foodData = value;
        isLoading = false;
      });
    });
    print(foodData);
    // return listFoods;
  }

  @override
  void initState() {
    super.initState();
    getFoodData(widget.foodId!);
  }

  @override
  Widget build(BuildContext context) {
    String foodId = widget.foodId!;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Foods'),
          backgroundColor: const Color(0xFF91C788),
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
              child: Column(children: [
                Flexible(
                  flex: 9,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    // child: foodData.isEmpty
                    //     ? const Align(
                    //         alignment: Alignment.center,
                    //         child: Text("No data."))
                    //     : FutureBuilder<dynamic>(
                    //         future: getFoodData(foodId),
                    //         builder:
                    //     )
                  ),
                )
              ]),
            ),
            isLoading == true ? LoadingUi.loadingBlock() : Container()
          ],
        ));
  }
}

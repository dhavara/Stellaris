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

  List<Food> foodList = [];
  // Handling functions from FoodsController
  void getFood() async {
    await FoodsController.getFoodData(widget.foodId!).then((value) {
      setState(() {
        foodList = value[0];
        isLoading = value[1];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getFood();
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
                            child: foodList.isEmpty
                                ? const Align(
                                    alignment: Alignment.center,
                                    child: Text("No data."))
                                : Center(
                                    child: DetailedFoodCard(
                                        foodList[0], brandName))),
                      ),
                    )
                  ]),
            ),
            isLoading == true ? LoadingUi.loadingBlock() : Container()
          ],
        ));
  }
}

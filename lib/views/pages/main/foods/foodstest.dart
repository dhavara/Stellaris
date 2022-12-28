part of '../../pages.dart';

class FoodsTest extends StatefulWidget {
  const FoodsTest({super.key});

  @override
  State<FoodsTest> createState() => _FoodsTestState();
}

class _FoodsTestState extends State<FoodsTest> {
  final storage = const FlutterSecureStorage();

  bool isLoading = false;
  int currentPage = 1;
  String queryData = "";
  ScrollController scrollController = ScrollController();

  final ctrlQuery = TextEditingController();

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
    print(accessToken);
    print('Access Token datatype: ' + accessToken.runtimeType.toString());
    return accessToken!;
  }

  List<SearchFood> foodsList = [];
  Future<dynamic> getSearchData(String expression, int page) async {
    await FatsecretService.searchFood(expression, page,
            await reqAccessToken(Const.clientId, Const.clientSecret))
        .then((value) {
      setState(() {
        foodsList = value;
        isLoading = false;
      });
    });
    // return listFoods;
  }

  Future<dynamic> getMoreSearchData(String expression, int page) async {

    await FatsecretService.searchFood(expression, page,
            await reqAccessToken(Const.clientId, Const.clientSecret))
        .then((value) {
      setState(() {
        foodsList += value;
        isLoading = false;
      });
    });
    // return listFoods;
  }

  @override
  initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        isLoading = true;
        currentPage += 1;
        print(currentPage);
        getMoreSearchData(queryData, currentPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                // Form
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: ctrlQuery,
                                decoration: const InputDecoration(
                                  labelText: 'Search',
                                  labelStyle: TextStyle(color: Colors.black),
                                  prefixIcon:
                                      Icon(Icons.search, color: Colors.black),
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  return value == null
                                      ? 'You must fill in the search field!'
                                      : null;
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: SizedBox(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: const StadiumBorder(),
                                          backgroundColor:
                                              const Color(0xFF91C788)),
                                      onPressed: () {
                                        // MasterDataService.getMahasiswa();
                                        if (ctrlQuery.text.isEmpty) {
                                          // UiToast.toastErr("Field needs to be filled!");
                                        } else {
                                          setState(() {
                                            queryData = ctrlQuery.text;
                                            isLoading = true;
                                          });
                                          currentPage = 1;
                                          getSearchData(queryData, currentPage);
                                        }
                                      },
                                      child: const Icon(Icons.search,
                                          color: Colors.white)),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Tampilan Data
                Flexible(
                  flex: 9,
                  child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: foodsList.isEmpty
                          ? const Align(
                              alignment: Alignment.center,
                              child: Text("No data."))
                          : ListView.builder(
                              controller: scrollController,
                              itemCount: (foodsList.length ~/ 2).toInt(),
                              itemBuilder: (context, index) {
                                return LazyLoadingList(
                                    initialSizeOfItems: 5,
                                    loadMore: () {},
                                    index: index,
                                    hasMore: true,
                                    child: FoodCard(foodsList[index * 2],
                                        foodsList[index * 2 + 1]));
                              },
                            )),
                )
              ]),
            ),
            isLoading == true ? LoadingUi.loadingBlock() : Container()
          ],
        ));
  }
}

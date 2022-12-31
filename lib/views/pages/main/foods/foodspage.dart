part of '../../pages.dart';

class FoodsPage extends StatefulWidget {
  final User user;
  FoodsPage(this.user);

  @override
  State<FoodsPage> createState() => _FoodsPageState();
}

class _FoodsPageState extends State<FoodsPage> {
  final storage = const FlutterSecureStorage();

  bool isLoading = true;
  int currentPage = 1;
  String queryData = "Chicken";
  ScrollController scrollController = ScrollController();

  final ctrlQuery = TextEditingController();

  List<SearchFood> foodsList = [];
  // Handling functions from FoodsController
  void searchFood() async {
    var searchFoodResults =
        await FoodsController.getSearchData(queryData, currentPage);
    setState(() {
      foodsList = searchFoodResults[0];
      isLoading = searchFoodResults[1];
    });
  }

  @override
  initState() {
    super.initState();
    searchFood();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        isLoading = true;
        currentPage += 1;
        searchFood();
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
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
              child: SingleChildScrollView(
                child: Column(children: [
                  // Form
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: TextFormField(
                                    cursorColor: const Color(0XFF91C788),
                                    keyboardType: TextInputType.text,
                                    controller: ctrlQuery,
                                    decoration: const InputDecoration(
                                      labelText: 'Search',
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      prefixIcon: Icon(Icons.search,
                                          color: Colors.black),
                                      filled: true,
                                      fillColor: Colors.white,
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: SizedBox(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: const StadiumBorder(),
                                              backgroundColor:
                                                  const Color(0xFF91C788)),
                                          onPressed: () {
                                            if (ctrlQuery.text.isEmpty) {
                                              // UiToast.toastErr("Field needs to be filled!");
                                            } else {
                                              setState(() {
                                                queryData = ctrlQuery.text;
                                                isLoading = true;
                                              });
                                              currentPage = 1;
                                              searchFood();
                                            }
                                          },
                                          child: const Icon(Icons.search,
                                              color: Colors.white)),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Tampilan Data
                  Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: double.infinity,
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
                ]),
              ),
            ),
            isLoading == true ? LoadingUi.loadingBlock() : Container()
          ],
        ));
  }
}

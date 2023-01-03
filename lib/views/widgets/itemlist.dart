part of 'widgets.dart';

class ItemList extends StatefulWidget {
  final ScheduleItem item;

  const ItemList(this.item);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  bool isLoading = true;

  late Future<AccessTokenResponse> tokenData;

  List<Food> foodList = [];
  void getFood() async {
    print(widget.item.foodId!);
    await FoodsController.getFoodData(widget.item.foodId!).then((value) {
      setState(() {
        foodList = value[0];
        isLoading = value[1];
      });
      print(foodList);
    });
  }

  String getCalories(String quantity, String measurement) {
    int calories = 0;
    for (int i = 0; i < foodList[0].servings!.serving!.length; i++) {
      print(
          'measurementDescription: ${foodList[0].servings!.serving![i].measurementDescription}');
      print('measurement: $measurement');
      if (foodList[0].servings!.serving![i].measurementDescription ==
          measurement) {
        calories = int.parse(foodList[0].servings!.serving![i].calories!) *
            int.parse(quantity);
        if (calories >= 1000) {
          double caloriesDouble = calories / 1000;
          return '${caloriesDouble.toString()}kcal';
        }
      }
    }
    return '${calories}cal';
  }

  @override
  void initState() {
    super.initState();
    getFood();
  }

  @override
  Widget build(BuildContext context) {
    ScheduleItem i = widget.item;
    return Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        color: Colors.white,
        child: InkWell(
            onTap: () {},
            child: ListTile(
              title: Container(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Text('${i.scheduleTime}')),
              subtitle: Container(
                  child: foodList.isEmpty
                      ? null
                      : Column(
                          children: [
                            const Divider(thickness: 1),
                            Row(children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${foodList[0].foodName}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    Text('${i.quantity} ${i.measurement}')
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    getCalories(i.quantity!, i.measurement!),
                                    textAlign: TextAlign.center,
                                  ))
                            ])
                          ],
                        )),
            )));
  }
}

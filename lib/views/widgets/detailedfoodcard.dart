part of 'widgets.dart';

class DetailedFoodCard extends StatefulWidget {
  final Food food;
  final String brandName;

  const DetailedFoodCard(this.food, this.brandName);

  @override
  _DetailedFoodCardState createState() => _DetailedFoodCardState();
}

class _DetailedFoodCardState extends State<DetailedFoodCard> {
  Container servingWidget(Serving s) {
    Container widget = Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Text(
                    'Per ${s.measurementDescription}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 16),
                  )),
              Expanded(
                flex: 2,
                child: Text(
                  '${s.calories}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
        )
      ],
    ));
    return widget;
  }

  List<Widget> servingsWidget(Food f) {
    List<Widget> widgetList = [];

    if (f.servings!.serving?.first != null) {
      for (var i = 0; i < f.servings!.serving!.length; i++) {
        widgetList.add(servingWidget(f.servings!.serving![i]));
      }
    }
    return widgetList;
  }

  List<Serving> servingListFromFood(Food f) {
    List<Serving> servingList = [];

    if (f.servings!.serving?.first != null) {
      for (var i = 0; i < f.servings!.serving!.length; i++) {
        Serving s = f.servings!.serving![i];
        servingList.add(s);
      }
    }
    return servingList;
  }

  @override
  Widget build(BuildContext context) {
    Food f = widget.food;
    String brandName = widget.brandName;
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.white,
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Text("${Helper.getBrandNameNonNull(brandName)}${f.foodName}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black)),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "${f.foodType}",
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black54),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Calories (in cal)",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: Colors.black54),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            Column(
              children: servingsWidget(f),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: const Color(0XFF91C788)),
                    onPressed: () {
                      Navigator.push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                            builder: (context) => AddSchedulePage(
                                f.foodId as String, servingListFromFood(f))),
                      );
                    },
                    child: const Text("Add To Schedule")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

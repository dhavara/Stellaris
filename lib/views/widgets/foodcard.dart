part of 'widgets.dart';

class FoodCard extends StatefulWidget {
  final SearchFood food1;
  final SearchFood food2;

  const FoodCard(this.food1, this.food2);

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    SearchFood f1 = widget.food1;
    SearchFood f2 = widget.food2;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Card(
              color: const Color(0xFF52734D),
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 2,
              child: InkWell(
                onTap: () {
                  Navigator.push<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                          builder: (context) => FoodDetailPage(f1.foodId)));
                },
                child: ListTile(
                  title: Text(
                      "${Helper.getBrandNameNonNull(f1.brandName)}${f1.foodName}\n",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        "${f1.foodType}",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      Text(
                        Helper.getCaloriesByDesc(f1.foodDescription),
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      )
                    ],
                  ),
                ),
              )),
        ),
        Expanded(
          flex: 2,
          child: Card(
              color: const Color(0xFF52734D),
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 2,
              child: InkWell(
                onTap: () {
                  Navigator.push<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                          builder: (context) => FoodDetailPage(f2.foodId)));
                },
                child: ListTile(
                  title: Text(
                      "${Helper.getBrandNameNonNull(f2.brandName)}${f2.foodName}\n",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        "${f2.foodType}",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      Text(
                        Helper.getCaloriesByDesc(f2.foodDescription),
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      )
                    ],
                  ),
                ),
              )),
        ),
      ],
    );
  }
}

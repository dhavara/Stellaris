part of 'widgets.dart';

class HistoryCard extends StatefulWidget {
  final CalculateHistory history;

  const HistoryCard(this.history);

  @override
  _HistoryCardState createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    CalculateHistory ch = widget.history;
    return Card(
        color: Colors.white,
        margin: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 2,
        child: Center(
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 8),
                  const Text('Calories',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Text(
                    "${ch.calorie}",
                    style: const TextStyle(fontSize: 12),
                  ),
                  const Text('Date Time',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Text(
                    CalculateController.getDateTime(
                        DateTime.parse(ch.createdAt!)),
                    style: const TextStyle(fontSize: 12),
                  ),
                  const Divider(),
                  TextButton(
                      onPressed: () {
                        Navigator.push<dynamic>(
                            context,
                            MaterialPageRoute<dynamic>(
                                builder: (context) => CalculateResultPage(
                                    DateTime.parse(ch.createdAt!),
                                    ch.height!,
                                    ch.weight!,
                                    ch.age!,
                                    ch.gender!,
                                    ch.activity!,
                                    ch.calorie!)));
                      },
                      child: const Text("More Informations",
                          style: TextStyle(
                            color: Color(0XFF91C788),
                          )))
                ],
              ),
            ),
          ),
        ));
  }
}

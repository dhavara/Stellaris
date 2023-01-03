part of '../../pages.dart';

class ScheduleDetailPage extends StatefulWidget {
  final Schedule schedule;

  ScheduleDetailPage(this.schedule);

  @override
  State<ScheduleDetailPage> createState() => _ScheduleDetailPageState();
}

class _ScheduleDetailPageState extends State<ScheduleDetailPage> {
  List<ScheduleItem> itemsList = [];
  bool isLoading = true;
  void getItem() async {
    print(widget.schedule.id);
    await ScheduleController.getScheduleItemByScheduleId(widget.schedule.id!)
        .then((value) {
      setState(() {
        itemsList = value;
        isLoading = false;

        itemsList.sort((a, b) =>
            a.scheduleTime!.toString().compareTo(b.scheduleTime!.toString()));
      });
    });
    print(itemsList);
  }

  @override
  void initState() {
    super.initState();
    getItem();
  }

  @override
  Widget build(BuildContext context) {
    Schedule s = widget.schedule;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Schedule Detail'),
          backgroundColor: const Color(0xFF91C788),
        ),
        body: Stack(
          children: [
            Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.scheduleDate!,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.83,
                      child: itemsList.isEmpty
                          ? const Align(
                              alignment: Alignment.center,
                              child: Text("No data."))
                          : ListView.builder(
                              itemCount: itemsList.length,
                              itemBuilder: (context, index) {
                                return LazyLoadingList(
                                    initialSizeOfItems: 100,
                                    loadMore: () {},
                                    index: index,
                                    hasMore: true,
                                    child: ItemList(itemsList[index]));
                              },
                            ),
                    ),
                  ],
                )),
            isLoading == true ? LoadingUi.loadingBlock() : Container()
          ],
        ));
  }
}

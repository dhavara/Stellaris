// ignore_for_file: prefer_const_constructors

part of '../../pages.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  bool isLoading = true;
  List<Schedule> scheduleList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Schedule'),
          backgroundColor: const Color(0xFF91C788),
        ),
        body: BlocBuilder<UserCubit, User?>(
          builder: (context, state) {
            void getSchedule() async {
              var getScheduleResult =
                  await ScheduleController.getScheduleByUserId(
                      state?.id! as String);
              setState(() {
                scheduleList = getScheduleResult;
                isLoading = false;
              });
              print(scheduleList);
            }

            if (state != null) {
              if (scheduleList.isEmpty) {
                getSchedule();
              }
            }

            return Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleChildScrollView(
                        child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.785,
                            child: scheduleList.isEmpty
                                ? LoadingUi.loading()
                                : ListView.builder(
                                    itemCount: scheduleList.length,
                                    itemBuilder: (context, index) {
                                      return LazyLoadingList(
                                        initialSizeOfItems: 10,
                                        loadMore: () {},
                                        index: index,
                                        hasMore: true,
                                        child:
                                            ScheduleButton(scheduleList[index]),
                                      );
                                    },
                                  ))),
                  ]),
            );
          },
        ));
  }
}

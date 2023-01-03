part of '../../pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CalculateHistory> historyList = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, User?>(
      builder: (context, state) {
        void getHistory() async {
          var getHistoryResults =
              await CalculateController.getCalculateHistoryByUserId(
                  state?.id! as String);
          setState(() {
            historyList = getHistoryResults;
          });
        }

        if (state != null) {
          if (historyList.isEmpty) {
            getHistory();
          }
        }

        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              // Home Section
              title: const Text('Home'),
              backgroundColor: const Color(0xFF91C788),
            ),
            body: Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
                          child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: Colors.white,
                              margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                      child: Text("Hello, ${state?.name}"
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push<dynamic>(
                                            context,
                                            MaterialPageRoute<dynamic>(
                                                builder: (context) =>
                                                    UserProfile()));
                                      },
                                      // Profile Section
                                      child: const Text("Profile",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0XFF91C788),
                                          )))
                                ],
                              ))),
                      const SizedBox(height: 24),
                      // Recommended Food Section
                      const Text("Recommended Food",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.left),
                      const SizedBox(height: 24),
                      // Calculate History Section
                      const Text("Calculate History",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.left),
                      const SizedBox(height: 24),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: double.infinity,
                          child: historyList.isEmpty
                              ? LoadingUi.loading()
                              : ListView.builder(
                                  itemCount: historyList.length,
                                  itemBuilder: (context, index) {
                                    return LazyLoadingList(
                                        initialSizeOfItems: 10,
                                        loadMore: () {},
                                        index: index,
                                        hasMore: true,
                                        child: HistoryCard(historyList[index]));
                                  },
                                )),
                    ],
                  ),
                )));
      },
    );
  }
}

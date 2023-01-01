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
              title: const Text('Home'),
              actions: [
                IconButton(
                    icon: const Icon(Icons.logout),
                    color: Colors.white,
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove('id');
                      if (!mounted) return;
                      BlocProvider.of<UserCubit>(context).logout();
                      Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                              builder: (context) => const LoginPage()),
                          (route) => false);
                    }),
              ],
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
                                      child: Text("${state?.name}",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black)),
                                    ),
                                  )
                                ],
                              ))),
                      const SizedBox(height: 24),
                      const Text("Recommended Food",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.left),
                      const SizedBox(height: 24),
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

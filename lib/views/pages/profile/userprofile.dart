part of '../pages.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              color: Colors.white,
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
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
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: Text("Hallo ",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black)),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push<dynamic>(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                      builder: (context) => UserProfile()));
                            },
                            child: const Text("Profile",
                                style: TextStyle(
                                  color: Color(0XFF91C788),
                                )))
                      ],
                    ))),
            const SizedBox(height: 24),
            const Text("Recommended Food",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                textAlign: TextAlign.left),
            const SizedBox(height: 24),
            // Calculate History
            const Text("Calculate History",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                textAlign: TextAlign.left),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

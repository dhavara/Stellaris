part of '../pages.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

// Profiel Class here
class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, User?>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
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
                          const SizedBox(height: 8),
                          Text(
                            "${state?.name}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${state?.email}",
                            style: const TextStyle(fontSize: 15),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push<dynamic>(
                                    context,
                                    MaterialPageRoute<dynamic>(
                                        builder: (context) => editprofile()));
                              },
                              child: const Text("Edit Profile",
                                  style: TextStyle(
                                    color: Color(0XFF91C788),
                                  )))
                        ],
                      ))),
            ],
          ),
        ),
      );
    });
  }
}

part of 'pages.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  final splashDelay = 4;
  AnimationController? _controller;

  User? user;

  @override
  void initState() {
    super.initState();
    loadWidget();
  }

  loadWidget() async {
    var duration = Duration(seconds: splashDelay);
    return Timer(duration, navigationPage);
  }

  void navigationPage() async {
    if (user != null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => const MainMenuPage())));
      ToastUi.toastOk("Welcome back, ${user?.name.toString()}");
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => const LoginPage())));
      ToastUi.toastOk("Not logged in, please log in");
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, User?>(
      buildWhen: ((previous, current) => previous != current),
      builder: (context, state) {
        checkSharedPrefs() async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var sharedId = prefs.getString('id');
          if (sharedId != null) {
            user = await LoginRegisterController.getUserById(sharedId);

            if (!mounted) return;
            BlocProvider.of<UserCubit>(context).login(user as User);
            SharedPrefs.update(user?.id as String);
          }
        }

        if (state == null) {
          checkSharedPrefs();
        } else {
          user = state;
        }
        return Scaffold(
          body: Container(
              alignment: Alignment.center,
              child: const Text('Dietaryminder',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold))),
        );
      },
    );
  }
}

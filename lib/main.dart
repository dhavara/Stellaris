import 'package:dietaryminder/auth/auth.dart';
import 'package:dietaryminder/views/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
            create: (BuildContext context) => UserCubit(null))
      ],
      child: MaterialApp(
          title: 'Stellaris',
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFFEFFDE),
          ),
          debugShowCheckedModeBanner: false,
          home: const Splash()),
    );
  }
}

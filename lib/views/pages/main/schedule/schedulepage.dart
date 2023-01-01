// ignore_for_file: prefer_const_constructors

part of '../../pages.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Schedule'),
          backgroundColor: const Color(0xFF91C788),
        ),
        body: Container()
    );
  }
}

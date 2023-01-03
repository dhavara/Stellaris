part of 'widgets.dart';

class ScheduleButton extends StatefulWidget {
  final Schedule schedule;

  const ScheduleButton(this.schedule);

  @override
  _ScheduleButtonState createState() => _ScheduleButtonState();
}

class _ScheduleButtonState extends State<ScheduleButton> {
  List<Schedule> scheduleList = [];
  void getSchedule() async {
    await ScheduleController.getScheduleById(widget.schedule.id!).then((value) {
      setState(() {
        scheduleList = value;
      });
    });
    print(scheduleList);
    if (!mounted) return;
    if (scheduleList.isNotEmpty) {
      Navigator.push<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
              builder: (context) => ScheduleDetailPage(widget.schedule)));
    }
  }

  @override
  Widget build(BuildContext context) {
    Schedule s = widget.schedule;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(), backgroundColor: Colors.white),
        onPressed: () async {
          getSchedule();
        },
        child: Text(
          s.scheduleDate!,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

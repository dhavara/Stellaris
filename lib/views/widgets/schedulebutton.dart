part of 'widgets.dart';

class ScheduleButton extends StatefulWidget {
  final Schedule schedule;

  const ScheduleButton(this.schedule);

  @override
  _ScheduleButtonState createState() => _ScheduleButtonState();
}

class _ScheduleButtonState extends State<ScheduleButton> {
  @override
  Widget build(BuildContext context) {
    Schedule s = widget.schedule;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: const Color(0XFF91C788)),
        onPressed: () {},
        child: Text(s.scheduleDate!),
      ),
    );
  }
}

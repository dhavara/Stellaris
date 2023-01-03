part of '../../pages.dart';

class CalculateResultPage extends StatefulWidget {
  final String height, weight, age, gender, activity, calories;
  final DateTime createdAt;

  CalculateResultPage(this.createdAt, this.height, this.weight, this.age,
      this.gender, this.activity, this.calories);

  @override
  State<CalculateResultPage> createState() => _CalculateResultPageState();
}

class _CalculateResultPageState extends State<CalculateResultPage> {
  @override
  Widget build(BuildContext context) {
    DateTime createdAt = widget.createdAt;
    String height = widget.height;
    String weight = widget.weight;
    String age = widget.age;
    String gender = widget.gender;
    String activity = widget.activity;
    String calories = widget.calories;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Calculate Calories'),
          backgroundColor: const Color(0xFF91C788),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Your Result',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              Text(CalculateController.getDateTime(createdAt),
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400)),
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text('Height',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800)),
                        Text('${height.toString()}cm',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                        const Divider(
                          thickness: 1,
                        ),
                        const Text('Weight',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800)),
                        Text('${weight.toString()}kg',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                        const Divider(
                          thickness: 1,
                        ),
                        const Text('Age',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800)),
                        Text('${age.toString()} years old',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                        const Divider(
                          thickness: 1,
                        ),
                        const Text('Gender',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800)),
                        Text(gender.toString(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                        const Divider(
                          thickness: 1,
                        ),
                        const Text('Activity',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800)),
                        Text(activity.toString(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                        const Divider(
                          thickness: 1,
                        ),
                        const Text('Calories',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800)),
                        Text('${calories.toString()}cal',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color(0XFF91C788)),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text("Okay"),
                ),
              )
            ],
          ),
        ));
  }
}

part of '../../pages.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  String selectedGender = 'Male';
  var enumGender = ['Male', 'Female'];

  @override
  void initState() {
    super.initState();
  }

  final _calculateKey = GlobalKey<FormState>();
  final ctrlHeight = TextEditingController();
  final ctrlWeight = TextEditingController();
  final ctrlAge = TextEditingController();
  final ctrlActivity = TextEditingController();

  @override
  void dispose() {
    ctrlHeight.dispose();
    ctrlWeight.dispose();
    ctrlAge.dispose();
    ctrlActivity.dispose();
    super.dispose();
  }

  bool createSuccess = false;
  void create(String userId, String height, String weight, String age,
      String gender, String activity, String calorie) async {
    await CalculateController.createCalculateHistory(
            userId, height, weight, age, gender, activity, calorie)
        .then((value) {
      setState(() {
        createSuccess = value;
      });
    });
    if (!mounted) return;
    ToastUi.toastOk("Form submitted successfully!");
    Navigator.push<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
            builder: (context) => CalculateResultPage(
                height, weight, age, gender, activity, calorie))).then((value) {
      setState(() {
        ctrlHeight.text = "";
        ctrlWeight.text = "";
        ctrlAge.text = "";
        ctrlActivity.text = "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Calculate Calories'),
          backgroundColor: const Color(0xFF91C788),
        ),
        body: BlocBuilder<UserCubit, User?>(
          builder: (context, state) {
            return Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("Calculate",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 24)),
                            const Text(
                              "Your amount of calories needed per day",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),

                            //Code for Form (Height)
                            const SizedBox(height: 24),
                            Form(
                                key: _calculateKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      cursorColor: const Color(0XFF91C788),
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        icon: Icon(Icons.height,
                                            color: Color(0XFF91C788)),
                                        labelText: "Height",
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      controller: ctrlHeight,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        return value.toString().length > 3
                                            ? 'Height must be at most 3 digits!'
                                            : null;
                                      },
                                    ),

                                    //Code for Form (Weight)
                                    const SizedBox(height: 24),
                                    TextFormField(
                                      cursorColor: const Color(0XFF91C788),
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        icon: Icon(Icons.fitness_center,
                                            color: Color(0XFF91C788)),
                                        labelText: "Weight",
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      controller: ctrlWeight,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        return value.toString().length > 3
                                            ? 'Weight must be at most 3 digits!'
                                            : null;
                                      },
                                    ),

                                    //Code for Form (Age)
                                    const SizedBox(height: 24),
                                    TextFormField(
                                      cursorColor: const Color(0XFF91C788),
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        icon: Icon(Icons.numbers,
                                            color: Color(0XFF91C788)),
                                        labelText: "Age",
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      controller: ctrlAge,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        return value.toString().length > 2
                                            ? 'Age must be at most 2 digits!'
                                            : null;
                                      },
                                    ),

                                    //Code for Form (Gender)
                                    const SizedBox(height: 24),
                                    DropdownButtonFormField(
                                        focusColor: Colors.transparent,
                                        decoration: const InputDecoration(
                                          icon: Icon(Icons.person,
                                              color: Color(0XFF91C788)),
                                          labelText: "Gender",
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          filled: true,
                                          fillColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                        value: selectedGender,
                                        items: enumGender.map((String items) {
                                          return DropdownMenuItem(
                                              value: items, child: Text(items));
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedGender = newValue!;
                                          });
                                        }),

                                    //Code for Form (Activity)
                                    const SizedBox(height: 24),
                                    TextFormField(
                                      cursorColor: const Color(0XFF91C788),
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        icon: Icon(Icons.local_activity,
                                            color: Color(0XFF91C788)),
                                        labelText: "Activity",
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      controller: ctrlActivity,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        return value.toString().length > 20
                                            ? 'Activity must be at most 20 characters!'
                                            : null;
                                      },
                                    ),

                                    const SizedBox(height: 16),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: const StadiumBorder(),
                                            backgroundColor:
                                                const Color(0XFF91C788)),
                                        onPressed: () {
                                          if (ctrlHeight.text.isEmpty &&
                                              ctrlWeight.text.isEmpty &&
                                              ctrlAge.text.isEmpty &&
                                              ctrlActivity.text.isEmpty) {
                                            ToastUi.toastErr(
                                                "Please fill all the fields first!");
                                          } else if (ctrlHeight.text.isEmpty ||
                                              ctrlWeight.text.isEmpty ||
                                              ctrlAge.text.isEmpty ||
                                              ctrlActivity.text.isEmpty) {
                                            ToastUi.toastErr(
                                                "One or more field is empty!");
                                          } else {
                                            double calories =
                                                CalculateController
                                                    .calculateCalories(
                                                        selectedGender,
                                                        int.parse(ctrlAge.text),
                                                        int.parse(
                                                            ctrlHeight.text),
                                                        int.parse(
                                                            ctrlWeight.text));
                                            create(
                                                state?.id as String,
                                                ctrlHeight.text,
                                                ctrlWeight.text,
                                                ctrlAge.text,
                                                selectedGender,
                                                ctrlActivity.text,
                                                calories.toString());
                                          }
                                        },
                                        child: const Text("Calculate!"),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          },
        ));
  }
}

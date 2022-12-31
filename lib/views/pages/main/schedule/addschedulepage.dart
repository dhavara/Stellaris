part of '../../pages.dart';

class AddSchedulePage extends StatefulWidget {
  final String foodId;
  final List<Serving> servings;
  AddSchedulePage(this.foodId, this.servings);

  @override
  State<AddSchedulePage> createState() => _AddSchedulePageState();
}

class _AddSchedulePageState extends State<AddSchedulePage> {
  final _scheduleKey = GlobalKey<FormState>();
  final ctrlId = TextEditingController();
  final ctrlDate = TextEditingController();
  final ctrlTime = TextEditingController();
  final ctrlQuantity = TextEditingController();

  @override
  void initState() {
    super.initState();
    ctrlId.text = widget.foodId;
  }

  @override
  void dispose() {
    ctrlId.dispose();
    ctrlDate.dispose();
    ctrlTime.dispose();
    ctrlQuantity.dispose();
    super.dispose();
  }

  List<String> getAllMeasurements(List<Serving> s) {
    List<String> measurementList = [];

    for (int i = 0; i < s.length; i++) {
      measurementList.add(s[i].measurementDescription!);
    }

    return measurementList;
  }

  @override
  Widget build(BuildContext context) {
    String foodId = widget.foodId;
    List<Serving> servings = widget.servings;
    String selectedMeasurement = widget.servings[0].measurementDescription!;

    print(servings);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Schedule'),
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
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Add To Schedule",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 24)),
                        const Text(
                          "Your very own food schedule",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),

                        //Code for Form (Height)
                        const SizedBox(height: 24),
                        Form(
                            key: _scheduleKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  enabled: false,
                                  cursorColor: const Color(0XFF91C788),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: foodId,
                                    icon: const Icon(Icons.fastfood,
                                        color: Color(0XFF91C788)),
                                    labelText: "Food ID",
                                    labelStyle:
                                        const TextStyle(color: Colors.black),
                                    filled: true,
                                    fillColor: Colors.grey,
                                    disabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ),
                                    ),
                                    focusedErrorBorder:
                                        const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  controller: ctrlId,
                                ),

                                //Code for Form (Weight)
                                const SizedBox(height: 24),
                                TextFormField(
                                  onTap: () async {
                                    DateTime date = DateTime.now();
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: date,
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2024),
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme:
                                                const ColorScheme.light(
                                              primary: Color(0XFF52734D),
                                              onPrimary: Colors.white,
                                              onSurface: Colors.black,
                                            ),
                                            textButtonTheme:
                                                TextButtonThemeData(
                                              style: TextButton.styleFrom(
                                                foregroundColor:
                                                    const Color(0XFF91C788),
                                              ),
                                            ),
                                          ),
                                          child: child!,
                                        );
                                      },
                                    );

                                    if (pickedDate != null) {
                                      String formattedDate =
                                          DateFormat('dd/MM/yyyy')
                                              .format(pickedDate);
                                      setState(() {
                                        ctrlDate.text = formattedDate;
                                      });
                                    } else {
                                      String formattedDate =
                                          DateFormat('dd/MM/yyyy').format(date);
                                      setState(() {
                                        ctrlDate.text = formattedDate;
                                      });
                                    }
                                  },
                                  readOnly: true,
                                  cursorColor: const Color(0XFF91C788),
                                  keyboardType: TextInputType.datetime,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.calendar_month,
                                        color: Color(0XFF91C788)),
                                    labelText: "Date",
                                    labelStyle: TextStyle(color: Colors.black),
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
                                  controller: ctrlDate,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    return value!.isEmpty
                                        ? 'Date cannot be empty!'
                                        : null;
                                  },
                                ),

                                //Code for Form (Age)
                                const SizedBox(height: 24),
                                TextFormField(
                                  onTap: () async {
                                    TimeOfDay time = TimeOfDay.now();
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                      context: context,
                                      initialTime: time,
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme:
                                                const ColorScheme.light(
                                              primary: Color(0XFF52734D),
                                              onPrimary: Colors.white,
                                              onSurface: Colors.black,
                                            ),
                                            textButtonTheme:
                                                TextButtonThemeData(
                                              style: TextButton.styleFrom(
                                                foregroundColor:
                                                    const Color(0XFF91C788),
                                              ),
                                            ),
                                          ),
                                          child: child!,
                                        );
                                      },
                                    );
                                    if (mounted) {
                                      if (pickedTime != null &&
                                          pickedTime != time) {
                                        time = pickedTime;
                                        String formattedTime =
                                            pickedTime.format(context);
                                        setState(() {
                                          ctrlTime.text = formattedTime;
                                        });
                                      } else {
                                        String formattedTime =
                                            time.format(context);
                                        setState(() {
                                          ctrlTime.text = formattedTime;
                                        });
                                      }
                                    }
                                  },
                                  readOnly: true,
                                  cursorColor: const Color(0XFF91C788),
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.timer_outlined,
                                        color: Color(0XFF91C788)),
                                    labelText: "Time",
                                    labelStyle: TextStyle(color: Colors.black),
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
                                  controller: ctrlTime,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    return value!.isEmpty
                                        ? 'Time cannot be empty!'
                                        : null;
                                  },
                                ),

                                //Code for Form (Gender)
                                const SizedBox(height: 24),
                                DropdownButtonFormField(
                                    focusColor: Colors.transparent,
                                    decoration: const InputDecoration(
                                      icon: Icon(Icons.architecture,
                                          color: Color(0XFF91C788)),
                                      labelText: "Measurement",
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
                                    isExpanded: true,
                                    value: selectedMeasurement,
                                    selectedItemBuilder:
                                        (BuildContext context) {
                                      return getAllMeasurements(servings)
                                          .map((String items) {
                                        return Text(items,
                                            overflow: TextOverflow.ellipsis);
                                      }).toList();
                                    },
                                    items: getAllMeasurements(servings)
                                        .map((String items) {
                                      return DropdownMenuItem(
                                          value: items,
                                          child: Text(items,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis)));
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedMeasurement = newValue!;
                                      });
                                    }),

                                //Code for Form (Activity)
                                const SizedBox(height: 24),
                                TextFormField(
                                  cursorColor: const Color(0XFF91C788),
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.discount,
                                        color: Color(0XFF91C788)),
                                    labelText: "Quantity",
                                    labelStyle: TextStyle(color: Colors.black),
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
                                  controller: ctrlQuantity,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    return value.toString().length > 4
                                        ? 'Quantity must be at most 4 characters!'
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
                                      if (ctrlDate.text.isEmpty &&
                                          ctrlTime.text.isEmpty &&
                                          ctrlQuantity.text.isEmpty) {
                                        ToastUi.toastErr(
                                            "Please fill all the fields first!");
                                      } else if (ctrlDate.text.isEmpty ||
                                          ctrlTime.text.isEmpty ||
                                          ctrlQuantity.text.isEmpty) {
                                        ToastUi.toastErr(
                                            "One or more field is empty!");
                                      } else {
                                        ToastUi.toastOk(
                                            "Form submitted successfully!");
                                        Navigator.pop(context, true);
                                      }
                                    },
                                    child: const Text("Add to schedule!"),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

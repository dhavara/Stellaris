// // part of 'pages.dart';

// // class Ongkirpage extends StatefulWidget {
// //   const Ongkirpage({Key? key}) : super(key: key);

// //   @override
// //   _OngkirpageState createState() => _OngkirpageState();
// // }

// // class _OngkirpageState extends State<Ongkirpage> {
// //   bool isLoading = false;
// //   String selectedKurir = 'jne';
// //   var kurir = ['jne', 'pos', 'tiki'];

// //   final ctrlBerat = TextEditingController();

// //   dynamic provId;
// //   dynamic provinceData;
// //   dynamic provinceDataDes;
// //   dynamic selectedProv;
// //   dynamic destinationProv;
// //   Future<List<Province>> getProvinces() async {
// //     dynamic listProvince;
// //     await MasterDataService.getProvince().then((value) {
// //       setState(() {
// //         listProvince = value;
// //       });
// //     });

// //     return listProvince;
// //   }

// //   dynamic cityId;
// //   dynamic cityIdDes;
// //   dynamic cityData;
// //   dynamic cityDataDes;
// //   dynamic selectedCity;
// //   dynamic destinationCity;
// //   Future<List<City>> getCities(dynamic provId) async {
// //     dynamic listCity;
// //     await MasterDataService.getCity(provId).then((value) {
// //       setState(() {
// //         listCity = value;
// //       });
// //     });

// //     return listCity;
// //   }

// //   List<Costs> listCosts = [];
// //   Future<dynamic> getCostsData() async {
// //     await RajaOngkirService.getMyOngkir(
// //             cityId, cityIdDes, int.parse(ctrlBerat.text), selectedKurir)
// //         .then((value) {
// //       setState(() {
// //         listCosts = value;
// //         isLoading = false;
// //       });
// //       print(listCosts.toString());
// //     });
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     provinceData = getProvinces();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Hitung Ongkir"),
// //         centerTitle: true,
// //       ),
// //       body: Stack(
// //         children: [
// //           Container(
// //             width: double.infinity,
// //             height: double.infinity,
// //             child: Column(
// //               children: [
// //                 // Flexible untuk form
// //                 Flexible(
// //                   flex: 6,
// //                   child: Column(
// //                     children: [
// //                       Padding(
// //                         padding: const EdgeInsets.all(16.0),
// //                         child: Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             DropdownButton(
// //                                 value: selectedKurir,
// //                                 icon: Icon(Icons.arrow_drop_down),
// //                                 items: kurir.map((String items) {
// //                                   return DropdownMenuItem(
// //                                     value: items,
// //                                     child: Text(items),
// //                                   );
// //                                 }).toList(),
// //                                 onChanged: (String? newValue) {
// //                                   setState(() {
// //                                     selectedKurir = newValue!;
// //                                   });
// //                                 }),
// //                             SizedBox(
// //                               width: 200,
// //                               child: TextFormField(
// //                                 keyboardType: TextInputType.number,
// //                                 controller: ctrlBerat,
// //                                 decoration: InputDecoration(
// //                                   labelText: 'Berat (gr)',
// //                                 ),
// //                                 autovalidateMode:
// //                                     AutovalidateMode.onUserInteraction,
// //                                 validator: (value) {
// //                                   return value == null || value == 0
// //                                       ? "Berat harus diisi atau tidak boleh 0"
// //                                       : null;
// //                                 },
// //                               ),
// //                             )
// //                           ],
// //                         ),
// //                       ),
// //                       Padding(
// //                         padding: EdgeInsets.all(16.0),
// //                         child: Align(
// //                           alignment: Alignment.topLeft,
// //                           child: Text(
// //                             "Origin",
// //                             style: TextStyle(
// //                                 fontSize: 16, fontWeight: FontWeight.bold),
// //                           ),
// //                         ),
// //                       ),
// //                       Padding(
// //                         padding: EdgeInsets.symmetric(horizontal: 16),
// //                         child: Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             Container(
// //                               width: 150,
// //                               child: FutureBuilder<List<Province>>(
// //                                   future: provinceData,
// //                                   builder: (context, snapshot) {
// //                                     if (snapshot.hasData) {
// //                                       return DropdownButton(
// //                                           isExpanded: true,
// //                                           value: selectedProv,
// //                                           icon: Icon(Icons.arrow_drop_down),
// //                                           iconSize: 30,
// //                                           elevation: 16,
// //                                           style: TextStyle(color: Colors.black),
// //                                           hint: selectedProv == null
// //                                               ? Text('Pilih Provinsi')
// //                                               : Text(selectedProv.province),
// //                                           items: snapshot.data!
// //                                               .map<DropdownMenuItem<Province>>(
// //                                                   (Province value) {
// //                                             return DropdownMenuItem(
// //                                                 value: value,
// //                                                 child: Text(
// //                                                     value.province.toString()));
// //                                           }).toList(),
// //                                           onChanged: (newValue) {
// //                                             setState(() {
// //                                               selectedProv = newValue;
// //                                               provId = selectedProv.provinceId;
// //                                             });
// //                                             selectedCity = null;
// //                                             cityData = getCities(provId);
// //                                           });
// //                                     } else if (snapshot.hasError) {
// //                                       return Text("Tidak ada data.");
// //                                     }
// //                                     return UiLoading.loadingDD();
// //                                   }),
// //                             ),
// //                             Container(
// //                               width: 150,
// //                               child: FutureBuilder<List<City>>(
// //                                   future: cityData,
// //                                   builder: (context, snapshot) {
// //                                     if (selectedProv != null) {
// //                                       if (snapshot.hasData) {
// //                                         UiLoading.loadingDD();
// //                                         return DropdownButton(
// //                                             isExpanded: true,
// //                                             value: selectedCity,
// //                                             icon: Icon(Icons.arrow_drop_down),
// //                                             iconSize: 30,
// //                                             elevation: 16,
// //                                             style:
// //                                                 TextStyle(color: Colors.black),
// //                                             hint: selectedCity == null
// //                                                 ? Text('Pilih Kota')
// //                                                 : Text(selectedCity.cityName),
// //                                             items: snapshot.data!
// //                                                 .map<DropdownMenuItem<City>>(
// //                                                     (City value) {
// //                                               return DropdownMenuItem(
// //                                                   value: value,
// //                                                   child: Text(value.cityName
// //                                                       .toString()));
// //                                             }).toList(),
// //                                             onChanged: (newValue) {
// //                                               setState(() {
// //                                                 selectedCity = newValue;
// //                                                 cityId = selectedCity.cityId;
// //                                               });
// //                                               destinationProv = null;
// //                                               cityData = getCities(provId);
// //                                             });
// //                                       }
// //                                       return UiLoading.loadingDD();
// //                                     } else {
// //                                       return Text("Pilih Provinsi Dulu");
// //                                     }
// //                                   }),
// //                             )
// //                           ],
// //                         ),
// //                       ),
// //                       Padding(
// //                         padding: EdgeInsets.all(16.0),
// //                         child: Align(
// //                           alignment: Alignment.topLeft,
// //                           child: Text(
// //                             "Destination",
// //                             style: TextStyle(
// //                                 fontSize: 16, fontWeight: FontWeight.bold),
// //                           ),
// //                         ),
// //                       ),
// //                       Padding(
// //                         padding: EdgeInsets.symmetric(horizontal: 16),
// //                         child: Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             Container(
// //                               width: 150,
// //                               child: FutureBuilder<List<Province>>(
// //                                   future: provinceData,
// //                                   builder: (context, snapshot) {
// //                                     if (snapshot.hasData) {
// //                                       return DropdownButton(
// //                                           isExpanded: true,
// //                                           value: destinationProv,
// //                                           icon: Icon(Icons.arrow_drop_down),
// //                                           iconSize: 30,
// //                                           elevation: 16,
// //                                           style: TextStyle(color: Colors.black),
// //                                           hint: destinationProv == null
// //                                               ? Text('Pilih Provinsi')
// //                                               : Text(destinationProv.province),
// //                                           items: snapshot.data!
// //                                               .map<DropdownMenuItem<Province>>(
// //                                                   (Province value) {
// //                                             return DropdownMenuItem(
// //                                                 value: value,
// //                                                 child: Text(
// //                                                     value.province.toString()));
// //                                           }).toList(),
// //                                           onChanged: (newValue) {
// //                                             setState(() {
// //                                               destinationProv = newValue;
// //                                               provId =
// //                                                   destinationProv.provinceId;
// //                                             });
// //                                             destinationCity = null;
// //                                             cityDataDes = getCities(provId);
// //                                           });
// //                                     } else if (snapshot.hasError) {
// //                                       return Text("Tidak ada data.");
// //                                     }
// //                                     return UiLoading.loadingDD();
// //                                   }),
// //                             ),
// //                             Container(
// //                               width: 150,
// //                               child: FutureBuilder<List<City>>(
// //                                   future: cityDataDes,
// //                                   builder: (context, snapshot) {
// //                                     if (destinationProv != null) {
// //                                       if (snapshot.hasData) {
// //                                         UiLoading.loadingDD();
// //                                         return DropdownButton(
// //                                             isExpanded: true,
// //                                             value: destinationCity,
// //                                             icon: Icon(Icons.arrow_drop_down),
// //                                             iconSize: 30,
// //                                             elevation: 16,
// //                                             style:
// //                                                 TextStyle(color: Colors.black),
// //                                             hint: destinationCity == null
// //                                                 ? Text('Pilih Kota')
// //                                                 : Text(
// //                                                     destinationCity.cityName),
// //                                             items: snapshot.data!
// //                                                 .map<DropdownMenuItem<City>>(
// //                                                     (City value) {
// //                                               return DropdownMenuItem(
// //                                                   value: value,
// //                                                   child: Text(value.cityName
// //                                                       .toString()));
// //                                             }).toList(),
// //                                             onChanged: (newValue) {
// //                                               setState(() {
// //                                                 destinationCity = newValue;
// //                                                 cityIdDes =
// //                                                     destinationCity.cityId;
// //                                               });
// //                                               cityDataDes = null;
// //                                               cityDataDes = getCities(provId);
// //                                             });
// //                                       }
// //                                       return UiLoading.loadingDD();
// //                                     } else {
// //                                       return Text("Pilih Provinsi Dulu");
// //                                     }
// //                                   }),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                       ElevatedButton(
// //                           onPressed: () {
// //                             MasterDataService.getMahasiswa();
// //                             // if (cityData == null ||
// //                             //     cityDataDes == null ||
// //                             //     selectedKurir.isEmpty ||
// //                             //     ctrlBerat.text.isEmpty) {
// //                             //   UiToast.toastErr("Semua field harus diisi");
// //                             // } else {
// //                             //   setState((() {
// //                             //     isLoading = true;
// //                             //   }));
// //                             //   getCostsData();
// //                             // }
// //                           },
// //                           child: Text("Hitung Estimasi Harga"))
// //                     ],
// //                   ),
// //                 ),
// //                 // Flexible untuk nampilin data
// //                 Flexible(
// //                     flex: 5,
// //                     child: Container(
// //                       width: double.infinity,
// //                       height: double.infinity,
// //                       child: listCosts.isEmpty
// //                           ? const Align(
// //                               alignment: Alignment.center,
// //                               child: Text("Tidak ada data"))
// //                           : ListView.builder(
// //                               itemCount: listCosts.length,
// //                               itemBuilder: (context, index) {
// //                                 return LazyLoadingList(
// //                                     initialSizeOfItems: 10,
// //                                     loadMore: () {},
// //                                     child: CardOngkir(listCosts[index]),
// //                                     index: index,
// //                                     hasMore: true);
// //                               },
// //                             ),
// //                     )),
// //               ],
// //             ),
// //           ),
// //           isLoading == true ? UiLoading.loadingBlock() : Container(),
// //         ],
// //       ),
// //     );
// //   }
// // }
// part of '../../pages.dart';

// class AddSchedulePage extends StatefulWidget {
//   final String foodId;
//   final List<Serving> servings;
//   AddSchedulePage(this.foodId, this.servings);

//   @override
//   State<AddSchedulePage> createState() => _AddSchedulePageState();
// }

// class _AddSchedulePageState extends State<AddSchedulePage> {
//   final _scheduleKey = GlobalKey<FormState>();
//   final ctrlId = TextEditingController();
//   final ctrlDate = TextEditingController();
//   final ctrlTime = TextEditingController();
//   final ctrlQuantity = TextEditingController();

//   String selectedMeasurement = "";

//   @override
//   void initState() {
//     super.initState();
//     ctrlId.text = widget.foodId;
//     selectedMeasurement = widget.servings[0].measurementDescription!;
//   }

//   @override
//   void dispose() {
//     ctrlId.dispose();
//     ctrlDate.dispose();
//     ctrlTime.dispose();
//     ctrlQuantity.dispose();
//     super.dispose();
//   }

//   List<String> getAllMeasurements(List<Serving> s) {
//     List<String> measurementList = [];
//     for (int i = 0; i < s.length; i++) {
//       measurementList.add(s[i].measurementDescription!);
//     }

//     return measurementList;
//   }

//   String scheduleId = "";
//   bool createSuccess = false;
//   void createSchedule(String userId, String date, String time, String foodId,
//       String quantity) async {
//     await ScheduleController.createSchedule(userId, date).then((value) {
//       setState(() {
//         scheduleId = value;
//       });
//     });
//     if (scheduleId == "") return;
//     await ScheduleController.createScheduleItem(
//             scheduleId, time, foodId, selectedMeasurement, quantity)
//         .then((value) {
//       setState(() {
//         createSuccess = value;
//       });
//     });
//     if (!mounted) return;
//     if (createSuccess) {
//       ToastUi.toastOk("Form submitted successfully!");
//       Navigator.pop(context, true);
//     } else {
//       ToastUi.toastErr("Something went wrong!");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     String foodId = widget.foodId;
//     List<Serving> servings = widget.servings;

//     print(servings);

//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           title: const Text('Schedule'),
//           backgroundColor: const Color(0xFF91C788),
//         ),
//         body: BlocBuilder<UserCubit, User?>(
//           builder: (context, state) {
//             return Container(
//                 width: double.infinity,
//                 height: double.infinity,
//                 padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Container(
//                         height: MediaQuery.of(context).size.height * 0.8,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             const Text("Add To Schedule",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w400, fontSize: 24)),
//                             const Text(
//                               "Your very own food schedule",
//                               style:
//                                   TextStyle(fontSize: 16, color: Colors.grey),
//                             ),

//                             //Code for Form (Height)
//                             const SizedBox(height: 24),
//                             Form(
//                                 key: _scheduleKey,
//                                 child: Column(
//                                   children: [
//                                     TextFormField(
//                                       enabled: false,
//                                       cursorColor: const Color(0XFF91C788),
//                                       keyboardType: TextInputType.number,
//                                       decoration: InputDecoration(
//                                         hintText: foodId,
//                                         icon: const Icon(Icons.fastfood,
//                                             color: Color(0XFF91C788)),
//                                         labelText: "Food ID",
//                                         labelStyle: const TextStyle(
//                                             color: Colors.black),
//                                         filled: true,
//                                         fillColor: Colors.grey,
//                                         disabledBorder:
//                                             const OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         focusedBorder: const OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         enabledBorder: const OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         errorBorder: const OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.red,
//                                           ),
//                                         ),
//                                         focusedErrorBorder:
//                                             const OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.red,
//                                           ),
//                                         ),
//                                       ),
//                                       controller: ctrlId,
//                                     ),

//                                     //Code for Form (Weight)
//                                     const SizedBox(height: 24),
//                                     TextFormField(
//                                       onTap: () async {
//                                         DateTime date = DateTime.now();
//                                         DateTime? pickedDate =
//                                             await showDatePicker(
//                                           context: context,
//                                           initialDate: date,
//                                           firstDate: DateTime(2020),
//                                           lastDate: DateTime(2024),
//                                           builder: (context, child) {
//                                             return Theme(
//                                               data: Theme.of(context).copyWith(
//                                                 colorScheme:
//                                                     const ColorScheme.light(
//                                                   primary: Color(0XFF52734D),
//                                                   onPrimary: Colors.white,
//                                                   onSurface: Colors.black,
//                                                 ),
//                                                 textButtonTheme:
//                                                     TextButtonThemeData(
//                                                   style: TextButton.styleFrom(
//                                                     foregroundColor:
//                                                         const Color(0XFF91C788),
//                                                   ),
//                                                 ),
//                                               ),
//                                               child: child!,
//                                             );
//                                           },
//                                         );

//                                         if (pickedDate != null) {
//                                           String formattedDate =
//                                               DateFormat('dd/MM/yyyy')
//                                                   .format(pickedDate);
//                                           setState(() {
//                                             ctrlDate.text = formattedDate;
//                                           });
//                                         } else {
//                                           String formattedDate =
//                                               DateFormat('dd/MM/yyyy')
//                                                   .format(date);
//                                           setState(() {
//                                             ctrlDate.text = formattedDate;
//                                           });
//                                         }
//                                       },
//                                       readOnly: true,
//                                       cursorColor: const Color(0XFF91C788),
//                                       keyboardType: TextInputType.datetime,
//                                       decoration: const InputDecoration(
//                                         icon: Icon(Icons.calendar_month,
//                                             color: Color(0XFF91C788)),
//                                         labelText: "Date",
//                                         labelStyle:
//                                             TextStyle(color: Colors.black),
//                                         filled: true,
//                                         fillColor: Colors.white,
//                                         focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         errorBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.red,
//                                           ),
//                                         ),
//                                         focusedErrorBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.red,
//                                           ),
//                                         ),
//                                       ),
//                                       controller: ctrlDate,
//                                       autovalidateMode:
//                                           AutovalidateMode.onUserInteraction,
//                                       validator: (value) {
//                                         return value!.isEmpty
//                                             ? 'Date cannot be empty!'
//                                             : null;
//                                       },
//                                     ),

//                                     //Code for Form (Age)
//                                     const SizedBox(height: 24),
//                                     TextFormField(
//                                       onTap: () async {
//                                         TimeOfDay time = TimeOfDay.now();
//                                         TimeOfDay? pickedTime =
//                                             await showTimePicker(
//                                           context: context,
//                                           initialTime: time,
//                                           builder: (context, child) {
//                                             return Theme(
//                                               data: Theme.of(context).copyWith(
//                                                 colorScheme:
//                                                     const ColorScheme.light(
//                                                   primary: Color(0XFF52734D),
//                                                   onPrimary: Colors.white,
//                                                   onSurface: Colors.black,
//                                                 ),
//                                                 textButtonTheme:
//                                                     TextButtonThemeData(
//                                                   style: TextButton.styleFrom(
//                                                     foregroundColor:
//                                                         const Color(0XFF91C788),
//                                                   ),
//                                                 ),
//                                               ),
//                                               child: child!,
//                                             );
//                                           },
//                                         );
//                                         if (mounted) {
//                                           if (pickedTime != null &&
//                                               pickedTime != time) {
//                                             time = pickedTime;
//                                             String formattedTime =
//                                                 pickedTime.format(context);
//                                             setState(() {
//                                               ctrlTime.text = formattedTime;
//                                             });
//                                           } else {
//                                             String formattedTime =
//                                                 time.format(context);
//                                             setState(() {
//                                               ctrlTime.text = formattedTime;
//                                             });
//                                           }
//                                         }
//                                       },
//                                       readOnly: true,
//                                       cursorColor: const Color(0XFF91C788),
//                                       keyboardType: TextInputType.number,
//                                       decoration: const InputDecoration(
//                                         icon: Icon(Icons.timer_outlined,
//                                             color: Color(0XFF91C788)),
//                                         labelText: "Time",
//                                         labelStyle:
//                                             TextStyle(color: Colors.black),
//                                         filled: true,
//                                         fillColor: Colors.white,
//                                         focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         errorBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.red,
//                                           ),
//                                         ),
//                                         focusedErrorBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.red,
//                                           ),
//                                         ),
//                                       ),
//                                       controller: ctrlTime,
//                                       autovalidateMode:
//                                           AutovalidateMode.onUserInteraction,
//                                       validator: (value) {
//                                         return value!.isEmpty
//                                             ? 'Time cannot be empty!'
//                                             : null;
//                                       },
//                                     ),

//                                     //Code for Form (Gender)
//                                     const SizedBox(height: 24),
//                                     DropdownButtonFormField(
//                                         focusColor: Colors.transparent,
//                                         decoration: const InputDecoration(
//                                           icon: Icon(Icons.architecture,
//                                               color: Color(0XFF91C788)),
//                                           labelText: "Measurement",
//                                           labelStyle:
//                                               TextStyle(color: Colors.black),
//                                           filled: true,
//                                           fillColor: Colors.white,
//                                           focusedBorder: OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                           enabledBorder: OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                           errorBorder: OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                               color: Colors.red,
//                                             ),
//                                           ),
//                                           focusedErrorBorder:
//                                               OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                               color: Colors.red,
//                                             ),
//                                           ),
//                                         ),
//                                         isExpanded: true,
//                                         value: selectedMeasurement,
//                                         selectedItemBuilder:
//                                             (BuildContext context) {
//                                           return getAllMeasurements(servings)
//                                               .map((String items) {
//                                             return Text(items,
//                                                 overflow:
//                                                     TextOverflow.ellipsis);
//                                           }).toList();
//                                         },
//                                         items: getAllMeasurements(servings)
//                                             .map((String items) {
//                                           return DropdownMenuItem(
//                                               value: items,
//                                               child: Text(items,
//                                                   maxLines: 2,
//                                                   style: const TextStyle(
//                                                       overflow: TextOverflow
//                                                           .ellipsis)));
//                                         }).toList(),
//                                         onChanged: (String? newValue) {
//                                           setState(() {
//                                             selectedMeasurement = newValue!;
//                                           });
//                                         },
//                                         onSaved: (String? newValue) {
//                                           setState(() {
//                                             selectedMeasurement = newValue!;
//                                           });
//                                         }),

//                                     //Code for Form (Activity)
//                                     const SizedBox(height: 24),
//                                     TextFormField(
//                                       cursorColor: const Color(0XFF91C788),
//                                       keyboardType: TextInputType.number,
//                                       decoration: const InputDecoration(
//                                         icon: Icon(Icons.discount,
//                                             color: Color(0XFF91C788)),
//                                         labelText: "Quantity",
//                                         labelStyle:
//                                             TextStyle(color: Colors.black),
//                                         filled: true,
//                                         fillColor: Colors.white,
//                                         focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         errorBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.red,
//                                           ),
//                                         ),
//                                         focusedErrorBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.red,
//                                           ),
//                                         ),
//                                       ),
//                                       controller: ctrlQuantity,
//                                       autovalidateMode:
//                                           AutovalidateMode.onUserInteraction,
//                                       validator: (value) {
//                                         return value.toString().length > 4
//                                             ? 'Quantity must be at most 4 characters!'
//                                             : null;
//                                       },
//                                     ),

//                                     const SizedBox(height: 16),
//                                     SizedBox(
//                                       width: double.infinity,
//                                       child: ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                             shape: const StadiumBorder(),
//                                             backgroundColor:
//                                                 const Color(0XFF91C788)),
//                                         onPressed: () {
//                                           if (ctrlDate.text.isEmpty &&
//                                               ctrlTime.text.isEmpty &&
//                                               ctrlQuantity.text.isEmpty) {
//                                             ToastUi.toastErr(
//                                                 "Please fill all the fields first!");
//                                           } else if (ctrlDate.text.isEmpty ||
//                                               ctrlTime.text.isEmpty ||
//                                               ctrlQuantity.text.isEmpty) {
//                                             ToastUi.toastErr(
//                                                 "One or more field is empty!");
//                                           } else {
//                                             createSchedule(
//                                                 state?.id as String,
//                                                 ctrlDate.text,
//                                                 ctrlTime.text,
//                                                 ctrlId.text,
//                                                 ctrlQuantity.text);
//                                           }
//                                         },
//                                         child: const Text("Add to schedule!"),
//                                       ),
//                                     )
//                                   ],
//                                 )),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ));
//           },
//         ));
//   }
// }

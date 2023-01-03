// part of 'pages.dart';

// class Ongkirpage extends StatefulWidget {
//   const Ongkirpage({Key? key}) : super(key: key);

//   @override
//   _OngkirpageState createState() => _OngkirpageState();
// }

// class _OngkirpageState extends State<Ongkirpage> {
//   bool isLoading = false;
//   String selectedKurir = 'jne';
//   var kurir = ['jne', 'pos', 'tiki'];

//   final ctrlBerat = TextEditingController();

//   dynamic provId;
//   dynamic provinceData;
//   dynamic provinceDataDes;
//   dynamic selectedProv;
//   dynamic destinationProv;
//   Future<List<Province>> getProvinces() async {
//     dynamic listProvince;
//     await MasterDataService.getProvince().then((value) {
//       setState(() {
//         listProvince = value;
//       });
//     });

//     return listProvince;
//   }

//   dynamic cityId;
//   dynamic cityIdDes;
//   dynamic cityData;
//   dynamic cityDataDes;
//   dynamic selectedCity;
//   dynamic destinationCity;
//   Future<List<City>> getCities(dynamic provId) async {
//     dynamic listCity;
//     await MasterDataService.getCity(provId).then((value) {
//       setState(() {
//         listCity = value;
//       });
//     });

//     return listCity;
//   }

//   List<Costs> listCosts = [];
//   Future<dynamic> getCostsData() async {
//     await RajaOngkirService.getMyOngkir(
//             cityId, cityIdDes, int.parse(ctrlBerat.text), selectedKurir)
//         .then((value) {
//       setState(() {
//         listCosts = value;
//         isLoading = false;
//       });
//       print(listCosts.toString());
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     provinceData = getProvinces();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Hitung Ongkir"),
//         centerTitle: true,
//       ),
//       body: Stack(
//         children: [
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             child: Column(
//               children: [
//                 // Flexible untuk form
//                 Flexible(
//                   flex: 6,
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             DropdownButton(
//                                 value: selectedKurir,
//                                 icon: Icon(Icons.arrow_drop_down),
//                                 items: kurir.map((String items) {
//                                   return DropdownMenuItem(
//                                     value: items,
//                                     child: Text(items),
//                                   );
//                                 }).toList(),
//                                 onChanged: (String? newValue) {
//                                   setState(() {
//                                     selectedKurir = newValue!;
//                                   });
//                                 }),
//                             SizedBox(
//                               width: 200,
//                               child: TextFormField(
//                                 keyboardType: TextInputType.number,
//                                 controller: ctrlBerat,
//                                 decoration: InputDecoration(
//                                   labelText: 'Berat (gr)',
//                                 ),
//                                 autovalidateMode:
//                                     AutovalidateMode.onUserInteraction,
//                                 validator: (value) {
//                                   return value == null || value == 0
//                                       ? "Berat harus diisi atau tidak boleh 0"
//                                       : null;
//                                 },
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(16.0),
//                         child: Align(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             "Origin",
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               width: 150,
//                               child: FutureBuilder<List<Province>>(
//                                   future: provinceData,
//                                   builder: (context, snapshot) {
//                                     if (snapshot.hasData) {
//                                       return DropdownButton(
//                                           isExpanded: true,
//                                           value: selectedProv,
//                                           icon: Icon(Icons.arrow_drop_down),
//                                           iconSize: 30,
//                                           elevation: 16,
//                                           style: TextStyle(color: Colors.black),
//                                           hint: selectedProv == null
//                                               ? Text('Pilih Provinsi')
//                                               : Text(selectedProv.province),
//                                           items: snapshot.data!
//                                               .map<DropdownMenuItem<Province>>(
//                                                   (Province value) {
//                                             return DropdownMenuItem(
//                                                 value: value,
//                                                 child: Text(
//                                                     value.province.toString()));
//                                           }).toList(),
//                                           onChanged: (newValue) {
//                                             setState(() {
//                                               selectedProv = newValue;
//                                               provId = selectedProv.provinceId;
//                                             });
//                                             selectedCity = null;
//                                             cityData = getCities(provId);
//                                           });
//                                     } else if (snapshot.hasError) {
//                                       return Text("Tidak ada data.");
//                                     }
//                                     return UiLoading.loadingDD();
//                                   }),
//                             ),
//                             Container(
//                               width: 150,
//                               child: FutureBuilder<List<City>>(
//                                   future: cityData,
//                                   builder: (context, snapshot) {
//                                     if (selectedProv != null) {
//                                       if (snapshot.hasData) {
//                                         UiLoading.loadingDD();
//                                         return DropdownButton(
//                                             isExpanded: true,
//                                             value: selectedCity,
//                                             icon: Icon(Icons.arrow_drop_down),
//                                             iconSize: 30,
//                                             elevation: 16,
//                                             style:
//                                                 TextStyle(color: Colors.black),
//                                             hint: selectedCity == null
//                                                 ? Text('Pilih Kota')
//                                                 : Text(selectedCity.cityName),
//                                             items: snapshot.data!
//                                                 .map<DropdownMenuItem<City>>(
//                                                     (City value) {
//                                               return DropdownMenuItem(
//                                                   value: value,
//                                                   child: Text(value.cityName
//                                                       .toString()));
//                                             }).toList(),
//                                             onChanged: (newValue) {
//                                               setState(() {
//                                                 selectedCity = newValue;
//                                                 cityId = selectedCity.cityId;
//                                               });
//                                               destinationProv = null;
//                                               cityData = getCities(provId);
//                                             });
//                                       }
//                                       return UiLoading.loadingDD();
//                                     } else {
//                                       return Text("Pilih Provinsi Dulu");
//                                     }
//                                   }),
//                             )
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(16.0),
//                         child: Align(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             "Destination",
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               width: 150,
//                               child: FutureBuilder<List<Province>>(
//                                   future: provinceData,
//                                   builder: (context, snapshot) {
//                                     if (snapshot.hasData) {
//                                       return DropdownButton(
//                                           isExpanded: true,
//                                           value: destinationProv,
//                                           icon: Icon(Icons.arrow_drop_down),
//                                           iconSize: 30,
//                                           elevation: 16,
//                                           style: TextStyle(color: Colors.black),
//                                           hint: destinationProv == null
//                                               ? Text('Pilih Provinsi')
//                                               : Text(destinationProv.province),
//                                           items: snapshot.data!
//                                               .map<DropdownMenuItem<Province>>(
//                                                   (Province value) {
//                                             return DropdownMenuItem(
//                                                 value: value,
//                                                 child: Text(
//                                                     value.province.toString()));
//                                           }).toList(),
//                                           onChanged: (newValue) {
//                                             setState(() {
//                                               destinationProv = newValue;
//                                               provId =
//                                                   destinationProv.provinceId;
//                                             });
//                                             destinationCity = null;
//                                             cityDataDes = getCities(provId);
//                                           });
//                                     } else if (snapshot.hasError) {
//                                       return Text("Tidak ada data.");
//                                     }
//                                     return UiLoading.loadingDD();
//                                   }),
//                             ),
//                             Container(
//                               width: 150,
//                               child: FutureBuilder<List<City>>(
//                                   future: cityDataDes,
//                                   builder: (context, snapshot) {
//                                     if (destinationProv != null) {
//                                       if (snapshot.hasData) {
//                                         UiLoading.loadingDD();
//                                         return DropdownButton(
//                                             isExpanded: true,
//                                             value: destinationCity,
//                                             icon: Icon(Icons.arrow_drop_down),
//                                             iconSize: 30,
//                                             elevation: 16,
//                                             style:
//                                                 TextStyle(color: Colors.black),
//                                             hint: destinationCity == null
//                                                 ? Text('Pilih Kota')
//                                                 : Text(
//                                                     destinationCity.cityName),
//                                             items: snapshot.data!
//                                                 .map<DropdownMenuItem<City>>(
//                                                     (City value) {
//                                               return DropdownMenuItem(
//                                                   value: value,
//                                                   child: Text(value.cityName
//                                                       .toString()));
//                                             }).toList(),
//                                             onChanged: (newValue) {
//                                               setState(() {
//                                                 destinationCity = newValue;
//                                                 cityIdDes =
//                                                     destinationCity.cityId;
//                                               });
//                                               cityDataDes = null;
//                                               cityDataDes = getCities(provId);
//                                             });
//                                       }
//                                       return UiLoading.loadingDD();
//                                     } else {
//                                       return Text("Pilih Provinsi Dulu");
//                                     }
//                                   }),
//                             ),
//                           ],
//                         ),
//                       ),
//                       ElevatedButton(
//                           onPressed: () {
//                             MasterDataService.getMahasiswa();
//                             // if (cityData == null ||
//                             //     cityDataDes == null ||
//                             //     selectedKurir.isEmpty ||
//                             //     ctrlBerat.text.isEmpty) {
//                             //   UiToast.toastErr("Semua field harus diisi");
//                             // } else {
//                             //   setState((() {
//                             //     isLoading = true;
//                             //   }));
//                             //   getCostsData();
//                             // }
//                           },
//                           child: Text("Hitung Estimasi Harga"))
//                     ],
//                   ),
//                 ),
//                 // Flexible untuk nampilin data
//                 Flexible(
//                     flex: 5,
//                     child: Container(
//                       width: double.infinity,
//                       height: double.infinity,
//                       child: listCosts.isEmpty
//                           ? const Align(
//                               alignment: Alignment.center,
//                               child: Text("Tidak ada data"))
//                           : ListView.builder(
//                               itemCount: listCosts.length,
//                               itemBuilder: (context, index) {
//                                 return LazyLoadingList(
//                                     initialSizeOfItems: 10,
//                                     loadMore: () {},
//                                     child: CardOngkir(listCosts[index]),
//                                     index: index,
//                                     hasMore: true);
//                               },
//                             ),
//                     )),
//               ],
//             ),
//           ),
//           isLoading == true ? UiLoading.loadingBlock() : Container(),
//         ],
//       ),
//     );
//   }
// }

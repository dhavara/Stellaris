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
        body: Stack(
          children: [
            Container(
              child: Column(children: <Widget>[
                Flexible(
                  child: Row(
                    children: <Widget>[
                      Flexible(
                          child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 20,
                              offset: Offset(
                                5,
                                10,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        margin: const EdgeInsets.all(8),
                        height: 300,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "06.20 AM",
                                  style: TextStyle(
                                      fontSize: 30, fontFamily: 'Raleway'),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    'https://www.seriouseats.com/thmb/XKSL1Um5be2_06GcEl3ZVwvrqno=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__2020__02__20200128-juk-korean-rice-porridge-vicky-wasik-6-4f8d19174e3a481c8d1118104fd461aa.jpg',
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "PORRIDGE",
                                  style: TextStyle(fontSize: 24),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Breakfast",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Calorie: ",
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                      Flexible(
                          child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 20,
                              offset: Offset(
                                5,
                                10,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        ),
                        margin: const EdgeInsets.all(8),
                        height: 300,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "06.20 AM",
                                  style: TextStyle(
                                      fontSize: 30, fontFamily: 'Raleway'),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/porridge-with-quick-berry-compote-figs-pistachios-7187c9f.jpg?quality=90&webp=true&resize=300,272',
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "PORRIDGE",
                                  style: TextStyle(fontSize: 24),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Breakfast",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                        child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 20,
                            offset: Offset(
                              5,
                              10,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      ),
                      margin: const EdgeInsets.all(8),
                      height: 300,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "06.20 AM",
                                style: TextStyle(
                                    fontSize: 30, fontFamily: 'Raleway'),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  'https://cdn.apartmenttherapy.info/image/upload/f_jpg,q_auto:eco,c_fill,g_auto,w_1500,ar_1:1/k%2FPhoto%2FRecipe%20Ramp%20Up%2F2022-04-Porridge%2FIMG_7918_R3',
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "PORRIDGE",
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Breakfast",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
                    Flexible(
                        child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 20,
                            offset: Offset(
                              5,
                              10,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      ),
                      margin: const EdgeInsets.all(8),
                      height: 300,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "06.20 AM",
                                style: TextStyle(
                                    fontSize: 30, fontFamily: 'Raleway'),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  'https://www.seriouseats.com/thmb/XKSL1Um5be2_06GcEl3ZVwvrqno=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__2020__02__20200128-juk-korean-rice-porridge-vicky-wasik-6-4f8d19174e3a481c8d1118104fd461aa.jpg',
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "PORRIDGE",
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Breakfast",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
                  ],
                ),
                //nambah flexible
              ]),
            ),
            //button
          ],
        ));
  }
}

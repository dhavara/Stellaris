// import 'dart:async';
// import 'dart:convert';

// import 'package:afl2_cloudcomputing/services/services.dart';
// import 'package:afl2_cloudcomputing/views/completedone.dart';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:uni_links/uni_links.dart';

// class Sendmail extends StatefulWidget {
//   const Sendmail({Key? key}) : super(key: key);

//   @override
//   State<Sendmail> createState() => _SendmailState();
// }

// class _SendmailState extends State<Sendmail> {
//   @override
//   void initState() {
//     super.initState();
//     _handleIncomingLinks();
//     _handleInitialUri();
//   }

//   final _loginKey = GlobalKey<FormState>();
//   final ctrlEmail = TextEditingController();
//   String _message = '';

//   @override
//   void dispose() {
//     ctrlEmail.dispose();
//     super.dispose();
//   }

//   Uri? _initialUri;
//   Uri? _latestUri;
//   Object? _err;
//   StreamSubscription? _sub;
//   bool _initialUriIsHandled = false;
//   final _scaffoldkey = GlobalKey();

//   void _handleIncomingLinks() {
//     if (!kIsWeb) {
//       _sub = uriLinkStream.listen((Uri? uri) {
//         print('got uri: $uri');
//         setState(() {
//           _latestUri = uri;
//           _err = null;
//         });
//       }, onError: (Object err) {
//         print('got err: $err');
//         setState(() {
//           _latestUri = null;
//           if (err is FormatException) {
//             _err = err;
//           } else {
//             _err = null;
//           }
//         });
//       });
//     }
//   }

//   Future<void> _handleInitialUri() async {
//     if (!_initialUriIsHandled) {
//       _initialUriIsHandled = true;
//       try {
//         final uri = await getInitialUri();
//         if (uri == null) {
//           print('no initial uri');
//         } else {
//           print('got initial uri: $uri');
//           final context = _scaffoldkey.currentContext;
//           if (context != null) {
//             Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute<dynamic>(
//                     builder: (context) => const MyComplete()));
//           }
//         }
//         setState(() => _initialUri = uri);
//       } on PlatformException {
//         print('failed to get initial uri');
//       } on FormatException catch (err) {
//         print('malformed initial uri' + err.toString());
//         setState(() => _err = err);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldkey,
//       appBar: AppBar(title: const Text("Send Email")),
//       body: Container(
//         padding: const EdgeInsets.all(32),
//         child: Form(
//           key: _loginKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextFormField(
//                 keyboardType: TextInputType.emailAddress,
//                 // ignore: prefer_const_constructors
//                 decoration: InputDecoration(
//                     labelText: "Email Receiver",
//                     prefixIcon: const Icon(Icons.email)),
//                 controller: ctrlEmail,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 validator: (value) {
//                   return !EmailValidator.validate(value.toString())
//                       ? 'Email tidak valid'
//                       : null;
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           if (_loginKey.currentState!.validate()) {
//             await EmailService.sendmail(ctrlEmail.text.toString())
//                 .then((value) {
//               var result = json.decode(value.body);
//               print(result);
//               _message = result['message'].toString();
//             });
//             Fluttertoast.showToast(msg: _message);
//           } else {
//             const Text("Please fill the box!");
//           }
//         },
//         tooltip: 'Send Email',
//         child: const Icon(Icons.send),
//       ),
//     );
//   }
// }
// part of '../pages.dart';

// class UserProfile extends StatefulWidget {
//   const UserProfile({super.key});

//   @override
//   State<UserProfile> createState() => _UserProfileState();
// }

// // Profiel Class here
// class _UserProfileState extends State<UserProfile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//         actions: [
//           IconButton(
//               icon: const Icon(Icons.logout),
//               color: Colors.white,
//               onPressed: () async {
//                 SharedPreferences prefs = await SharedPreferences.getInstance();
//                 prefs.remove('id');
//                 if (!mounted) return;
//                 BlocProvider.of<UserCubit>(context).logout();
//                 Navigator.pushAndRemoveUntil<dynamic>(
//                     context,
//                     MaterialPageRoute<dynamic>(
//                         builder: (context) => const LoginPage()),
//                     (route) => false);
//               }),
//         ],
//         backgroundColor: const Color(0xFF91C788),
//       ),
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
//         child: Column(
//           children: [
//             Container(
//                 width: double.infinity,
//                 child: Card(
//                     elevation: 10,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                     color: Colors.white,
//                     margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
//                     child: Column(
//                       children: [
//                         ListTile(
//                           title: Padding(
//                             padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
//                             child: Text("Hallo ",
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20,
//                                     color: Colors.black)),
//                           ),
//                         ),
//                         TextButton(
//                             onPressed: () {
//                               Navigator.push<dynamic>(
//                                   context,
//                                   MaterialPageRoute<dynamic>(
//                                       builder: (context) => UserProfile()));
//                             },
//                             child: const Text("Profile",
//                                 style: TextStyle(
//                                   color: Color(0XFF91C788),
//                                 )))
//                       ],
//                     ))),
//             const SizedBox(height: 24),
//             // Recommended Food
//             const Text("Recommended Food",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                 textAlign: TextAlign.left),
//             const SizedBox(height: 24),
//             // Calculate History
//             const Text("Calculate History",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                 textAlign: TextAlign.left),
//             const SizedBox(height: 24),
//           ],
//         ),
//       ),
//     );
//   }
// }


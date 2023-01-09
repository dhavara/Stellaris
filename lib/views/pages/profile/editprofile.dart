part of '../pages.dart';

class editprofile extends StatefulWidget {
  const editprofile({super.key});

  @override
  State<editprofile> createState() => _editprofileState();
}

final _editKey = GlobalKey<FormState>();
final ctrlName = TextEditingController();
final ctrlEmail = TextEditingController();
final ctrlPass = TextEditingController();
bool isHidden = true;

@override
void dispose() {
  ctrlName.dispose();
  ctrlEmail.dispose();
  ctrlPass.dispose();
}

class _editprofileState extends State<editprofile> {
  bool editSuccess = false;
  void editProfile(String id, String name, String password) async {
    await ProfileController.edit(id, name, password).then((value) {
      editSuccess = value;
    });
    if (!mounted) return;
    if (editSuccess) {
      ToastUi.toastOk("Form submitted successfully!");
      Navigator.pop(context, true);
    } else {
      ToastUi.toastErr("Something went wrong!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, User?>(builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Edit Profile'),
          backgroundColor: const Color(0xFF91C788),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Edit Your Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const Text(
                "Please fill in your data",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              //Code for Form (Name)
              const SizedBox(height: 16),
              Form(
                key: _editKey,
                child: Column(children: [
                  const SizedBox(height: 16),
                  TextFormField(
                    cursorColor: const Color(0XFF91C788),
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.person, color: Colors.black),
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
                    controller: ctrlName,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return (value.toString().length > 3 ||
                              value.toString().isEmpty)
                          ? null
                          : 'Name must be at least 3 characters!';
                    },
                  ),

                  //Code for Form (Password)
                  const SizedBox(height: 16),
                  TextFormField(
                    cursorColor: const Color(0XFF91C788),
                    obscureText: isHidden,
                    decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
                        },
                        child: Icon(
                            isHidden ? Icons.visibility : Icons.visibility_off,
                            color: Colors.black),
                      ),
                      labelStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(Icons.lock, color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
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
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    controller: ctrlPass,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return (value.toString().length > 8 ||
                              value.toString().isEmpty)
                          ? null
                          : 'Password must be at least 8 characters!';
                    },
                  ),
                  //Code for Validate and Alert Dialog
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: const Color(0XFF91C788)),
                        onPressed: () {
                          if (_editKey.currentState!.validate()) {
                            String name =
                                ctrlName.text.isEmpty ? "" : ctrlName.text;
                            String password =
                                ctrlPass.text.isEmpty ? "" : ctrlPass.text;
                            if (name == "" && password == "") {
                              ToastUi.toastErr(
                                  "Please fill one or more fields!");
                            } else {
                              editProfile(state?.id as String, name, password);
                            }
                          }
                        },
                        child: const Text("Update")),
                  ),
                ]),
              )
            ],
          ),
        ),
      );
    });
  }
}

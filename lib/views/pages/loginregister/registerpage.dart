part of '../pages.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    super.initState();
  }

  final _registerKey = GlobalKey<FormState>();
  final ctrlName = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
  bool isHidden = true;

  @override
  void dispose() {
    ctrlName.dispose();
    ctrlEmail.dispose();
    ctrlPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Register'),
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
              "Welcome",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const Text(
              "Please fill in your data",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            //Code for Form (Name)
            const SizedBox(height: 16),
            Form(
              key: _registerKey,
              child: Column(children: [
                const SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.person, color: Colors.black),
                    filled: true,
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
                    return value.toString().length < 3
                        ? 'Name must be at least 3 characters!'
                        : null;
                  },
                ),

                //Code for Form (Email)
                const SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.email, color: Colors.black),
                    filled: true,
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
                  controller: ctrlEmail,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return !EmailValidator.validate(value.toString())
                        ? 'Invalid email!'
                        : null;
                  },
                ),

                //Code for Form (Password)
                const SizedBox(height: 16),
                TextFormField(
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
                    return value.toString().length < 8
                        ? 'Password must be at least 8 characters!'
                        : null;
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
                        if (_registerKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: const Text('Successfully logged in!'),
                              actions: [
                                TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor:
                                            const Color(0XFF91C788)),
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil<dynamic>(
                                          context,
                                          MaterialPageRoute<dynamic>(
                                              builder: (conrext) =>
                                                  const MainMenuPage()),
                                          (route) => false);
                                    },
                                    child: const Text('Continue'))
                              ],
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content:
                                  const Text('Please fill all the fields!'),
                              actions: [
                                TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor:
                                            const Color(0XFF91C788)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Try Again'))
                              ],
                            ),
                          );
                        }
                      },
                      child: const Text("Register")),
                ),

                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil<dynamic>(
                              context,
                              MaterialPageRoute<dynamic>(
                                  builder: (context) => const LoginPage()),
                              (route) => false);
                        },
                        child: const Text("Login",
                            style: TextStyle(
                              color: Color(0XFF91C788),
                            )))
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}

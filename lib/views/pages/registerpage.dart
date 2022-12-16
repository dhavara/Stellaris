part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register")
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
          child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
              const Text(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                "Welcome"),
                const Text(
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  "Please fill in your data"),

                  Form(
                    child: 
                    TextFormField(

                    )
                    )
            ],
            )
          
        ,
      ),
    );
  }
}
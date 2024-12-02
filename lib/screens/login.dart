import 'package:flutter/material.dart';
import 'package:snap_app/routes/page_routes.dart';
import 'package:snap_app/widgets/beveled_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String routeName = "/LoginPage";


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final formKey = GlobalKey<FormState>();
  final emailCntrl = TextEditingController();
  final passCntrl = TextEditingController();
  bool loginStatus = false;
  String email='';
  String password='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Card(
          color: Colors.orange.withOpacity(0.7),
          elevation: 10,
          margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              // physics: NeverScrollableScrollPhysics(),
              child: SafeArea(child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField( 
                      controller: emailCntrl,
                      maxLength: 30,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter Email', 
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value){
                        setState(() {
                          email = value.toString()
                        });
                      },
                    )
                  ],
                ))),
            )
          ),
        ),
      ),
    );
  }
}

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
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: BeveledButton(
                  title: "Login",
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, PageRoutes.wishListPage);
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

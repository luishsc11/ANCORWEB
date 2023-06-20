import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'caixa.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = false;
  final email = TextEditingController();
  final senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('web/assets/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 150, top: 150),
        child: Row(
          children: [
            SizedBox(height: 60),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 45),
                    child: Text(
                      'ANCOR SEGUROS',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.grey[300]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Entre em sua conta com seu usuário',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.grey[300]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Card(
                      color: Colors.grey.withOpacity(.4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          controller: email,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Usuário',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.grey[300],
                                ),
                                onPressed: () {},
                              ),
                              labelStyle: TextStyle(color: Colors.grey[300]),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.grey.withOpacity(.4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextField(
                        controller: senha,
                        style: const TextStyle(color: Colors.white),
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                            labelText: 'Senha',
                            suffixIcon: IconButton(
                              icon: Icon(
                                isVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey[300],
                              ),
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                            ),
                            labelStyle: TextStyle(color: Colors.grey[300]),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: CupertinoButton(
                      color: Colors.blue,
                      child: Text('LOGIN'),
                      onPressed: () {
                        if (email.text == 'admin' && senha.text == '123') {
                          final snackBar = SnackBar(content: Text('Enviado'));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(flex: 2, child: Card())
          ],
        ),
      ),
    ));
  }
}

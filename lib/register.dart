// register.dart

import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        actions: [
          IconButton(
            tooltip: "Login",
            icon: Icon(Icons.login),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Tampilan mobile
            return Center(
              child: Container(
                width: 300, // Maximum form width
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nama Depan'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nama Belakang'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Username', icon: Icon(Icons.person)),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Password', icon: Icon(Icons.lock)),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      child: Text('Register'),
                    ),
                  ],
                ),
              ),
            );
          } else {
            // Tampilan desktop
            return Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Container(
                      width: 500, // Maximum form width
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 70,
                              ),
                            ),
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Nama Depan'),
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Nama Belakang'),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Username',
                                icon: Icon(Icons.person)),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Password', icon: Icon(Icons.lock)),
                            obscureText: true,
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/');
                            },
                            child: Text('Register'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/kerjaa.png'),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'fragment_holder_admin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController idController = TextEditingController();

  TextEditingController passController = TextEditingController();

  void login() {
    String id = idController.text;

    String pass = passController.text;

    // =========================
    // ADMIN LOGIN
    // =========================

    if (id == "admin" && pass == "1234") {
      Navigator.pushReplacement(
        context,

        MaterialPageRoute(builder: (context) => const WidgetFragmentHolder()),
      );
    }
    // =========================
    // USER LOGIN
    // =========================
    else if (id == "user" && pass == "1111") {
      Navigator.pushReplacement(
        context,

        MaterialPageRoute(builder: (context) => const WidgetFragmentHolder()),
      );
    }
    // =========================
    // INVALID
    // =========================
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,

          content: Text("Invalid ID or Password"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 194, 255, 242),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),

            padding: const EdgeInsets.all(25),

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(20),

              boxShadow: const [
                BoxShadow(
                  blurRadius: 10,

                  color: Colors.black12,

                  offset: Offset(0, 4),
                ),
              ],
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                // ===================
                // ICON
                // ===================
                Container(
                  height: 100,
                  width: 100,

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 17, 177, 158),

                    borderRadius: BorderRadius.circular(50),
                  ),

                  child: const Icon(
                    Icons.how_to_vote,

                    size: 60,

                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                // ===================
                // TITLE
                // ===================
                const Text(
                  "E-Voting System",

                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 30),

                // ===================
                // ID FIELD
                // ===================
                TextField(
                  controller: idController,

                  decoration: InputDecoration(
                    filled: true,

                    fillColor: Colors.grey.shade100,

                    prefixIcon: const Icon(Icons.person),

                    hintText: "Enter ID",

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),

                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ===================
                // PASSWORD FIELD
                // ===================
                TextField(
                  controller: passController,

                  obscureText: true,

                  decoration: InputDecoration(
                    filled: true,

                    fillColor: Colors.grey.shade100,

                    prefixIcon: const Icon(Icons.lock),

                    hintText: "Enter Password",

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),

                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // ===================
                // LOGIN BUTTON
                // ===================
                SizedBox(
                  width: double.infinity,

                  height: 50,

                  child: ElevatedButton(
                    onPressed: login,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 17, 177, 158),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                    child: const Text(
                      "Login",

                      style: TextStyle(
                        fontSize: 18,

                        color: Colors.white,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ===================
                // DEMO LOGIN INFO
                // ===================
                Container(
                  padding: const EdgeInsets.all(12),

                  decoration: BoxDecoration(
                    color: Colors.teal.shade50,

                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text("Don't have an account ?Create account"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

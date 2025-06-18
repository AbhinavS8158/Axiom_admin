import 'package:flutter/material.dart';

class Loginimge extends StatelessWidget {
  const Loginimge({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'asset/images/login-concept-illustration.png',
                        width: 320,
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Welcome to AXIOM",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "Join our community and start your journey with us today",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF388E3C),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
  }
}
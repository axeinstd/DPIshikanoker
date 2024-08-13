import 'package:flutter/material.dart';
import 'package:dpi_shikanoker_on_gdbdpi/src/pages/home.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> _loadNecessary() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  void initState() {
    super.initState();
    _loadNecessary();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Padding(padding: EdgeInsets.only(top: 15)),
            Text('оленяяяя', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
          ],
        ),
      ),
    );
  }
}

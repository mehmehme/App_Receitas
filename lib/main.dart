import 'package:boas_receitas/p%C3%A1ginas/login.dart';
import 'package:flutter/material.dart';
import 'tema/util.dart';
import 'tema/theme.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme =
        createTextTheme(context, "Open Sans Condensed", "Pacifico");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Receitinhas na Cozinha',
      theme: theme.light(),
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _opacity = 0.0; // Aplica o fade para desaparecer
      });

      // Depois do fade, navega para a tela de login
      Future.delayed(Duration(milliseconds: 800), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 188, 188),
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(milliseconds: 800),
          child: Image.asset('assets/images/logo.png',
              height: 350), // Ícone ou logo do app
        ),
      ),
    );
  }
}

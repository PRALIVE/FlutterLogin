import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double height =
        MediaQuery.of(context).size.height - kBottomNavigationBarHeight;

    return Scaffold(
      //backgroundColor: Colors.blueAccent,
      resizeToAvoidBottomInset: true,
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return GestureDetector(
            onTap: () {
              // Close the keyboard when the user taps outside of any text field
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Container(
                height: orientation == Orientation.portrait
                    ? height
                    : MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/logo.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      "INICIAR SESIÓN",
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: GoogleFonts.oswald().fontFamily,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 85),
                    TextField(
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1)),
                        labelText: "Ingresa tu correo",
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      style: TextStyle(
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextField(
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1)),
                        labelText: "Contraseña",
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      style: TextStyle(
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 45),
                    Text(
                      "¿Olvidaste tu contraseña?",
                      style: TextStyle(
                        color: Color(0xFFDC4405),
                        fontSize: 14,
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "¿Aún no tienes cuenta? Crea tu cuenta aquí",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 48,
                      child: MaterialButton(
                        onPressed: () {},
                        color: Colors.black,
                        textColor: Colors.white,
                        child: Text(
                          "INGRESAR",
                          style: TextStyle(
                            fontFamily: GoogleFonts.oswald().fontFamily,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

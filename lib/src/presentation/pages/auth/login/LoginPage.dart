import 'package:flutter/material.dart';
import 'package:monos/src/presentation/widgets/defaultTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _glowAnimation;

  late AnimationController _loginBtnController;
  late AnimationController _registerBtnController;
  late Animation<double> _loginBtnScale;
  late Animation<double> _registerBtnScale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _glowAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.repeat(reverse: true);

    _loginBtnController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
    _loginBtnScale = Tween<double>(begin: 1.0, end: 0.94).animate(
      CurvedAnimation(parent: _loginBtnController, curve: Curves.easeInOut),
    );

    _registerBtnController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
    _registerBtnScale = Tween<double>(begin: 1.0, end: 0.94).animate(
      CurvedAnimation(parent: _registerBtnController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _loginBtnController.dispose();
    _registerBtnController.dispose();
    super.dispose();
  }

  void _onButtonPress(AnimationController controller, VoidCallback onTap) async {
    await controller.forward();
    await controller.reverse();
    onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Fondo
            Image.asset(
              'assets/img/imagen inicio 5.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
              color: Colors.black45,
              colorBlendMode: BlendMode.darken,
            ),

            // Tarjeta central — ahora scrolleable
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // LOGO
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withValues(alpha: 0.2 + _glowAnimation.value * 0.3),
                                  blurRadius: 20 + _glowAnimation.value * 25,
                                  spreadRadius: 2 + _glowAnimation.value * 8,
                                ),
                                BoxShadow(
                                  color: const Color.fromARGB(255, 183, 7, 7).withValues(alpha: 0.2 + _glowAnimation.value * 0.25),
                                  blurRadius: 30 + _glowAnimation.value * 20,
                                  spreadRadius: 1 + _glowAnimation.value * 5,
                                ),
                              ],
                            ),
                            child: Transform.scale(
                              scale: _scaleAnimation.value,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/img/monos.png',
                                  width: 200,
                                  height: 200,
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20),

                      // TEXTO BIENVENIDO
                      AnimatedBuilder(
                        animation: _glowAnimation,
                        builder: (context, child) {
                          return Column(
                            children: [
                              Text(
                                'Bienvenido a',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withValues(alpha: 0.6),
                                      blurRadius: 6,
                                      offset: const Offset(1, 1),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '¡MONOS TCG!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 6,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withValues(alpha: 0.8),
                                      blurRadius: 8,
                                      offset: const Offset(2, 2),
                                    ),
                                    Shadow(
                                      color: const Color.fromARGB(255, 183, 7, 7).withValues(alpha: 0.5 + _glowAnimation.value * 0.4),
                                      blurRadius: 15 + _glowAnimation.value * 10,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(5, (i) => Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 3),
                                  width: i == 2 ? 20 : 6,
                                  height: 2,
                                  decoration: BoxDecoration(
                                    color: i == 2
                                        ? const Color.fromARGB(255, 183, 7, 7)
                                        : Colors.white.withValues(alpha: 0.6),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                )),
                              ),
                            ],
                          );
                        },
                      ),

                      const SizedBox(height: 10),

                      // CAMPO CORREO
                      Container(
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: DefaultTextField(
                          label: 'Correo electrónico',
                          icon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (text) {
                            print('Correo: $text');
                          },
                        ),
                      ),

                      // CAMPO CONTRASEÑA
                      Container(
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: DefaultTextField(
                          label: 'Contraseña',
                          icon: Icons.lock,
                          obscureText: true,
                          onChanged: (text) {
                            print('Contraseña: $text');
                          },
                        ),
                      ),

                      // BOTÓN INICIAR SESIÓN
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        child: GestureDetector(
                          onTap: () => _onButtonPress(_loginBtnController, () {
                            // Tu lógica de login aquí
                          }),
                          child: AnimatedBuilder(
                            animation: _loginBtnScale,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _loginBtnScale.value,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 183, 7, 7),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(255, 183, 7, 7).withValues(alpha: 0.5),
                                        blurRadius: 10,
                                        spreadRadius: 1,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Iniciar Sesion',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      const Text(
                        '¿No tienes una cuenta?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // BOTÓN REGISTRARSE
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        child: GestureDetector(
                          onTap: () => _onButtonPress(_registerBtnController, () {
                            Navigator.pushNamed(context, 'register');
                          }),
                          child: AnimatedBuilder(
                            animation: _registerBtnScale,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _registerBtnScale.value,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.5),
                                        blurRadius: 10,
                                        spreadRadius: 1,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Registrate',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
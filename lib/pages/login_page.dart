import 'package:chat_app/helpers/mostrar_alerta.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';
import '../widgets/btn_azul.dart';
import '../widgets/custom_input.dart';
import '../widgets/custom_labels.dart';
import '../widgets/custom_logo.dart';

class LoginPage  extends StatelessWidget {
  const LoginPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const  Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height *0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  
                const Logo( titulo: 'Messenger', ),
                  
                _Form(),
                  
                const Labels( 
                  ruta: 'register', 
                  titulo: '¿No tienes cuenta?',
                  subtitulo: '¡Crea una ahora!',
                ),
                  
                const Text('Terminos y condiciones de uso', style: TextStyle( fontWeight: FontWeight.w200 ),)
              ],
            ),
          ),
        ),
      )
    );
  }
}



class _Form extends StatefulWidget {

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {


  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context); 

    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding:const  EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
         
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textControler: emailCtrl,
          ),

          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textControler: passCtrl,
            isPassword: true,
          ),

          BotonAzul(
            onPressed: authService.autenticando ? null : () async { 

              FocusScope.of(context).unfocus();

              final loginOK = await authService.login( emailCtrl.text.trim() , passCtrl.text);

              if ( loginOK ) {

                //TODO Coenctar a nuestro socket server

                Navigator.pushReplacementNamed(context, 'usuarios' );

              } else {
                // TODO Mostrar alerta
                mostrarAlerta(context, 'Login incorrecto', 'Revisar credenciales');
              }

            },
            text: 'Ingrese',
          )
        ],
      ),
    );
  }
}


















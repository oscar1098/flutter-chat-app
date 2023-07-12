import 'package:flutter/material.dart';

import '../widgets/btn_azul.dart';
import '../widgets/custom_input.dart';
import '../widgets/custom_labels.dart';
import '../widgets/custom_logo.dart';

class RegisterPage  extends StatelessWidget {
  const RegisterPage ({super.key});

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
                  
                const Logo( titulo: 'Registro' ),
                  
                _Form(),
                  
                const Labels( 
                  ruta: 'login',
                  titulo: '¿Ya tienes cuenta?',
                  subtitulo: '¡Ingresa ahora!', 
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


  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding:const  EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
         
         CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            keyboardType: TextInputType.text,
            textControler: nameCtrl,
          ),

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
            onPressed: () { 
              print( emailCtrl.text ); 
              print( passCtrl.text ); 
            },
            text: 'Ingrese',
          )
        ],
      ),
    );
  }
}


















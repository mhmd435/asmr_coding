

import 'dart:ui';

import 'package:asmr_coding/cubit/login_cubit.dart';
import 'package:asmr_coding/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class InstaLoginScreen extends StatelessWidget {
  InstaLoginScreen({super.key});

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
              backgroundColor: const Color.fromARGB(255, 12, 17, 20),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Spacer(),
                    Text("Instagram",style: GoogleFonts.pacifico(textStyle: const TextStyle(fontSize: 40,color: Colors.white))),
                    const SizedBox(height: 40),

                    /// username textField
                    TextField(
                      controller: userController,
                      style: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white,fontSize: 20)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[900],
                        hintText: "phone number,email address",
                        hintStyle: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.grey,fontSize: 18)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ),
                    ),
                    const SizedBox(height: 10),

                    /// password
                    BlocBuilder<LoginCubit, bool>(
                      builder: (context, state) {
                        return TextField(
                          controller: passwordController,
                          obscureText: state,
                          style: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white,fontSize: 20)),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[900],
                              hintText: "password",
                              hintStyle: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.grey,fontSize: 18)),
                              suffixIcon: GestureDetector(
                                  onTap: (){
                                    BlocProvider.of<LoginCubit>(context).changeTextVisibility();
                                  },
                                  child: Icon(state ? Icons.visibility : Icons.visibility_off,color: Colors.white,)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)
                              )
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text("Forgotten Password?",style: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.blue,fontSize: 15)))),


                    const SizedBox(height: 25),
                    /// login btn
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 1, 84, 138),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                            )
                          ),
                          onPressed: (){

                          },
                          child: Text("Log in",style: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white,fontSize: 20)))),
                    ),
                    const SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(child: Divider(thickness: 1,color: Colors.grey,)),
                        Gap(15),
                        Text("OR",style: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.white,fontSize: 13))),

                        Gap(15),
                        Expanded(child: Divider(thickness: 1,color: Colors.grey,)),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Assets.imagesFacebookLogo,width: 30,),
                        Text("Login with Facebook",style: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold))),

                      ],
                    ),

                    Spacer(),

                    Column(
                      children: [
                        const Divider(thickness: 1,color: Colors.grey,),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Dont have an account?",style: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold))),
                            const SizedBox(width: 10),
                            Text("Sign up",style: GoogleFonts.roboto(textStyle: const TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold))),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
        }
      ),
    );
  }
}

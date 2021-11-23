import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_ui/constraints.dart';
import 'package:quiz_ui/screens/QuizScreen.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              child: SvgPicture.asset(
                'assets/icons/bg.svg',
                fit: BoxFit.cover,
                ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Spacer(flex: 2,),
                  Text("Let's Take a Quiz",style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),),
                  Text("Please enter your information"),

                  Spacer(),
                  TextField(
                    decoration:InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1c2341,),
                      hintText: "Full Name ",
                      contentPadding: EdgeInsets.all(20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)
                      )
                    )
                  ),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      // print("hello");
                      Get.to(
                        Quizes(),
                        transition:Transition.rightToLeft,
                        
                        );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(kDefaultPadding*0.75),
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(child: Text("Start Quiz",style: Theme.of(context).textTheme.button!.copyWith(color: Colors.black),)),
                    ),
                  ),
                  Spacer(flex: 2,),
    
                  ],
                ),
              )
              )
          ],
    
        ),
        
      
    );
  }
}
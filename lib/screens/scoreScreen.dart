import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_ui/constraints.dart';
import 'package:quiz_ui/controlllers/questionCOntroller.dart';

class Scores extends StatelessWidget {
  const Scores({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _control=Get.put(QuestionController());
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: SvgPicture.asset("assets/icons/bg.svg",fit: BoxFit.cover,)),

            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 3,),
                  Text("Score",style: Theme.of(context).textTheme.headline3!.copyWith(color: kSecondaryColor),),
                  Spacer(),
                  Text("${_control.numberofCOrrectAnd*10}/${_control.questions.length*10}",
                  style: Theme.of(context).textTheme.headline4!.copyWith(color: kSecondaryColor),
                  ),
                  Spacer(flex: 3,)



                ],
              ),
            )
          ],
        )),
      
    );
  }
}
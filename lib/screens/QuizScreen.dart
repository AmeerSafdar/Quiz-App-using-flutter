import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_ui/constraints.dart';
import 'package:quiz_ui/controlllers/questionCOntroller.dart';
import 'package:quiz_ui/widgets/QuestionAnswerCard.dart';
import 'package:quiz_ui/widgets/progressBar.dart';
class Quizes extends StatefulWidget {
  const Quizes({ Key? key }) : super(key: key);

  @override
  _QuizesState createState() => _QuizesState();
}

class _QuizesState extends State<Quizes> {
  @override
  Widget build(BuildContext context) {
    QuestionController _questionController =Get.put(QuestionController());
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.arrow_back_ios),
          actions: [
            FlatButton(onPressed: (){
              _questionController.nextQuestion();
            }, child: Text("Skip"))
          ],
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              child: SvgPicture.asset("assets/icons/bg.svg",fit: BoxFit.cover,)),
              SafeArea(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProgessBar(),
                    SizedBox(height: kDefaultPadding,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      child: GetBuilder<QuestionController>(
                        init: Get.find<QuestionController>(),
                        builder: (con) {
                          return Text.rich(
                            TextSpan(
                              text: "Question  ${con.questionNumber.value}",
                              style: Theme.of(context).textTheme.headline4!.copyWith(color: kSecondaryColor),
                              children: [
                                TextSpan(
                                  text: '/${con.questions.length}',
                                  style: Theme.of(context).textTheme.headline5!.copyWith(color: kSecondaryColor)
                                )
                              ]
                      
                            )
                          );
                        }
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:kDefaultPadding),
                      child: Divider(thickness: 1.5),
                    ),
                    SizedBox(height: kDefaultPadding,),
                  Expanded(
                    child:PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      onPageChanged: _questionController.updateQnumber,
                      controller: _questionController.pageController,
                      itemCount:_questionController.questions.length,
                      itemBuilder: (context,index)=>QA(
                        question: _questionController.questions[index],
                      )
                      ) 
                      )

                  ],
                ) ,)
          ],
        ),
      ),
    );
  }
}
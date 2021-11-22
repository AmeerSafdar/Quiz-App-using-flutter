import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_ui/constraints.dart';
import 'package:quiz_ui/controlllers/questionCOntroller.dart';
import 'package:quiz_ui/models/QuestionsModel.dart';
import 'package:quiz_ui/widgets/options.dart';
class QA extends StatelessWidget {
  final Question question;
  const QA({ Key? key,required this.question }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questioncont=Get.put(QuestionController());
    return   Container(
                      // padding: EdgeInsets.all(50),
                      margin: EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(23))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: Column(
                          children: [
                            Container(
                                child: Text(
                              question.question,
                              style: Theme.of(context).textTheme.headline6!.copyWith(color: kBlackColor),
                            ),),                      
                            SizedBox(height: kDefaultPadding,),
                            ...List.generate(
                              question.options.length ,
                               (index) => Options(
                                 index: index, 
                                 text: question.options[index], 
                                 onpressed: (){
                                   _questioncont.checkAns(question, index);
                                 }))
                          ],
                        ),
                      ),
                    );
  }
}
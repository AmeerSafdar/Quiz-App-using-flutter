import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_ui/constraints.dart';
import 'package:quiz_ui/controlllers/questionCOntroller.dart';
class ProgessBar extends StatefulWidget {
  const ProgessBar({ Key? key }) : super(key: key);

  @override
  _ProgessBarState createState() => _ProgessBarState();
}

class _ProgessBarState extends State<ProgessBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal:kDefaultPadding),
                      child: Container(
                        width: double.infinity,
                        height: 35,
                        // color: Colors.white,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFF3F4768),width: 3),
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: GetBuilder<QuestionController>(
                          init: QuestionController(),
                          builder: (controller) {
                            // print(controller.animation.value);
                            return Stack(
                              children: [
                                LayoutBuilder(builder: (context,constraints)=>Container(
                                  width:constraints.maxWidth*controller.animation.value,
                                  decoration: BoxDecoration(
                                    gradient: kPrimaryGradient,
                                    borderRadius: BorderRadius.circular(50)
                                    ),
                                )
                                ),
                                Positioned.fill(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:kDefaultPadding/2),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${(controller.animation.value*60).round()} Sec'),
                                        SvgPicture.asset("assets/icons/clock.svg",color:Colors.white)
                                      ],
                                    ),
                                  )
                                  )
                              ],
                            );
                          }
                        ),
                      ),
                    );
  }
}
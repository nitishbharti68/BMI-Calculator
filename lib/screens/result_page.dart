import 'package:bmi_calculator_flutter_mine/constants.dart';
import 'package:bmi_calculator_flutter_mine/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.bmiResult, required this.interpretation, required this.resultText}) : super(key: key);

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text('Your Result', style: kTitleTextStyle),
            ),
          ),
           Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toUpperCase(), style: kResultTextStyle,),
                  Text(bmiResult, style: kBMITextStyle,),
                  Text(interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,)
                ],
              ),
            ),
          ),
          BottomButton(buttonTitle: 'RE-CALCULATE', onTap: (){
            Navigator.pop(context);
          },),
        ],
      ),
    );
  }
}



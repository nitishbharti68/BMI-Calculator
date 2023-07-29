import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_flutter_mine/reusable_card.dart';
import 'package:bmi_calculator_flutter_mine/icon_content.dart';

const bottomContainerHeight = 60.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);

//enum cannot be created inside the class
//type of boolean but with more options
enum Gender {male, female}

class InputPage extends StatefulWidget {
   const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

   late Gender selectedGender;

  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  //1=male, 2=female
  // void updateColor(Gender gender){
  //   if(selectedGender==Gender.male){
  //     if (maleCardColor==inactiveCardColor){
  //       maleCardColor=activeCardColor;
  //       femaleCardColor=inactiveCardColor;
  //     }
  //     else{
  //       maleCardColor=inactiveCardColor;
  //     }
  //   }
  //   if(selectedGender==Gender.female){
  //     if (femaleCardColor==inactiveCardColor){
  //       femaleCardColor=activeCardColor;
  //       maleCardColor=inactiveCardColor;
  //     }
  //     else{
  //       femaleCardColor=inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
           Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedGender==Gender.male;

                        });
                      },
                      child: ReusableCard(
                  colour:
                  selectedGender = Gender.male ? activeCardColor : inactiveCardColor,

                  cardChild: iconContent(icon: FontAwesomeIcons.mars, label: 'Male',),
                ),
                    )),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {

                        selectedGender=Gender.female;
                      });
                    },
                    child: ReusableCard(
                      colour:
                        selectedGender = (Gender.female ? activeCardColor : inactiveCardColor),
                      cardChild: iconContent(icon: FontAwesomeIcons.venus, label: 'Female',)
                    ),
                  ),
                ),
              ],
            ),
          ),
           const Expanded(
            child: ReusableCard(
              colour: activeCardColor,
            ),
          ),
           const Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: const Color(0xFFEB1555),
            margin: const EdgeInsets.only(top: 10.0),
            height: bottomContainerHeight,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}




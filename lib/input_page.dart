import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_flutter_mine/reusable_card.dart';
import 'package:bmi_calculator_flutter_mine/icon_content.dart';
import 'constants.dart';

//enum cannot be created inside the class
//type of boolean but with more options
enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 120;
  int weight = 30;

  //Gender selectedGender;

  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  //1=male, 2=female
  void updateColor(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      //male card pressed
      if (maleCardColor == kInactiveCardColor) {
        maleCardColor = kActiveCardColor;
        femaleCardColor = kInactiveCardColor;
      } else {
        maleCardColor = kInactiveCardColor;
      }
    }
    if (selectedGender == Gender.female) {
      //female card pressed
      if (femaleCardColor == kInactiveCardColor) {
        femaleCardColor = kActiveCardColor;
        maleCardColor = kInactiveCardColor;
      } else {
        femaleCardColor = kInactiveCardColor;
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      //selectedGender==Gender.male;
                      updateColor(Gender.male);
                    });
                  },
                  child: ReusableCard(
                    colour: maleCardColor,
                    //selectedGender = Gender.male ? activeCardColor : inactiveCardColor,

                    cardChild: iconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                )),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.female);
                        //selectedGender=Gender.female;
                      });
                    },
                    child: ReusableCard(
                        colour: femaleCardColor,
                        //selectedGender = (Gender.female ? activeCardColor : inactiveCardColor),
                        cardChild: iconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'Female',
                        )),
                  ),
                ),
              ],
            ),
          ),
           Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: const Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0)
                    ),
                    child: Slider(value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                      setState(() {
                        height = newValue.toInt();
                      });
                    }),
                  )

                ],
              ),
            ),
          ),
           Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,

                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Weight', style: kLabelTextStyle,),
                        Text(weight.toString(), style: kNumberTextStyle),
                         Expanded(
                           child: Row(
                             crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),

                              SizedBox(width: 10.0,),
                              RoundIconButton(icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                setState(() {
                                  weight++;
                                });
                                },
                              ),
                            ],
                        ),
                         ),
                      ],
                    )
                  ),
                ),
                const Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: const Color(0xFFEB1555),
            margin: const EdgeInsets.only(top: 10.0),
            height: kBottomContainerHeight,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, this.icon, this.onPressed}) : super(key: key);

  final IconData? icon;
  final Function? onPressed;


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
    elevation: 6.0,
    constraints: const BoxConstraints.tightFor(width: 30.0, height: 30.0),
    shape: const CircleBorder(),
    fillColor: const Color(0xFF4C4F5E),
      onPressed: onPressed!(),
      child: Icon(icon),);
  }
}


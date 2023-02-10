import 'package:flutter/material.dart';
import 'package:neonpen/neonpen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}
class MyAppState extends State<MyApp> {
  double _numberForm =0;
  @override
  void initState()
  {_numberForm=0;
  super.initState();
  }
  final List<String> items = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];
  double conversion=0.0;
  //point ? represente le valeur non null
  String? selectedValue;
  String? selectedValue2;
double conversionOperation(String? value1,String? value2,double input)
{
  if(('meters'==value1) && ('kilometers'==value2))
    {
      conversion =input/1000;
      print(conversion);
    }
    else
      {
        conversion =input*1000;
      }
  setState(() {
    conversion=conversion;
  });
    return conversion;

}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Measures Converter',
        home: Scaffold(
        appBar: AppBar(
        title: Text('Measures Converter'),
    ),
    body: Center(
    child: Column(
      children: [
        Neonpen(
          text: Text(
            'Hello World!',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          color: Colors.blue,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          opacity: 0.3,
          emphasisWidth: 15,
          emphasisOpacity: 0.3,
          emphasisAngleDegree: 2,
          enableLineZiggle: true,
          lineZiggleLevel: 1,
          isDoubleLayer: false,
        ),
        SizedBox(height: 30),
        Text(
          'Value',
          style: TextStyle(
            fontSize: 25,
            decorationColor: Colors.greenAccent ,
          ),

        ),
        TextField(
          onChanged: (text){
            var rx = double.tryParse(text);
            if(rx!=null){
              setState(() {
                _numberForm=rx;
              });
            }
          },
        ),
      Text((_numberForm==null)?'': _numberForm.toString()),
        Text(
          'From',
          style: TextStyle(
              fontSize: 25,
              decorationColor: Colors.greenAccent,
          ),

        ),
        /*TextField(
          onChanged: (text){
            var rx = double.tryParse(text);
            if(rx!=null){
              setState(() {
                _numberForm=rx;
              });
            }
          },
        ),*/
        ////////////////////////////////::
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            hint: Text(
              'Select Item',
              style: TextStyle(
                fontSize: 14,
                color: Theme
                    .of(context)
                    .hintColor,
              ),
            ),
            items: items
                .map((item) =>
                DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            },
            buttonHeight: 40,
            buttonWidth: 140,
            itemHeight: 40,
          ),
        ),
        ////////////////////////////

        Text(
          'TO',
          style: TextStyle(
              fontSize: 25,
              decorationColor: Colors.greenAccent,
          ),

        ),
        /////////////////////////////
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            hint: Text(
              'Select Item',
              style: TextStyle(
                fontSize: 14,
                color: Theme
                    .of(context)
                    .hintColor,
              ),
            ),
            items: items
                .map((item) =>
                DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
                .toList(),
            value: selectedValue2,
            onChanged: (value) {
              setState(() {
                selectedValue2 = value as String;
              });
            },
            buttonHeight: 40,
            buttonWidth: 140,
            itemHeight: 40,
          ),
        ), ////////////////////////////
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey),
                ),

            onPressed: () {
              conversionOperation(selectedValue, selectedValue2, _numberForm);

              },
            child: Text('Conversion')
        )  ,
        SizedBox(height: 30),
        Card(
          child : Text ("$_numberForm  $selectedValue are "+conversion.toString() +" $selectedValue2")
        ),
      ],
    ),
    ),
        ),
    );
  }
}

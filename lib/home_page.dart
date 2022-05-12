import 'dart:math';

import 'package:bmi_calculator/height_provider.dart';
import 'package:bmi_calculator/weight_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weightProvider = Provider.of<WeightProvider>(context);
    var heightProvider = Provider.of<HeightProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Weight (kg)',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            // NOTE: MENGGUNAKAN CONSUMER
            // Consumer<WeightProvider>(
            //   builder: (context, weightProvider, _) => Slider(
            //     min: 1,
            //     max: 100,
            //     value: weightProvider.weight, 
            //     label: weightProvider.weight.round().toString(),
            //     onChanged: (newValue){
            //       weightProvider.weight = newValue;
            //       print('weight: $newValue');
            //     },
            //   ),
            // ),
            Slider(
              min: 1,
              max: 100,
              value: weightProvider.weight, 
              label: weightProvider.weight.round().toString(),
              onChanged: (newValue){
                weightProvider.weight = newValue;
                print('weight: $newValue');
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Height (cm)',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            // NOTE: MENGGUNAKAN CONSUMER
            // Consumer<HeightProvider>(
            //   builder: (context, heightProvider, _) => Slider(
            //     min: 1,
            //     max: 200,
            //     divisions: 200,
            //     label: heightProvider.height.round().toString(),
            //     value: heightProvider.height, 
            //     activeColor: Colors.pink,
            //     inactiveColor: Colors.pink.withOpacity(.2),
            //     onChanged: (newValue){
            //       heightProvider.height = newValue;
            //       print('height: $newValue');
            //     },
            //   ),
            // ),
            Slider(
              min: 1,
              max: 200,
              divisions: 200,
              label: heightProvider.height.round().toString(),
              value: heightProvider.height, 
              activeColor: Colors.pink,
              inactiveColor: Colors.pink.withOpacity(.2),
              onChanged: (newValue){
                heightProvider.height = newValue;
                print('height: $newValue');
              },
            ),
            SizedBox(
              height: 20,
            ),
            // NOTE: MENGGUNAKAN CONSUMER
            // Consumer2<WeightProvider, HeightProvider>(
            //   builder: (context, weightProvider, heightProvider, _) => Text(
            //     'Your BMI:\n${(weightProvider.weight / pow(heightProvider.height/100, 2)).toStringAsFixed(2)}',
            //     style: TextStyle(
            //       fontSize: 20,
            //       fontWeight: FontWeight.w500,
            //     ),
            //     textAlign: TextAlign.center,
            //     ),
            // ),
            Text(
              'Your BMI:\n${(weightProvider.weight / pow(heightProvider.height/100, 2)).toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
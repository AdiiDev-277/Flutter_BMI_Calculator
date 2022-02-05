

import 'dart:math';

class CalculaterBrain {
  var _bmi;

CalculaterBrain({required this.weight,required this.height,});

  final int height;
  final int weight;



  String calculateMBI() {
   _bmi = weight / pow(height/100, 2);
     return _bmi.toStringAsFixed(1);
}

 String getResult(){
   if(_bmi >= 25){
     return 'Overweight';
  }else if( _bmi > 18.5){
    return 'Normal';
   } else {
     return'Underweight';
   }
 }
  String getDis(){
    if(_bmi >= 25){
      return 'You have a higher then normal weight';
    }else if(_bmi > 18.5){
      return 'You have a  normal body weight';
    } else {
      return'You have a lower then normal weight';
    }

  }


}
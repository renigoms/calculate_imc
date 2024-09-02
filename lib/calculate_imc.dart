import 'dart:io';
import 'dart:math';

import 'MessageEnum.dart';
import 'Person.dart';

double _calculateImc(double weight, double height) => weight / pow(height, 2);

String returnMessage(Person person) {
  late MessageEnum message;
  double imc = _calculateImc(person.weight, person.height);
  if (imc < 16) {
    message = MessageEnum.SERVERE_THINNESS;
  } else if (imc >= 16 && imc < 17)
    message = MessageEnum.MODERATE_THINNESS;
  else if (imc >= 17 && imc < 18.5)
    message = MessageEnum.LIGTH_THINNESS;
  else if (imc >= 18.5 && imc < 25)
    message = MessageEnum.HEALTHY;
  else if (imc >= 25 && imc < 30)
    message = MessageEnum.OVERWEIGHT;
  else if (imc >= 30 && imc < 35)
    message = MessageEnum.OBESITY_GRADE_1;
  else if (imc >= 35 && imc < 40)
    message = MessageEnum.OBESITY_GRADE_2;
  else if (imc >= 40) message = MessageEnum.OBESITY_GRADE_3;
  return message.value;
}

void view() {
  print("Enter your name ->");
  String? inputName = stdin.readLineSync();
  print("Enter your current weight ->");
  String? inputWeight = stdin.readLineSync();
  print("Enter your current height ->");
  String? inputHeight = stdin.readLineSync();
  emptyFieldException(inputWeight!, inputHeight!);
  double weight = double.parse(inputWeight), height = double.parse(inputHeight);
  zeroValueException(height);
  print(returnMessage(Person(inputName!, weight, height)));
}

void emptyFieldException(String inputWeight, String inputHeight) {
  if (inputHeight.isEmpty == true || inputWeight.isEmpty == true) {
    throw Exception("exists empty fields");
  }
}

void zeroValueException(double height) {
  if (height == 0) throw Exception("The height value cannot be zero");
}

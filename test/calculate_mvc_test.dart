import 'package:calculate_imc/MessageEnum.dart';
import 'package:calculate_imc/Person.dart';
import 'package:calculate_imc/calculate_imc.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group("group test", () {
    Map valuesToTest = {
      {"name": "Renan", "weight": 79, "height": 1.77}:
          MessageEnum.OVERWEIGHT.value,
      {"name": "Renan", "weight": 46, "height": 1.77}:
          MessageEnum.SERVERE_THINNESS.value,
      {"name": "Renan", "weight": 51, "height": 1.77}:
          MessageEnum.MODERATE_THINNESS.value,
      {"name": "Renan", "weight": 56, "height": 1.77}:
          MessageEnum.LIGTH_THINNESS.value,
      {"name": "Renan", "weight": 62, "height": 1.77}:
          MessageEnum.HEALTHY.value,
      {"name": "Renan", "weight": 103, "height": 1.77}:
          MessageEnum.OBESITY_GRADE_1.value,
      {"name": "Renan", "weight": 112, "height": 1.77}:
          MessageEnum.OBESITY_GRADE_2.value,
      {"name": "Renan", "weight": 140, "height": 1.77}:
          MessageEnum.OBESITY_GRADE_3.value
    };

    valuesToTest.forEach((value, expected) {
      test("calculate imc test", () {
        expect(
            returnMessage(Person(
                value["name"].toString(),
                double.parse(value["weight"].toString()),
                double.parse(value["height"].toString()))),
            expected.toString());
      });
    });
  });

  group("exceptions test", () {
    test("emptyFieldExceptionTest", () {
      try {
        expect(() => emptyFieldException("", ""),
            throwsA(TypeMatcher<Exception>()));
      } on Exception catch (e) {
        expect(e.toString(), "exists empty fields");
      }
    });

    test("zeroValueException", () {
      try {
        expect(() => zeroValueException(0), throwsA(TypeMatcher<Exception>()));
      } on Exception catch (e) {
        expect(e.toString(), "The height value cannot be zero");
      }
    });
  });
}

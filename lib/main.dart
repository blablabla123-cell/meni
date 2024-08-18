import 'package:meni/logger.dart';

void main() {

  final Logger logger = Logger();

  logger.log(calculate('5').toString());
  
}

int calculate<T>(T number) {

  int value = 0;

  if(number is String) {
    value = int.tryParse(number as String) ?? 0;
    // Convert String to Int
  }

  if(number is double) {
    // Convert double to Int
    value = number.toInt();
  }

  return value * value;
}

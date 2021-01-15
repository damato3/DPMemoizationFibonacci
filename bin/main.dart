import 'dart:ffi';

/// Demo of the Memoization Dynamic programming technique in the
/// fibonacci series.
///
/// Double numbers is faster but the maximun fibonacci i'm able to calculate
/// in my laptop is 1476
/// BigInt gives me a max fibonnaci of 16327
///
/// Author: Daniel Martinez Torres
///
/// Date: 01/14/2021 22:58

/// Creates a dictionary of BigInts to save the calculated values of fibonacci
final Map<BigInt, BigInt> fibDixtionary = {};

/// Program start
void main(List<String> arguments) {
  print('Testing Dynamic programming on fibonacci');
  final startTime = DateTime.now();

  print('Start time: ${startTime.toString()}');

  /// Get the value of "n" from the input
  final n = BigInt.parse(arguments.first);
  print('Fibonacci of ${arguments.first} is: ${fib(n)}');

  final endTime = DateTime.now();
  print('End time: ${endTime.toString()}');
  print('Total duration: ${endTime.difference(startTime).toString()}');
}

/// Recursive fibonacci function where [number] is the number to calculate
BigInt fib(BigInt number) {
  /// Check if "number" is saved in the dictionary and return its value
  if (fibDixtionary.containsKey(number)) {
    return fibDixtionary[number];
  }

  BigInt calc = number;

  /// If "number" is less or equals to 2, then return itself
  if (number > BigInt.from(1)) {
    /// Recursively calculate f(n -1) + f(n - 2)
    calc = fib(number - BigInt.from(1)) + fib(number - BigInt.from(2));
  }

  /// Then save the calculated value in the dictionary using "number" as the key
  fibDixtionary[number] = calc;
  return calc;
}

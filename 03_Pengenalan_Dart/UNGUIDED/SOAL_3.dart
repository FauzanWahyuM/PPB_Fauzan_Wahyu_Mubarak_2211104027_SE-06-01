import 'dart:io';

void main() {
  print("Masukkan nilai: ");
  int nilai = int.parse(stdin.readLineSync()!);

  bool isPrime(int number) {
    if (number <= 1) return false;
    for (int i = 2; i * i <= number; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  String result = isPrime(nilai)
      ? "$nilai adalah bilangan prima"
      : "$nilai bukan bilangan prima";
  print(result);
}

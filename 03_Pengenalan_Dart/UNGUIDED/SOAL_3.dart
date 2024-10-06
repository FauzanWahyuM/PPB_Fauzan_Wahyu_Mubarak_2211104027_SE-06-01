import 'dart:io';

void main() {
  print("Masukkan nilai: ");
  int nilai = int.parse(stdin.readLineSync()!);

  bool Prima(int angka) {
    if (angka <= 1) return false;
    for (int i = 2; i * i <= angka; i++) {
      if (angka % i == 0) return false;
    }
    return true;
  }

  String result = Prima(nilai)
      ? "$nilai adalah bilangan prima"
      : "$nilai bukan bilangan prima";
  print(result);
}

import 'dart:io';

void main() {
  print("Masukkan nilai UAS: ");
  int nilai = int.parse(stdin.readLineSync()!);

  String nilaiUAS3(int nilai) {
    return nilai > 70
        ? "$nilai merupakan Nilai A"
        : nilai > 40
            ? "$nilai Merupakan Nilai B"
            : nilai > 0
                ? "$nilai Merupakan Nilai C"
                : "";
  }

  print(nilaiUAS3(nilai));
}

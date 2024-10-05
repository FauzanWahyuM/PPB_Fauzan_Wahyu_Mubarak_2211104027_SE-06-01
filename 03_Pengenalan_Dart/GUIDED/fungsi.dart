String sapa(String nama4) {
  return "Hello, $nama4";
}

void greet(String name5, int age4) {
  print("Hello $name5, you are $age4 years old.");
}

void main() {
  String pesan = sapa("Fauzan");
  print(pesan);

  greet("Wahyu", 23);
}

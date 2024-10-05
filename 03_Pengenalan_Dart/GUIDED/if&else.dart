void main() {
  var openHours = 8;
  var closeHours = 21;
  var now = 10;

  if (now > openHours && now < closeHours) {
    print("Kita Buka Mas!");
  } else {
    print("Kita Tutup Mase!");
  }
}

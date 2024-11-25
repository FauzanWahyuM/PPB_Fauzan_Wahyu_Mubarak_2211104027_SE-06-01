class Mahasiswa {
  final int? id;
  final String nama;
  final String nim;
  final String alamat;
  final String hobi;

  Mahasiswa({
    this.id,
    required this.nama,
    required this.nim,
    required this.alamat,
    required this.hobi,
  })  : assert(nama.isNotEmpty, 'Nama tidak boleh kosong'),
        assert(nim.isNotEmpty, 'NIM tidak boleh kosong'),
        assert(alamat.isNotEmpty, 'Alamat tidak boleh kosong'),
        assert(hobi.isNotEmpty, 'Hobi tidak boleh kosong');

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'nim': nim,
      'alamat': alamat,
      'hobi': hobi,
    };
  }

  static Mahasiswa fromMap(Map<String, dynamic> map) {
    return Mahasiswa(
      id: map['id'],
      nama: map['nama'],
      nim: map['nim'],
      alamat: map['alamat'],
      hobi: map['hobi'],
    );
  }

  @override
  String toString() {
    return 'Mahasiswa{id: $id, nama: $nama, nim: $nim, alamat: $alamat, hobi: $hobi}';
  }

  Mahasiswa copyWith({
    int? id,
    String? nama,
    String? nim,
    String? alamat,
    String? hobi,
  }) {
    return Mahasiswa(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      nim: nim ?? this.nim,
      alamat: alamat ?? this.alamat,
      hobi: hobi ?? this.hobi,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'nim': nim,
      'alamat': alamat,
      'hobi': hobi,
    };
  }

  static Mahasiswa fromJson(Map<String, dynamic> json) {
    return Mahasiswa(
      id: json['id'],
      nama: json['nama'],
      nim: json['nim'],
      alamat: json['alamat'],
      hobi: json['hobi'],
    );
  }
}

import 'package:flutter/material.dart';
import '../helper/db_helper.dart';
import '../models/mahasiswa.dart';

class AddMahasiswaScreen extends StatefulWidget {
  final Mahasiswa? mahasiswa;

  // Parameter opsional untuk menerima data mahasiswa (jika mode edit)
  AddMahasiswaScreen({this.mahasiswa});

  @override
  _AddMahasiswaScreenState createState() => _AddMahasiswaScreenState();
}

class _AddMahasiswaScreenState extends State<AddMahasiswaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _alamatController = TextEditingController();
  final _hobiController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Jika mahasiswa tidak null, ini adalah mode edit, isi data awal
    if (widget.mahasiswa != null) {
      _namaController.text = widget.mahasiswa!.nama;
      _nimController.text = widget.mahasiswa!.nim;
      _alamatController.text = widget.mahasiswa!.alamat;
      _hobiController.text = widget.mahasiswa!.hobi;
    }
  }

  void _saveMahasiswa() async {
    if (_formKey.currentState!.validate()) {
      // Jika mahasiswa ada, update data
      if (widget.mahasiswa != null) {
        final updatedMahasiswa = Mahasiswa(
          id: widget.mahasiswa!.id, // Gunakan ID yang sudah ada
          nama: _namaController.text,
          nim: _nimController.text,
          alamat: _alamatController.text,
          hobi: _hobiController.text,
        );
        await DBHelper().updateMahasiswa(updatedMahasiswa);
      } else {
        // Jika mahasiswa tidak ada, tambahkan data baru
        final newMahasiswa = Mahasiswa(
          nama: _namaController.text,
          nim: _nimController.text,
          alamat: _alamatController.text,
          hobi: _hobiController.text,
        );
        await DBHelper().insertMahasiswa(newMahasiswa);
      }
      Navigator.pop(context, true); // Kembali dengan hasil sukses
    }
  }

  void _deleteMahasiswa() async {
    if (widget.mahasiswa != null) {
      await DBHelper().deleteMahasiswa(widget.mahasiswa!.id!);
      Navigator.pop(context, true); // Kembali dengan hasil sukses
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditMode = widget.mahasiswa != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            isEditMode ? 'Edit Biodata Mahasiswa' : 'Tambah Biodata Mahasiswa'),
        backgroundColor: Colors.orange,
        actions: isEditMode
            ? [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _confirmDelete(),
                ),
              ]
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInputField(
                'Nama',
                _namaController,
                'Nama tidak boleh kosong',
                Icons.person,
              ),
              SizedBox(height: 16),
              _buildInputField(
                'NIM',
                _nimController,
                'NIM tidak boleh kosong',
                Icons.credit_card,
              ),
              SizedBox(height: 16),
              _buildInputField(
                'Alamat',
                _alamatController,
                'Alamat tidak boleh kosong',
                Icons.home,
              ),
              SizedBox(height: 16),
              _buildInputField(
                'Hobi',
                _hobiController,
                'Hobi tidak boleh kosong',
                Icons.star,
              ),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: _saveMahasiswa,
                  child: Text(isEditMode ? 'Simpan Perubahan' : 'Simpan'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
    String label,
    TextEditingController controller,
    String errorMessage,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black),
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMessage;
          }
          return null;
        },
      ),
    );
  }

  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Konfirmasi Hapus'),
          content: Text('Apakah Anda yakin ingin menghapus data ini?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deleteMahasiswa();
              },
              child: Text('Hapus', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}

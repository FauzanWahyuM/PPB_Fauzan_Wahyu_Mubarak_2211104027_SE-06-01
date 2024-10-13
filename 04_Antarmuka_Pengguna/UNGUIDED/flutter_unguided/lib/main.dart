import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata Banyumas',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Rekomendasi Wisata Banyumas",
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.purple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Tempat Wisata 1
              Card(
                child: Column(
                  children: [
                    Image.network(
                      'https://infopurwokerto.com/wp-content/uploads/2021/04/baturraden-910x611.jpg',
                      width: 250,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "Baturraden",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Baturaden adalah surga bagi pencinta alam di Jawa Tengah. Dengan udara sejuk, pemandangan hijau yang menyegarkan, dan beragam air terjun yang memukau, Baturaden menawarkan pengalaman liburan yang tak terlupakan.",
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            child: Text("Kunjungi Tempat"),
                            onPressed: () {},
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Tempat Wisata 2
              Card(
                child: Column(
                  children: [
                    Image.network(
                      'https://gateofjava.wordpress.com/wp-content/uploads/2013/09/a12.jpg',
                      width: 250,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "Curug Cipendok",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Curug Cipendok adalah salah satu air terjun tertinggi di Jawa Tengah. Dengan ketinggian sekitar 92 meter, air terjun ini menawarkan pemandangan yang spektakuler dan udara yang sejuk.",
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            child: Text("Kunjungi Tempat"),
                            onPressed: () {},
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Tempat Wisata 3
              Card(
                child: Column(
                  children: [
                    Image.network(
                      'https://assets.kompasiana.com/items/album/2021/05/29/download-7-60b24cc98ede4810c56044f2.jpg',
                      width: 250,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "Museum Banyumas",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Museum Banyumas adalah salah satu museum yang terletak di Banyumas. Museum ini menawarkan koleksi sejarah dan budaya Banyumas yang kaya dan beragam.",
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            child: Text("Kunjungi Tempat"),
                            onPressed: () {},
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Tempat Wisata 4
              Card(
                child: Column(
                  children: [
                    Image.network(
                      'https://images.solopos.com/2023/08/Pantai-Indah-Widarapayung-Cilacap.jpg',
                      width: 250,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "Pantai Widara Payung",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Pantai Widara Payung adalah salah satu pantai yang terletak di Banyumas. Pantai ini menawarkan pemandangan yang indah dan udara yang sejuk.",
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            child: Text("Kunjungi Tempat"),
                            onPressed: () {},
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Tempat Wisata 5
              Card(
                child: Column(
                  children: [
                    Image.network(
                      'https://assets.kompasiana.com/items/album/2023/06/07/whatsapp-image-2023-06-07-at-13-37-10-6480260f82219975475b7df2.jpeg',
                      width: 250,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "Taman Budaya Banyumas",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Taman Budaya Banyumas adalah salah satu taman yang terletak di Banyumas. Taman ini menawarkan koleksi budaya dan seni yang kaya dan beragam.",
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            child: Text("Kunjungi Tempat"),
                            onPressed: () {},
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Tempat Wisata 6
              Card(
                child: Column(
                  children: [
                    Image.network(
                      'https://kebunrayabaturraden.id/wp-content/uploads/2019/04/maxresdefault-1-1000x500.jpg',
                      width: 250,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "Kebun Raya Banyumas",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Kebun Raya Banyumas adalah salah satu kebun raya yang terletak di Banyumas. Kebun ini menawarkan koleksi tanaman yang kaya dan beragam.",
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            child: Text("Kunjungi Tempat"),
                            onPressed: () {},
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.purple,
              expandedHeight: 200.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Rekomendasi Wisata Banyumas",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                collapseMode: CollapseMode.none,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  // Tempat Wisata 1
                  _buildTouristCard(
                    imageUrl:
                        'https://infopurwokerto.com/wp-content/uploads/2021/04/baturraden-910x611.jpg',
                    title: "Baturraden",
                    description:
                        "Baturaden adalah surga bagi pencinta alam di Jawa Tengah. Dengan udara sejuk, pemandangan hijau yang menyegarkan, dan beragam air terjun yang memukau, Baturaden menawarkan pengalaman liburan yang tak terlupakan.",
                  ),
                  // Tempat Wisata 2
                  _buildTouristCard(
                    imageUrl:
                        'https://gateofjava.wordpress.com/wp-content/uploads/2013/09/a12.jpg',
                    title: "Curug Cipendok",
                    description:
                        "Curug Cipendok adalah salah satu air terjun tertinggi di Jawa Tengah. Dengan ketinggian sekitar 92 meter, air terjun ini menawarkan pemandangan yang spektakuler dan udara yang sejuk.",
                  ),
                  // Tempat Wisata 3
                  _buildTouristCard(
                    imageUrl:
                        'https://assets.kompasiana.com/items/album/2021/05/29/download-7-60b24cc98ede4810c56044f2.jpg',
                    title: "Museum Banyumas",
                    description:
                        "Museum Banyumas adalah salah satu museum yang terletak di Banyumas. Museum ini menawarkan koleksi sejarah dan budaya Banyumas yang kaya dan beragam.",
                  ),
                  // Tempat Wisata 4
                  _buildTouristCard(
                    imageUrl:
                        'https://images.solopos.com/2023/08/Pantai-Indah-Widarapayung-Cilacap.jpg',
                    title: "Pantai Widara Payung",
                    description:
                        "Pantai Widara Payung adalah salah satu pantai yang terletak di Banyumas. Pantai ini menawarkan pemandangan yang indah dan udara yang sejuk.",
                  ),
                  // Tempat Wisata 5
                  _buildTouristCard(
                    imageUrl:
                        'https://assets.kompasiana.com/items/album/2023/06/07/whatsapp-image-2023-06-07-at-13-37-10-6480260f82219975475b7df2.jpeg',
                    title: "Taman Budaya Banyumas",
                    description:
                        "Taman Budaya Banyumas adalah salah satu taman yang terletak di Banyumas. Taman ini menawarkan koleksi budaya dan seni yang kaya dan beragam.",
                  ),
                  // Tempat Wisata 6
                  _buildTouristCard(
                    imageUrl:
                        'https://kebunrayabaturraden.id/wp-content/uploads/2019/04/maxresdefault-1-1000x500.jpg',
                    title: "Kebun Raya Banyumas",
                    description:
                        "Kebun Raya Banyumas adalah salah satu kebun raya yang terletak di Banyumas. Kebun ini menawarkan koleksi tanaman yang kaya dan beragam.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTouristCard({
    required String imageUrl,
    required String title,
    required String description,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  child: Text("Kunjungi Tempat"),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

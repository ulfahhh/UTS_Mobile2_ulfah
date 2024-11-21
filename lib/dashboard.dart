import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  final String nama;
  dashboard({required this.nama});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Membaca yuk ${widget.nama}",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFD1C4E9), // Ungu pastel
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.deepPurple,
          indicatorWeight: 4.0,
          tabs: const [
            Tab(icon: Icon(Icons.emoji_emotions_outlined), text: "Comedy"),
            Tab(icon: Icon(Icons.nightlight_round), text: "Horror"),
            Tab(icon: Icon(Icons.auto_awesome), text: "Fantasy"),
            Tab(icon: Icon(Icons.settings), text: "Settings"),
          ],
        ),
      ),
      body: Container(
        color: const Color(0xFFEDE7F6), // Ungu pastel untuk latar belakang
        child: TabBarView(
          controller: _tabController,
          children: [
            _comedyPage(),
            _horrorPage(),
            _fantasyPage(), // Halaman grid untuk Fantasy
            _settingsPage(),
          ],
        ),
      ),
    );
  }

  // Halaman Comedy dengan grid
  Widget _comedyPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        padding: const EdgeInsets.only(top: 16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.5,
        ),
        itemCount: 2,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigasi ke halaman detail cerita Comedy
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoryPage(
                      title: "Anak SD Mau ke Surga",
                      story:
                          "Suatu ketika, sejumlah murid salah satu kelas di SD "
                          "sedang menjalani pelajaran agama. Dengan penuh semangat, "
                          "seorang guru bernama Udin sedang memberikan pelajaran yang "
                          "membahas mengenai surga. Usai memberikan penjelasan mengenai surga, "
                          "sang guru lantas memberikan pertanyaan kepada seluruh muridnya. "
                          "Berikut percakapannya:\n\n"
                          "\"anak-anak, siapa yang mau masuk surga?\" tanya Udin.\n"
                          "\"Saya pak, saya,\" teriak seluruh murid.\n\n"
                          "Dari seluruh anak yang mengajukan diri, rupanya ada satu murid bernama Ucok "
                          "tidak ikut berteriak. Hal itu membuat sang guru kembali bertanya.\n\n"
                          "\"Yang mau masuk surga tunjukkan tangannya,\" tanya Udin lagi.\n"
                          "\"Sayaa,\" teriak para murid berlomba-lomba mengangkat tangannya.\n\n"
                          "Lagi-lagi, Ucok tetap diam tak bergeming. Demi memacu semangat muridnya, "
                          "dia pun kembali bertanya.\n\n"
                          "\"Yang mau masuk surga ayo berdiri.\"\n\n"
                          "Mendengar itu, seluruh murid berdiri, kecuali Ucok yang tetap diam dan malah "
                          "disibukkan dengan bukunya sendiri.\n\n"
                          "Merasa ada murid yang tak bersemangat, Udin pun menghampiri Ucok dan bertanya, "
                          "\"Cok, kamu mau masuk surga enggak?\"\n\n"
                          "\"Mau dong pak!\" jawab Ucok.\n\n"
                          "\"Terus kenapa kamu enggak berdiri?\" lanjut Udin penasaran.\n\n"
                          "\"Lha, memangnya mau berangkat sekarang pak?\"",
                    ),
                  ),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoryPage(
                      title: "Kisah Brewok Bapak",
                      story:
                          "Selama beberapa tahun terakhir ini Pak Iwan membiarkan wajahnya ditumbuhi janggut, "
                          "kumis dan cambang yang lebat. Pada suatu hari, semua itu dicukurnya habis.\n\n"
                          "Sepulangnya dari tukang pangkas, dia melihat puteranya sedang bermain di depan rumah. "
                          "Dia ingin tahu, apakah putranya masih mengenalnya dalam keadaan klimis seperti itu. "
                          "Karena itu, dia bertanya pada putranya, di mana rumah Pak Iwan.\n\n"
                          "Dengan ketakutan, anaknya berlari masuk ke dalam rumah, \"Bu, Bapak telah mencukur brewoknya, "
                          "dan kini jadi lupa di mana rumah kita!\"",
                    ),
                  ),
                );
              }
            },
            child: Card(
              color: Colors.deepPurple[100],
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  index == 0 ? "Anak SD Mau ke Surga" : "Kisah Brewok Bapak",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Halaman Horror dengan grid
  Widget _horrorPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.5,
        ),
        itemCount: 2,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoryPage(
                      title: "HANTU KOSAN",
                      story:
                          "Sudah dua minggu aku berada di kosan ini, yang katanya selalu ada kejadian aneh di sini. Namun, setelah dua minggu berlalu aku merasa tak ada yang aneh aku enjoy-enjoy aja dengan kosan ini.\n\n"
                          "Yang aku herankan setiap aku mandi aku selalu diawasi oleh dua pasang mata yang ngintip di balik jendela wc. Aku pikir itu cuma lelaki mesum di kamar sebelahku. Dan, suatu ketika aku penasaran.\n\n"
                          "Aku memasang kamera dan dipasang di kamar mandi. Aku mulai mandi. Betapa terkejutnya aku ternyata yang mengintip aku selama ini bukan manusia mesum melainkan makhluk halus yang tanpa tubuh. Ia hanya kepala dan organ tubuh yang berjalan.\n\n"
                          "Aku mulai gemetar dan hp ku jatuh. Setelah mengambil hp ternyata mahluk itu telah ada di depanku. Dan, aku pun pingsan.",
                    ),
                  ),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoryPage(
                      title: "TAWA MISTERIUS DARI JENDEL ATAS",
                      story:
                          "Seiring matahari terbenam dan rumah neneknya tertutup dalam ketenangan malam, seorang remaja bernama Alex menemukan dirinya menginap di tempat itu.\n\n"
                          "Rumah yang dulu penuh dengan tawa dan cerita, kini hanya dihuni oleh neneknya yang kesepian.\n\n"
                          "Suatu malam, ketika bulan bersinar terang, Alex terbangun oleh suara tawa aneh yang terdengar begitu jelas dari jendela atas. Pikiran Alex bergejolak dalam kebingungan. Ia tahu betul bahwa neneknya tinggal seorang diri di rumah ini.\n\n"
                          "Apakah ada kemungkinan bahwa neneknya yang selama ini tampak damai menjadi terlibat dalam permainan aneh ini? Ataukah ada sesuatu yang lebih gelap dan tak terjelaskan yang sedang bermain di balik tirai malam?\n\n"
                          "Penuh rasa ingin tahu, Alex memutuskan untuk mengejar misteri tawa tersebut.",
                    ),
                  ),
                );
              }
            },
            child: Card(
              color: Colors.deepPurple[100],
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  index == 0
                      ? "HANTU KOSAN"
                      : "TAWA MISTERIUS DARI JENDEL ATAS",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Halaman Fantasy dengan grid
  Widget _fantasyPage() {
    final List<Map<String, String>> fantasyStories = [
      {
        "title": "Kerajaan Awan",
        "story": "Di atas awan yang membentang...",
      },
      {
        "title": "Prajurit Naga",
        "story": "Legenda mengatakan...",
      },
      {
        "title": "Kunci Dimensi",
        "story": "Di sebuah gua yang tersembunyi...",
      },
      {
        "title": "Pohon Ajaib",
        "story": "Di tengah hutan yang lebat...",
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.5,
        ),
        itemCount: fantasyStories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryPage(
                    title: fantasyStories[index]["title"]!,
                    story: fantasyStories[index]["story"]!,
                  ),
                ),
              );
            },
            child: Card(
              color: Colors.deepPurple[100],
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  fantasyStories[index]["title"]!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Halaman Settings dengan tombol Logout
  Widget _settingsPage() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Aksi logout
          Navigator.of(context).pop(); // Kembali ke halaman login
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Logout',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}

class StoryPage extends StatelessWidget {
  final String title;
  final String story;
  StoryPage({required this.title, required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(story, style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}

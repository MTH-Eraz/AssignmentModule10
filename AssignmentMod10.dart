import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home : AssignmentMod10(),

    );
  }
}




class AssignmentMod10 extends StatelessWidget {
  const AssignmentMod10 ({super.key});

  final List<String> imageUrls = const [
    'https://cdn.ostad.app/course/cover/2024-12-17T11-35-19.890Z-Course%20Thumbnail%2012.jpg',
    'https://cdn.ostad.app/course/cover/2024-12-19T15-48-52.487Z-Full-Stack-Web-Development-with-Python,-Django-&-React.jpg',
    'https://cdn.ostad.app/course/cover/2024-12-18T15-29-34.261Z-Untitled-1%20(23).jpg',
    'https://cdn.ostad.app/course/cover/2024-12-18T15-24-44.114Z-Untitled-1%20(21).jpg',
  ];

  final List<String> courseTitles = const [
    "Full Stack Web Development with JavaScript (MERN)",
    "Full Stack Web Development with Python, Django & React",
    "Full Stack Web Development with ASP.Net Core",
    "SQA: Manual & Automated Testing",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment Module 10"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cards per row
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.65,
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return CourseCard(
              imageUrl: imageUrls[index],
              title: courseTitles[index],
            );
          },
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const CourseCard({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 8,
            offset: Offset(4, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TagBox(label: 'ব্যাচ ৮'),
                TagBox(icon: Icons.people, label: '৮ সিট বাকি'),
                TagBox(icon: Icons.timelapse, label: '৬ দিন বাকি'),
              ],
            ),
          ),
          const Divider(color: Colors.black26, thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 6),
          Center(
            child: Container(
              width: 120,
              height: 28,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(6)),
              child: const Center(
                  child: Text(
                    'বিস্তারিত দেখুন →',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class TagBox extends StatelessWidget {
  final String label;
  final IconData? icon;

  const TagBox({super.key, required this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          if (icon != null) Icon(icon, size: 10),
          if (icon != null) const SizedBox(width: 2),
          Text(label,
              style: const TextStyle(fontSize: 6, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

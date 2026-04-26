import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubAHomeUi extends StatefulWidget {
  const SubAHomeUi({super.key});

  @override
  State<SubAHomeUi> createState() => _SubAHomeUiState();
}

class _SubAHomeUiState extends State<SubAHomeUi> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  List hotlines = [
    {
      'name': 'กรมทางหลวงชนบท',
      'number': '1146',
    },
    {
      'name': 'ตำรวจท่องเที่ยว',
      'number': '1155',
    },
    {
      'name': 'ตำรวจทางหลวง',
      'number': '1193',
    },
    {
      'name': 'ข้อมูลการจราจร',
      'number': '1197',
    },
    {
      'name': 'ขสมก.',
      'number': '1348',
    },
    {
      'name': 'บขส.',
      'number': '1490',
    },
    {
      'name': 'เส้นทางบนทางด่วน',
      'number': '1543',
    },
    {
      'name': 'กรมทางหลวง',
      'number': '1586',
    },
    {
      'name': 'การรถไฟแห่งประเทศไทย',
      'number': '1690',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: 32,
            left: 16,
            right: 16,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 16,
                ),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'สายด่วน\nการเดินทาง',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/images/sub_a.jpg',
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: hotlines.length,
                  separatorBuilder: (context, index) => Divider(
                    color: const Color.fromARGB(255, 51, 192, 27),
                  ),
                  itemBuilder: (context, index) => ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/images/${hotlines[index]["number"]}.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                    ),
                    title: Text(
                      hotlines[index]['name'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      hotlines[index]['number'],
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 31, 207, 61),
                      ),
                    ),
                    trailing: Icon(
                      Icons.call,
                      color: const Color.fromARGB(255, 58, 195, 33),
                      size: 32,
                    ),
                    onTap: () {
                      _makePhoneCall(hotlines[index]['number']);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
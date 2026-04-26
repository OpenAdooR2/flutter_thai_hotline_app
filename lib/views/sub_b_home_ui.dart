import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubBHomeUi extends StatefulWidget {
  const SubBHomeUi({super.key});

  @override
  State<SubBHomeUi> createState() => _SubBHomeUiState();
}

class _SubBHomeUiState extends State<SubBHomeUi> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  List hotlines = [
    {
      'name': 'เหตด่วน เหตุร้าย',
      'number': '191',
    },
    {
      'name': 'แจ้งไฟไหม้ สัตว์เข้าบ้าน',
      'number': '199',
    },
    {
      'name': 'สายด่วนรถหาย (ตำรวจแห่งชาติ)',
      'number': '1192',
    },
    {
      'name': 'อุบัติเหตุทางน้ำ',
      'number': '1196',
    },
    {
      'name': 'แจ้งคนหาย',
      'number': '1300',
    },
    {
      'name': 'ศูนย์ปลอดภัยคมนาคม',
      'number': '1356',
    },
    {
      'name': 'หน่วยแพทย์กู้ชีพ',
      'number': '1554',
    },
    {
      'name': 'ศูนย์เอราวัณ',
      'number': '1646',
    },
    {
      'name': 'เจ็บป่วยฉุกเฉิน',
      'number': '1669',
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
                        'สายด่วน\nอุบัติเหตุ-เหตุฉุกเฉิน',
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
                          'assets/images/sub_b.jpg',
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
                    color: const Color.fromARGB(255, 37, 145, 164),
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
                        color: const Color.fromARGB(255, 27, 157, 31),
                      ),
                    ),
                    trailing: Icon(
                      Icons.call,
                      color: const Color.fromARGB(255, 30, 209, 51),
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
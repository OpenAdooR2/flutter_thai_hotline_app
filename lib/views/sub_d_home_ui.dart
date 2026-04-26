import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubDHomeUi extends StatefulWidget {
  const SubDHomeUi({super.key});

  @override
  State<SubDHomeUi> createState() => _SubDHomeUiState();
}

class _SubDHomeUiState extends State<SubDHomeUi> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  List hotlines = [
    {
      'name': 'ไฟฟ้านครหลวง',
      'number': '1130',
    },
    {
      'name': 'ไฟฟ้าส่วนภูมิภาค',
      'number': '1129',
    },
    {
      'name': 'ไฟฟ้าฝ่ายผลิต',
      'number': '1416',
    },
    {
      'name': 'การประปานครหลวง',
      'number': '1125',
    },
    {
      'name': 'การประปาส่วนภูมิภาค',
      'number': '1662',
    },
    {
      'name': 'true',
      'number': '1242',
    },
    {
      'name': 'dtac',
      'number': '1678',
    },
    {
      'name': 'AIS',
      'number': '1175',
    },
    {
      'name': 'TOT',
      'number': '1100',
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
                        'สายด่วน\nสาธารณูปโภค',
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
                          'assets/images/sub_d.jpg',
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
                    color: const Color.fromARGB(255, 28, 191, 71),
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
                        color: const Color.fromARGB(255, 33, 188, 28),
                      ),
                    ),
                    trailing: Icon(
                      Icons.call,
                      color: const Color.fromARGB(255, 26, 192, 51),
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
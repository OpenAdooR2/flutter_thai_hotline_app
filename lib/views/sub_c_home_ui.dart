import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubCHomeUi extends StatefulWidget {
  const SubCHomeUi({super.key});

  @override
  State<SubCHomeUi> createState() => _SubCHomeUiState();
}

class _SubCHomeUiState extends State<SubCHomeUi> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  List hotlines = [
    {
      'name': 'ธนาคารกรุงเทพ',
      'number': '1333',
    },
    {
      'name': 'ธนาคารออมสิน',
      'number': '1115',
    },
    {
      'name': 'ธนาคารกสิกรไทย',
      'number': '02 888 8888',
    },
    {
      'name': 'ธนาคารไทยกรุงไทย',
      'number': '02 111 1111',
    },
    {
      'name': 'ธนาคารกรุงศรี',
      'number': '1572',
    },
    {
      'name': 'ทีเอ็มบีธนชาต',
      'number': '1428',
    },
    {
      'name': 'citibank',
      'number': '1588',
    },
    {
      'name': 'LH Bank',
      'number': '1327',
    },
    {
      'name': 'ธอส.',
      'number': '02 645 9000',
    },
    {
      'name': 'ธนาคารไทยพาณิชย์',
      'number': '02 777 7777',
    },
    {
      'name': 'KIATNAKIN PHATRA',
      'number': '02 165 5555',
    },
    {
      'name': 'ธนาคารไทยเครดิตเพื่อรายย่อย',
      'number': '02 697 5454',
    },
    {
      'name': 'UOB',
      'number': '02 285 1555',
    },
    {
      'name': 'TISCO',
      'number': '02 633 6000',
    },
    {
      'name': 'ธนาคารอิสลามแห่งประเทศไทย',
      'number': '02 204 2766',
    },
    {
      'name': 'CIMB Thai',
      'number': '02 626 7777',
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
                        'สายด่วน\nธนาคาร',
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
                          'assets/images/sub_c.jpg',
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
                    color: const Color.fromARGB(255, 52, 197, 170),
                  ),
                  itemBuilder: (context, index) => ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/images/${hotlines[index]["number"].toString().replaceAll(" ", "")}.png',
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
                        color: const Color.fromARGB(255, 64, 154, 70),
                      ),
                    ),
                    trailing: Icon(
                      Icons.call,
                      color: const Color.fromARGB(255, 48, 195, 11),
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
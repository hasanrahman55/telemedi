import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class BlogScreen extends StatefulWidget {
  static const routeName = 'blogScreen';
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  List link = [
    'https://www.telemedicine.click/%e0%a6%8b%e0%a6%a4%e0%a7%81%e0%a6%b8%e0%a7%8d%e0%a6%b0%e0%a6%be%e0%a6%ac-%e0%a6%ac%e0%a6%be-%e0%a6%b0%e0%a6%9c%e0%a6%83%e0%a6%b8%e0%a7%8d%e0%a6%b0%e0%a6%be%e0%a6%ac-menstruation/',
    'https://www.telemedicine.click/%e0%a6%97%e0%a6%b0%e0%a7%8d%e0%a6%ad%e0%a6%b8%e0%a7%8d%e0%a6%b0%e0%a6%be%e0%a6%ac-miscarriage/',
    'https://www.telemedicine.click/massa-vitae-toutor-condimentum-lacinia-quis/',
    'https://www.telemedicine.click/venenatis-urna-cursus-eget-nunc-scelerisque/',
    'https://www.telemedicine.click/donec-adipiscing-tristique-risus-nec-feugiat/',
  ];
  List title = [
    'ঋতুস্রাব বা রজঃস্রাব (Menstruation)',
    'গর্ভস্রাব (Miscarriage)',
    'টেলিমেডিসিন কী?',
    'গর্ভাবস্থা এবং করোনাভাইরাস',
    'কার্ডিও-পালমোনারি রিসাসিটেশন (সিপিআর)'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Container(
            child: ListView.builder(
                itemCount: link.length,
                itemBuilder: (context, index) {
                  return Link(
                      target: LinkTarget.self,
                      uri: Uri.parse(link[index]),
                      builder: (context, followLink) {
                        return ListTile(
                          onTap: followLink,
                          leading: FlutterLogo(size: 56.0),
                          title: Text(title[index]),
                          subtitle: Text('Here is a second line'),
                        );
                      });
                })));
  }
}

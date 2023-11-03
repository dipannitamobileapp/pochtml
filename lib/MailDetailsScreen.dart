import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MailDetailsScreen extends StatefulWidget {

  final int indexMail;
  final String headingMail;
  final String hintMail;

  const MailDetailsScreen({super.key, required this.indexMail,required this.hintMail, required this.headingMail});

  @override
  State<MailDetailsScreen> createState() => _MailDetailsScreenState();
}

class _MailDetailsScreenState extends State<MailDetailsScreen> {
  List<String> emailWebLink = [];

  WebViewController? _controller;


  @override
  void initState() {

    emailWebLink.add('assets/mailbody1.html');
    emailWebLink.add('assets/mailbody2.html');
    emailWebLink.add('assets/mailbody3.html');

    emailWebLink.add('assets/mailbody3.html');
    emailWebLink.add('assets/mailbody2.html');
    emailWebLink.add('assets/mailbody1.html');

    emailWebLink.add('assets/mailbody3.html');
    emailWebLink.add('assets/mailbody2.html');
    emailWebLink.add('assets/mailbody1.html');

    emailWebLink.add('assets/mailbody1.html');
    emailWebLink.add('assets/mailbody3.html');
    emailWebLink.add('assets/mailbody2.html');
    Future<void> _launched;
    _controller = WebViewController();
    setState(() {
      _controller!.loadFlutterAsset(emailWebLink[widget.indexMail]);

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: CustomScrollView(
          slivers: <Widget>[
      SliverAppBar(
        toolbarHeight: 95,
      title:  Center(
        child: Container(
          child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
          Text(widget.headingMail),
            Text(widget.hintMail),
                GestureDetector(
                  onTap: (){
                  _launchInBrowser("https://www.africau.edu/images/default/sample.pdf");

                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.withOpacity(0.1),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.paperclip,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Attachment Download',
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ],
                    ),
                  ),
                ),

          ])),
      ),


      floating: true,
    ),
    SliverFillRemaining(
        child: WebViewWidget(

            controller: _controller!),
      ),
    ]));

  }
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}

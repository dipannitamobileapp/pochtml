import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'MailDetailsScreen.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  ScrollController scrollViewController = ScrollController();
  bool isVisible = true;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> emailSubject = [];
  List<String> emailBodyHint = [];



  @override
  void initState() {

    emailSubject.add("Email Subject One");
    emailSubject.add("Email Subject Two");
    emailSubject.add("Email Subject Three");
    emailBodyHint.add("Email Body Hint One");
    emailBodyHint.add("Email Body Hint Two");
    emailBodyHint.add("Email Body Hint Three");

    emailSubject.add("Email Subject One");
    emailSubject.add("Email Subject Two");
    emailSubject.add("Email Subject Three");
    emailBodyHint.add("Email Body Hint One");
    emailBodyHint.add("Email Body Hint Two");
    emailBodyHint.add("Email Body Hint Three");

    emailSubject.add("Email Subject One");
    emailSubject.add("Email Subject Two");
    emailSubject.add("Email Subject Three");
    emailBodyHint.add("Email Body Hint One");
    emailBodyHint.add("Email Body Hint Two");
    emailBodyHint.add("Email Body Hint Three");

    emailSubject.add("Email Subject One");
    emailSubject.add("Email Subject Two");
    emailSubject.add("Email Subject twelve");
    emailBodyHint.add("Email Body Hint One");
    emailBodyHint.add("Email Body Hint Two");
    emailBodyHint.add("Email Body Hint Three");

    // setState(() {
      widget.scrollViewController?.addListener(() {
        if (widget.scrollViewController?.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (widget.isVisible == true) {
            setState(() {
              widget.isVisible = false;
            });
          }
        } else {
          if (widget.scrollViewController?.position.userScrollDirection ==
              ScrollDirection.forward) {
            if (widget.isVisible == false) {
              setState(() {
                widget.isVisible = true;
              });
            }
          }
        }
      });
    // });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      floatingActionButton: Visibility(
        visible: widget.isVisible,
        child: FloatingActionButton.extended(
          isExtended: widget.isVisible,
          onPressed: () {},
          backgroundColor: Colors.red,
          icon:  Icon(Icons.edit),
          label: Text('Compose'),

        ),
      ),
      appBar: AppBar(
        title: Text(
          "Primary",
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.065,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: (emailSubject.length),
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text("Sub ${emailSubject[index]}"),
            subtitle: Text("Hint: ${emailBodyHint[index]}"),
            trailing: const Icon(Icons.star_border, size: 25.0),
            leading: CircleAvatar(
              backgroundColor: Colors.brown.shade300,
              child: Text(String.fromCharCode(index+65)),
              maxRadius: 30,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MailDetailsScreen(indexMail: index,headingMail: emailSubject[index],hintMail:  emailBodyHint[index])));
            },
          ),
        ),

      ),
    );


  }


}

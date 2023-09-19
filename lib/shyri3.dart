import 'package:flutter/material.dart';
import 'package:shari1/shayri6.dart';
import 'package:shari1/shyri4.dart';

class Shayri extends StatefulWidget {
  int index;

  Shayri(this.index);

  @override
  State<Shayri> createState() => _ShayriState();
}

class _ShayriState extends State<Shayri> {
  @override
  void initState() {
    if (widget.index == 0) {
      GlobalClass.passShayri = GlobalClass.funny;
    } else if (widget.index == 1) {
      GlobalClass.passShayri = GlobalClass.morning;
    } else if (widget.index == 2) {
      GlobalClass.passShayri = GlobalClass.night;
    } else if (widget.index == 3) {
      GlobalClass.passShayri = GlobalClass.birthday;
    } else if (widget.index == 4) {
      GlobalClass.passShayri = GlobalClass.friend;
    } else if (widget.index == 5) {
      GlobalClass.passShayri = GlobalClass.attitude;
    } else if (widget.index == 6) {
      GlobalClass.passShayri = GlobalClass.god;
    } else if (widget.index == 7) {
      GlobalClass.passShayri = GlobalClass.newyear;
    } else if (widget.index == 8) {
      GlobalClass.passShayri = GlobalClass.republic;
    } else if (widget.index == 9) {
      GlobalClass.passShayri = GlobalClass.holi;
    } else if (widget.index == 10) {
      GlobalClass.passShayri = GlobalClass.motivation;
    } else if (widget.index == 11) {
      GlobalClass.passShayri = GlobalClass.love;
    } else if (widget.index == 12) {
      GlobalClass.passShayri = GlobalClass.bestwish;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: GlobalClass.Appbar("${GlobalClass.cat_list[widget.index]}"),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Edit(index);
                    },
                  ));

                  print(index);
                });
              },
              tileColor: Colors.yellowAccent,
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.white,
              ),
              title: Text(
                "${GlobalClass.passShayri[index]}",
                maxLines: 1,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          );
        },
        itemCount: GlobalClass.passShayri.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shari1/shayri6.dart';
import 'package:shari1/shyri5.dart';

class Edit extends StatefulWidget {
  int index;
  Edit(this.index);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  PageController pg = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pg = PageController(initialPage: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalClass.Appbar("Edit"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "${widget.index + 1}/${GlobalClass.passShayri.length}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: pg,
              onPageChanged: (value) {
                widget.index = value;
              },
              itemCount: GlobalClass.passShayri.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Card(
                    elevation: 25,
                    color: Colors.yellowAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Text(
                        "${GlobalClass.passShayri[widget.index]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(21.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (widget.index > 0) {
                          widget.index--;
                          pg.animateToPage(widget.index,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      });
                    },
                    icon: Icon(Icons.keyboard_arrow_left)),
                IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(
                              text: "${GlobalClass.passShayri[widget.index]}"))
                          .then((value) {
                        Fluttertoast.showToast(
                          msg: "Copied",
                          toastLength: Toast.LENGTH_SHORT,
                          backgroundColor: Colors.black,
                          fontSize: 15,
                        );
                      });
                    },
                    icon: Icon(Icons.copy)),
                IconButton(
                    onPressed: () {
                      Share.share("${GlobalClass.passShayri[widget.index]}");
                    },
                    icon: Icon(Icons.share)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (widget.index <
                            (GlobalClass.passShayri.length - 1)) {
                          widget.index++;
                          pg.animateToPage(widget.index,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn);
                        } else {
                          Fluttertoast.showToast(
                              msg: "No More Shayris",
                              toastLength: Toast.LENGTH_SHORT,
                              backgroundColor: Colors.black54,
                              gravity: ToastGravity.CENTER);
                        }
                      });
                    },
                    icon: Icon(Icons.keyboard_arrow_right)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(41.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return FinalPage(widget.index);
                  },
                ));
              },
              child: Container(
                height: 50,
                width: 100,
                child: Center(
                    child: Text(
                  "Edit",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.yellowAccent,
                      fontWeight: FontWeight.bold),
                )),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

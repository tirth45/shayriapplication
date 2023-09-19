import 'dart:io';
import 'dart:math';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shari1/shayri6.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class FinalPage extends StatefulWidget {
  int index;

  FinalPage(this.index);
  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  DeviceInfoPlugin info = DeviceInfoPlugin();
  String folderpath = "";
  WidgetsToImageController con = WidgetsToImageController();

  @override
  void initState() {
    // TODO: implement initState
    createFolder();
  }

  Color bg = Colors.yellowAccent;
  Color tc = Colors.black;
  String text = "";

  double _currentSliderValue = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WidgetsToImage(
            controller: con,
            child: Center(
              child: Card(
                color: bg,
                elevation: 25,
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(text),
                      ),
                      Text(
                        "${GlobalClass.passShayri[widget.index]}",
                        style: TextStyle(fontSize: 17, color: tc),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(text),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          bg = GlobalClass.cololist[index];
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Container(
                                        color: GlobalClass.cololist[index],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: GlobalClass.cololist.length,
                              );
                            },
                          );
                        },
                        child: Text("Background")),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            tc = GlobalClass.textcolor[index];
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            color: GlobalClass.textcolor[index],
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: GlobalClass.textcolor.length,
                                  );
                                },
                              );
                            });
                          },
                          child: Text("Text Color")),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child:
                          ElevatedButton(onPressed: () {}, child: Text("Font")),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 50,
                                child: Slider(
                                  value: _currentSliderValue,
                                  max: 100,
                                  divisions: 5,
                                  label: _currentSliderValue.round().toString(),
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentSliderValue = value;
                                    });
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: Text("Text Size")),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ListView.builder(
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (GlobalClass.emojis[index] ==
                                            "clear") {
                                          text = "";
                                        } else {
                                          text = GlobalClass.emojis[index];
                                        }
                                      });
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(21)),
                                      elevation: 10,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Center(
                                            child: Text(
                                          "${GlobalClass.emojis[index]}",
                                          style: TextStyle(fontSize: 25),
                                        )),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: GlobalClass.emojis.length,
                              );
                            },
                          );
                        },
                        child: Text("Emoji")),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: ElevatedButton(
                        onPressed: () {
                          con.capture().then((value) async {
                            String imagename =
                                "image${Random().nextInt(10000)}.jpg";
                            String imagepath = "$folderpath/$imagename";
                            File file = File(imagepath);
                            file.writeAsBytes(value as List<int>);
                            await file.create();
                            Share.shareFiles(["${file.path}"]);
                          });
                        },
                        child: Text("Share")),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void createFolder() {
    info.androidInfo.then((value) async {
      if (value.version.sdkInt >= 11) {
        var folderName = "myshayri";
        var path = Directory("storage/emulated/0/Download/$folderName");

        if ((await path.exists())) {
          print("exists");
        } else {
          print("not exists");
          path.create();
        }

        setState(() {
          folderpath = path.path;
        });
      } else {
        var folderName = "myshayri3";
        var path = Directory("storage/emulated/0/Android/$folderName");

        if ((await path.exists())) {
          print("exists");
        } else {
          print("not exists");
          path.create();
        }

        setState(() {
          folderpath = path.path;
        });
      }
    });
  }
}

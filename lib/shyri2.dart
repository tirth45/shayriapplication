import 'package:flutter/material.dart';

import 'package:shari1/shayri6.dart';
import 'package:shari1/shyri3.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: GlobalClass.Appbar("Category"),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Shayri(index);
                    },
                  ));
                },
                tileColor: Colors.yellowAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(21)),
                title: Center(
                    child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    "${GlobalClass.cat_list[index]}",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                )),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 3,
            );
          },
          itemCount: GlobalClass.cat_list.length),
    );
  }
}

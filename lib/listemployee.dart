import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'detailemployee.dart';

class listemployee extends StatefulWidget {
  const listemployee({Key? key}) : super(key: key);

  @override
  _listemployeeState createState() => _listemployeeState();
}

class _listemployeeState extends State<listemployee> {

  void initState(){
    super.initState();
    DateTime now = new DateTime.now();
    print(now);
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("List of Employee")),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("empolyeedetails")
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
            final userSnapshot = snapshots.data?.docs;

            print(userSnapshot);
            return ListView.builder(
                itemCount: userSnapshot?.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: InkWell(
                          child: Row(
                            children: [
                              Container(
                                  width: 390.0,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 20.0, left: 10),
                                        child: Text(
                                          (userSnapshot?[index]['name']).toString(),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Container(
                                        child: ((userSnapshot?[index]['join date']))! == "12-07-2016" ? Icon(
                                          Icons.check_circle_outline_rounded,
                                          color: Colors.pink,
                                          size: 24.0,
                                          semanticLabel: 'Text to announce in accessibility modes',
                                        ):SizedBox(width: 1,)
                                      )
                                    ],
                                  )),

                            ],
                          ),
                          onTap: () {
                            var doc_id = snapshots.data?.docs[index].id;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  detailemployee(doc_id!)),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}

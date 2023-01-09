import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class detailemployee extends StatefulWidget {
  String doc_id;
   detailemployee(this.doc_id,{Key? key}) : super(key: key);

  @override
  _detailemployeeState createState() => _detailemployeeState();
}

class _detailemployeeState extends State<detailemployee> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Details of Employee"),
        ),
        body: FutureBuilder(
          future: FirebaseFirestore.instance.collection("empolyeedetails").doc(widget.doc_id).get(),
          builder: (context, AsyncSnapshot snapshots){
            final userSnapshot = snapshots.data;
            return (snapshots.hasData) ? Card(
              child: Container(
                height: 300,
                width: 400,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Text("Name: " ,style: TextStyle(
                                fontSize: 18
                            ),),
                          ),
                          Container(
                            child: Text(userSnapshot["name"], style: TextStyle(
                              fontSize: 18
                            ),),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text("Gender: ", style: TextStyle(
                                fontSize: 18
                            ),),
                          ),
                          Container(
                            child: Text(userSnapshot["gender"], style: TextStyle(
                                fontSize: 18
                            ),),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text("mobile Number: ", style: TextStyle(
                                fontSize: 18
                            ),),
                          ),
                          Container(
                            child: Text(userSnapshot["mobile"].toString(), style: TextStyle(
                                fontSize: 18
                            ),),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text("Gmail: ", style: TextStyle(
                                fontSize: 18
                            ),),
                          ),
                          Container(
                            child: Text(userSnapshot["gmail"], style: TextStyle(
                                fontSize: 18
                            ),),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text("Joining Date: ", style: TextStyle(
                                fontSize: 18
                            ),),
                          ),
                          Container(
                            child: Text(userSnapshot["join date"], style: TextStyle(
                                fontSize: 18
                            ),),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ) : Center(child: CircularProgressIndicator());
          },
        )


      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DisplayMessege extends StatefulWidget {
  final String username;
  const DisplayMessege({
    super.key,
   required this.username
  });

  @override
  State<DisplayMessege> createState() => _DisplayMessegeState();
}

class _DisplayMessegeState extends State<DisplayMessege> {

  final Stream <QuerySnapshot> _MessegeStream= FirebaseFirestore.instance
      .collection('Messege')
      .orderBy('Time')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _MessegeStream,
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text('Some thing are error'),
            );
          } else if(snapshot.connectionState== ConnectionState.waiting){
            return Center( child: Text('Please wait ....'),);
          } return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            shrinkWrap: true,
              physics: ScrollPhysics(),
              primary: true,
              itemBuilder: (context,index){
              QueryDocumentSnapshot doc= snapshot.data!.docs[index];
              Timestamp time= doc['Time'];
              DateTime dateTime =time.toDate();
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                  child: Column(
                    crossAxisAlignment: widget.username == doc['name']?CrossAxisAlignment.end:CrossAxisAlignment.start,
                    children: [
                     SizedBox(
                       width: 300,
                       child: ListTile(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.purple
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            )
                          ),
                         title: Text(doc['name'].toString(),
                           style: TextStyle(
                             color: Colors.blue,fontWeight: FontWeight.bold
                           ),),
                         subtitle: Row(
                           children: [
                          SizedBox(
                            width: 200,
                            child: Text(doc['messege'].toString(),
                              softWrap: true,
                              style: TextStyle(color: Colors.black87),),
                          ),
                             Text('${dateTime.hour}: ${dateTime.minute}')
                           ],
                         ),
                       ),
                     )
                    ],
                  ),
                );
              });
        });
  }
}

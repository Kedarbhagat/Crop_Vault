import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hack_o_mania/admin/DisplayFarmer.dart';
// import 'package:hack_o_mania/admin/search_famer.dart';
import 'package:hack_o_mania/starting/login.dart';
import '../starting/Sign.dart';
List<Map<String, dynamic>> documentsList =[] ;
TextEditingController region = TextEditingController() ;
TextEditingController farmerWho = TextEditingController() ;
TextEditingController crops = TextEditingController() ;
TextEditingController folderName = TextEditingController() ;
CollectionReference folders = FirebaseFirestore.instance.collection('folder_admin');
class folder extends StatelessWidget {
  const folder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(

              controller: folderName,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide( color: Colors.green,width: 2),
                    borderRadius: BorderRadius.circular(30)
                ),
                contentPadding: EdgeInsets.all(20),
                border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20)),
                hintText: 'Enter the Folder name',
              ),
            ),
            SizedBox(
              height: 10,
            ) ,
            TextFormField(

              controller: region,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide( color: Colors.green,width: 2),
                    borderRadius: BorderRadius.circular(30)
                ),
                contentPadding: EdgeInsets.all(20),
                border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20)),
                hintText: 'Enter region',
              ),
            ),
            SizedBox(
  height: 10,
            ) ,
            TextFormField(

              controller: crops,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide( color: Colors.green,width: 2),
                    borderRadius: BorderRadius.circular(30)
                ),
                contentPadding: EdgeInsets.all(20),
                border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20)),
                hintText: 'Enter the type of crops',
              ),
            ),
            TextFormField(

              controller: farmerWho,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide( color: Colors.green,width: 2),
                    borderRadius: BorderRadius.circular(30)
                ),
                contentPadding: EdgeInsets.all(20),
                border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20)),
                hintText: 'Enter the Email of farmer',
              ),
            ),
            SizedBox(
              height: 10,
            ) ,
            ElevatedButton(onPressed: ()async{
                 var result  =  await FirebaseFirestore.instance.collection('User').where('Location' , isEqualTo: region.text.trim()).where('Role' , isEqualTo: 'Farmer').get();
                  documentsList = result.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
                  print(documentsList) ;
              Navigator.push(context, MaterialPageRoute(builder: (context)=>display())) ;
                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>search())) ;
            }, child: Text("Search Farmers")) ,
            ElevatedButton(onPressed: ()async{
              await folders.doc(document.toString())
                  .set({
                  'Folder_Name':folderName.text,
                  'crops':crops.text,
                  'folder_id':document.toString() ,
                  'farmer_id':'not set' ,
                  'region': region.text,
              })
                  .then((value) => print("user added"))
                  .catchError((error)=>print("error in user"));
              Navigator.pop(context) ;
              await FirebaseFirestore.instance.collection('User').doc(sendingUID.toString()).update(
                  {
                    'ping':true ,
                    'AdminSender':document.toString()
                  }) ;

            }, child: Text("Send")) ,
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'create_folder.dart';
import 'package:hack_o_mania/admin/create_folder.dart';
var sendingUID= '' ;
class display extends StatelessWidget {
  const display({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: documentsList.length,
          itemBuilder:( BuildContext context , index){
          return ListTile(
            onTap: (){
              sendingUID = documentsList[index]['uid'];
             print(sendingUID) ;
              Navigator.pop(context) ;
            },
            title: Text(documentsList[index]['Location']),
            subtitle: Text(documentsList[index]['uid'],)

          ) ;
    }
    ) ,
    )  ;
  }
}

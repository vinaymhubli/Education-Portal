import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, String title, String content) async {
  return await showDialog(
    
    barrierColor: Colors.blue.withOpacity(0.2),
    
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(  
        borderRadius: BorderRadius.circular(25)
      ),
      title: Text(title,style: TextStyle(fontSize: 23,color:Colors.black,fontWeight: FontWeight.bold),),
      content: Text(content),
      actions: [
        
      
        ElevatedButton(
          
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
          
              
              child: Text(
                "ok",
              ),
            ),
          ]));
        
      
    
  
}
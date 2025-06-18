import 'package:axiom_admin/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryBtn extends StatelessWidget {
  final CategoryButtonModel model;
  const CategoryBtn({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: model.onPressed,
     style:ElevatedButton.styleFrom(
      backgroundColor: model.color,
      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      )
     ),
     child: Column(
      children: [
        Icon(model.icon,size: 50,color: Colors.white, ),
        SizedBox(height: 10,),
        Text(model.title,style: TextStyle(  fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)
      ],
     
    ));

      }
}
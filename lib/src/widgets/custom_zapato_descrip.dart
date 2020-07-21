import 'package:flutter/material.dart';

class CustomZapatoDescripcion extends StatelessWidget {
  final String titulo;
  final String descripcion;

  const CustomZapatoDescripcion(
      {this.titulo, this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text(this.titulo,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),),
          SizedBox(height: 20,),
          Text(this.descripcion,style: TextStyle(color: Colors.black45, height: 1.6),),
        ],
      ),
    );
  }
}

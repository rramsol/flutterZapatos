import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappzapatos/src/widgets/custom_boton_naranja.dart';

class CustomAgregarCarriton extends StatelessWidget {
  final double monto;

  const CustomAgregarCarriton({this.monto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.10),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 20,),
            Text('\$$monto',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            SizedBox(width: 30,),
            CustomBotonNaranja(texto: 'Add to Cart',),
          ],
        ),
      ),
    );
  }
}

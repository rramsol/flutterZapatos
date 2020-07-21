import 'package:flutter/material.dart';
import 'package:flutterappzapatos/src/helpers/helpers.dart';
import 'package:flutterappzapatos/src/widgets/custom_wdigets.dart';

class ZapatoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(texto: 'Para TI'),
          SizedBox(height: 20,),
          //por si no cabe baja
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Hero(
                      tag: 'zapato1',
                      child: CustomZapatoSize()
                  ),
                  CustomZapatoDescripcion(
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                    titulo: 'Nike Air Max 720',
                  ),
                ],
              ),
            ),
          ),
          CustomAgregarCarriton(monto: 180),


        ],
      ),
      //body: CustomAppbar(texto: 'PARA TI',),
    );
  }
}

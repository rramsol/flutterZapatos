import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappzapatos/src/helpers/helpers.dart';
import 'package:flutterappzapatos/src/models/zapato_model.dart';
import 'package:flutterappzapatos/src/widgets/custom_wdigets.dart';
import 'package:provider/provider.dart';

class ZapatoDescripcionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    cambiarStatusLigth();
    return Scaffold(
      body:Column(
        children: [
          Stack(
              children: [
                Hero(
                  tag: 'zapato1',
                    child: CustomZapatoSize(fullScreen:true)
                ),
                Positioned(
                  top: 80,
                  child: FloatingActionButton(
                    child: Icon(Icons.chevron_left,color: Colors.white,size: 60,),
                    onPressed: (){
                      cambiarStatusDark();
                      Navigator.pop(context);
                    },
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    highlightElevation: 0,
                  ),
                )
              ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomZapatoDescripcion(
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                    titulo: 'Nike Air Max 720',
                  ),
                  _MontoBuyNow(),
                  _ColoresYmas(),
                  _BotonesLikeCartSettings()
                ],
              ),
            ),
          )
        ],
      ) ,
    );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          _BotonSombreado(icon:Icon(Icons.add,color: Colors.red,)),
          _BotonSombreado(icon:Icon(Icons.add_shopping_cart,color: Colors.grey,)),
          _BotonSombreado(icon:Icon(Icons.settings, color: Colors.grey,)),

        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;

  const _BotonSombreado({
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icon,
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color:Colors.black12,spreadRadius: -5,blurRadius: 20, offset:Offset(3,5),)
        ]
      ),

    );
  }
}

class _ColoresYmas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [

          Expanded(
            child: Stack(
              children: [
                Positioned(
                  child: _BotonColor(color: Colors.blue,index: 2,urlimage: 'assets/imgs/azul.png',),
                  left: 35,
                ),
                Positioned(
                  child: _BotonColor(color: Colors.orange,index:3,urlimage: 'assets/imgs/amarillo.png',),
                  left: 65,
                ),
                Positioned(
                  child: _BotonColor(color: Colors.green,index:4,urlimage: 'assets/imgs/verde.png',),
                  left: 95,
                ),
                _BotonColor(color: Colors.black54,index:1,urlimage: 'assets/imgs/negro.png',),
              ],
            ),
          ),

          CustomBotonNaranja(texto: 'more related item',alto: 30,)
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {

  final Color color;
  final int index;
  final String urlimage;

  const _BotonColor({
   this.color,
    this.index,
    this.urlimage,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index*100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: (){
          final zapatoModel = Provider.of<ZapatoModel>(context,listen: false);
          zapatoModel.assetImage = this.urlimage;
        },
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: this.color,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 30,bottom: 30),
        child: Row(
          children: [
            Text('\$180', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            Spacer(),
            Bounce(
                delay: Duration(milliseconds: 700),
                from: 8,
                child: CustomBotonNaranja(texto: 'buy now',alto:40,ancho:120)),
          ],
        ),
      ),
    );
  }
}

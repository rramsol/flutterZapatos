import 'package:flutter/material.dart';
import 'package:flutterappzapatos/src/models/zapato_model.dart';
import 'package:flutterappzapatos/src/pages/zapato_descripcion_page.dart';
import 'package:provider/provider.dart';

class CustomZapatoSize extends StatelessWidget {

  final bool fullScreen;

  const CustomZapatoSize({this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(!this.fullScreen){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ZapatoDescripcionPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (this.fullScreen)?5:30,
            vertical: (this.fullScreen)?5:15,
        ),
        child: Container(
          width: double.infinity,
          height: (this.fullScreen)?410:430,
          decoration: BoxDecoration(
            color:Color(0xffF8D468),
            borderRadius:
            (!this.fullScreen)
                ?BorderRadius.circular(50)
                :BorderRadius.only( bottomRight: Radius.circular(50),
                                    bottomLeft: Radius.circular(50),
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40)),
          ),
          child: Column(
            children: [
              _ZapatoConSombra(),
              if(!this.fullScreen)
              _ZapatoTallas(),
            ],
          ),
        ),
      ),
    );
  }
}


class _ZapatoConSombra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: EdgeInsets.all(50),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 10,
              child: _Sombra()
          ),
          Image(
            image: AssetImage(zapatoModel.assetImage),
          )
        ],
      ),
    );
  }
}

class _Sombra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 250,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Color(0xffEAA14E),blurRadius: 40)
          ],
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TallasCajas(numero: 7,),
          _TallasCajas(numero: 7.5,),
          _TallasCajas(numero: 8,),
          _TallasCajas(numero: 8.5,),
          _TallasCajas(numero: 9,),
          _TallasCajas(numero: 9.5,),
        ],
      ),
    );
  }
}

class _TallasCajas extends StatelessWidget {

  final double numero;

  const _TallasCajas({
      this.numero
  });

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: (){
        zapatoModel.talla=this.numero;
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        child: Text('${numero.toString().replaceAll('.0', '')}',
          style: TextStyle(
            color: (numero == zapatoModel.talla)? Colors.white:Color(0xffF1A23A),
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        decoration: BoxDecoration(
          color: (numero == zapatoModel.talla)?Color(0xffF1A23A) :Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow:[
            (numero == zapatoModel.talla)? BoxShadow(
              color: Colors.red,
              blurRadius: 10,
              offset: Offset(0,5),
            ):BoxShadow(
            ),
          ]
        ),
      ),
    );
  }
}

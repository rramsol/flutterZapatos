import 'package:flutter/material.dart';
import 'package:flutterappzapatos/src/models/zapato_model.dart';
import 'package:flutterappzapatos/src/pages/zapato_descripcion_page.dart';
import 'package:flutterappzapatos/src/pages/zapato_page.dart';
import 'package:provider/provider.dart';


void main() => runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=> new ZapatoModel(),),
        ],
        child: MyApp()
    )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      //home: ZapatoDescripcionPage(),
      home: ZapatoPage(),
    );
  }
}

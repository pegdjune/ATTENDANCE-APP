
import 'dart:io';
import 'package:snd_registre/main.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:barcode_scan2/barcode_scan2.dart' ;
// import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

class QRcodewidget extends StatefulWidget {
  const QRcodewidget({super.key});

  @override
  State<QRcodewidget> createState() => _QRcodewidgetState();
}

class _QRcodewidgetState extends State<QRcodewidget> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  Barcode? scanresult;

  void _onQRViewCreated(QRViewController controller) {
    this.controller;
    controller.scannedDataStream.listen((scanData) { 
      setState(() {
       scanresult = scanData;
      });
      // Navigator.of(context).pop();
      // showDialog(context: context, builder: (BuildContext context){return AlertDialog(title: const Text('data'), content: Text(scanData as String),);} );
    });
  }
  

  @override
  void reassemble() {
    super.reassemble();
    if(Platform.isAndroid){
      controller.pauseCamera();
    }else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  void dispose(){
  
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(

            flex: 3,
            child: QRView(
              key: qrKey, 
              onQRViewCreated: _onQRViewCreated,
              // cameraFacing: CameraFacing.front,
            
            
            ),
          
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: ( scanresult != null )
                ? Text(
                    ' Barcode Type: ${describeEnum(scanresult!.format)}  Data: ${scanresult!.code} ')
                : const Text('Scannez le code'),
            ),
          
          ),
        ],
      ),
    ) ;
  }
}

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}



class _ScanState extends State<Scan> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  String? _selectedOption = 'Entrée' ;
  String comment = '';
  String? scanresult;

  
  late int etat;
  
  // Future <void> startScan() async {
  //   final status = await Permission.camera.request();

  //   try {
  //     if(status.isGranted){
  //       var result = await BarcodeScanner.scan(options:  const ScanOptions(useCamera: 2));
  //       setState(() {
  //         scanresult = result as String?;
  //       });

  //     }

  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Erreur de scan : $e');
  //     }
  //   }
  // }



  void handleOptionChanged( String? newValue){
    setState(() {
      _selectedOption= newValue ;
    });
  }

  @override
  void dispose(){
    _textEditingController.dispose();
    super.dispose();
  }

  void _scanProcess() {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Vous venez d'arriver ou vous êtes entrain de partir?"),
          content:  StatefulBuilder(
            builder: (BuildContext context, StateSetter setState ){
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    // autofocus: true,
                    // tileColor: Colors.black,
                    value: 'Entrée', 
                    groupValue: _selectedOption, 
                    onChanged:( String? newValue){
                      setState(() {
                        _selectedOption= newValue ;
                      });
                    },
                    title: const Text(
                      'Entrée',
                      
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    
                    ),
                  ),
                  RadioListTile<String>(
                    value: "Sortie", 
                    groupValue: _selectedOption, 
                    onChanged:( String? newValue){
                      setState(() {
                        _selectedOption= newValue ;
                      });
                    },
                    title: const Text(
                      'Sortie',
                      
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    
                    ),
                  
                  ),
                  
                ],
              );


            },
          ),
          
          
          contentPadding: const EdgeInsets.all(16),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF244B98),
              ),
              onPressed: (){
                Navigator.of(context).pop();
                showDialog(
                  context: context, 
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Justifiez votre retard ou votre sortie précorce !!!"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: _textEditingController,
                            maxLines: 4,
                            decoration: const InputDecoration(
                              hintText: 'Entrez votre justificatif ici...' , 
                              border: OutlineInputBorder()
                            
                            ),
                          ),
                        ],
                      ),
                      contentPadding: const EdgeInsets.all(16),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF244B98),
                          ),
                          onPressed: () async {
                            
                            comment = _textEditingController.text;
                            etat = 1;
                            Navigator.of(context).pop();

                            // var res = await Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context)=> const SimpleBarcodeScannerPage(),)
                            // );
                            // setState(() {
                            //   if(res is String) {
                            //     scanresult = res;
                            //   }
                            // });

                            // Navigator.push(
                            //   context, 
                              
                            //   MaterialPageRoute(builder: (context) =>  const QRcodewidget()),
                            
                            // );


                            // FlutterBarcodeScanner.getBarcodeStreamReceiver(
                            //   "#ff6666", "Annuler", true, ScanMode.QR)?.listen((barcode) {
                            //     scanresult = barcode;

                            // });


                            scanresult = await FlutterBarcodeScanner.scanBarcode("#244B98", "Annuler", false, ScanMode.QR);
                            if (kDebugMode) {
                              print(scanresult);
                            }
                            
                            // DashBoardPage( key: classKey ,user: 'emds',);
                            classKey.currentState?.handleSelectIndex(0);
                           
                          }, 



                          child: const Text(
                            'Scannez',
                            style: TextStyle(
                                color: Colors.white,
                              ),
                          ),
                        ),
                      ],
                    );
                  },
                
                );
              },

                
              child: const Text(
                'Suivant',
                style: TextStyle(
                    color: Colors.white,
                  ),
              ),
            
            ),
          ],
        );
      },
    
    );
  }

 

  @override
  Widget build(BuildContext context) {
    
    return Form(
      key: _formKey,
      child:   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Lancer le processus pour scanner le code QR "),
          
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF244B98),
              ),
            onPressed: _scanProcess ,
            child: const Text(
              'LANCER',
              style: TextStyle(
              
                decoration: TextDecoration.none,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
    
       
      ),
    );


    
    
  }




 



}


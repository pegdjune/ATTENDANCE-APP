import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {

  String? selectedOption  ;
  String comment = '';
  

  bool isScanCompleted = false;


  void closeScreen(){
    isScanCompleted =false;
  }

  void _scanProcess() {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Vous venez d'arriver ou vous êtes entrain de partir?"),
          content: Column(
            children: [
              RadioListTile(
                value: 'Entrée', 
                groupValue: selectedOption, 
                onChanged: (value) {
                  setState(() {
                    selectedOption = value ;
                  });
                },
              ),
              RadioListTile(
                value: 'Sortie', 
                groupValue: selectedOption, 
                onChanged: (value) {
                  setState(() {
                    selectedOption = value ;
                  });
                },
              
              ),
              
            ],
          ),
          contentPadding: const EdgeInsets.all(16),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF244B98),
              ),
              onPressed: (){}, 
              child: const Text('Suivant'),
            
            ),
          ],
        );
      },
    
    );
  }

 

  @override
  Widget build(BuildContext context) {
    
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Placez le code QR dans cet espace"),
              SizedBox(
                height: 10,
              ),
              
            ],
          )
        ),
        
      ],
    );
  }
}
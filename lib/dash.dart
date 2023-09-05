import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:snd_registre/main.dart';

// ignore: camel_case_types, must_be_immutable, use_key_in_widget_constructors
class dash extends StatelessWidget{

  const dash( {Key? key }) : super(key: key);
  


  
  
  
  @override
  Widget build(BuildContext context){

    final List<Conversation> conversations = [
    Conversation('DG :', 'Oui, bonjour appelle moi', '08:30'),
    Conversation('Angelo :', 'Je vais bien, Merci', 'Hier'),
    Conversation('Gerard :', 'Je serai absent à la reunion', '10:24'),
    Conversation('JEAN :', ' Coucou', '20:54'),
    Conversation('Hypolite :', 'Tu en es où pour le projet?', '10:24'),
  ];
  
  
  // ignore: non_constant_identifier_names
  final List<AttendanceRecord> AttendanceRecords = [
    AttendanceRecord('2023-09-01','09:00', '17:00'),
    AttendanceRecord('2023-09-02','09:52', '15:00'),
    AttendanceRecord('2023-09-03','09:00', '18:00'),
    AttendanceRecord('2023-09-04','07:00', '17:00'),
    AttendanceRecord('2023-09-06','09:00', '17:00'),
    AttendanceRecord('2023-09-08','15:00', '17:20'),
  ];
  
  Map<String, double> dataMap = {
    ' Utilisés ' : 5,
    ' Restants' : 50,
  };






    // ignore: prefer_typing_uninitialized_variables
   
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      
      children: [
        const Padding(

          padding: EdgeInsets.all(30),
          
          child: Text(
            'Bonjour ',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              
            ),
          ),
        ),

        Row(
          children: [
            SizedBox(
              width: 160,
              height:250,
              child: PieChart(
                dataMap: dataMap,
                // animationDuration: const Duration(milliseconds: 800),
                // chartLegendSpacing: 32,
                // chartRadius: MediaQuery.of(context).size.width / 3.2,
                // colorList: colorList,
                // initialAngleInDegree: 0,
                // chartType: ChartType.ring,
                // ringStrokeWidth: 32,
                centerText: "HEURES",
                legendOptions: const LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.bottom,
                //   showLegends: true,
                //   legendTextStyle: TextStyle(
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // chartValuesOptions: const ChartValuesOptions(
                //   showChartValueBackground: true,
                //   showChartValues: true,
                //   showChartValuesInPercentage: false,
                //   showChartValuesOutside: false,
                //   decimalPlaces: 1,
                // ),
                ),
              ),
            ),

            SizedBox(
              width: 250,
              height:240,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(15),
               
                // scrollDirection: Axis.vertical,
                // shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: conversations.map((Conversation conversation) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      leading: CircleAvatar(
                        radius: 20,
                        child: Text(conversation.contactName[0]),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        children: [
                          Text(
                            conversation.contactName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            conversation.time,
                            style: const TextStyle(fontSize: 12),
                          )

                        ],
                      ),
                      
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            conversation.lastMessage,
                            overflow: TextOverflow.ellipsis,
                          
                          ),
                          
                        ],
                      ),
                      onTap: () {

                        // Navfigation vers le messages ou la discussion



                      },
                    );
                  }).toList(),

                ),
                
              ),

            ),

          ],

        ),

        
        SizedBox(
          
          width: 500,
          height: 280,
          
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 19),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child : Container(
              color: const Color(0xFFEDEDED),
              
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(

                  columnSpacing: 25,
                  columns: const [
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Heure de Venue')),
                    DataColumn(label: Text('Heure de Sortie')),
                  ], 
                  rows: AttendanceRecords.map((record) {
                    return DataRow(cells: [
                      DataCell(Text(record.date)),
                      DataCell(Text(record.arrivalTime)),
                      DataCell(Text(record.outTime)),
                    ]);
                  }).toList(),
                  
                  
                  
                  ),
                  // const Text(
                  //   'Tableau de Présence',
                  //   style: TextStyle(
                  //     fontSize: 20.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),

                
                
              ) ,

            ),


            ),
        ),


        
      ],

    );
  }
  
 
}
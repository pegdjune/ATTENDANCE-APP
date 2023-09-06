import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:snd_registre/dash.dart';
import 'package:snd_registre/scan.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF196FB8),
          brightness: Brightness.light
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(
        title: '2SND Technologie Register' ,
      
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  
  get leading => null;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // appBar: AppBar(
        
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
      //   title: Text(
      //     widget.title ,
      //     textAlign: TextAlign.justify,
      //   ),
      // ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
    
          children: <Widget>[
            const SizedBox(height: 1),
            Container(
              margin: const EdgeInsets.all(120.0),
              child:Image.asset('assets/2sndlogo1.png'),
            ),
            
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF244B98),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size(200, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              }, 
              
              
              child: const Text(
                'SE CONNECTER ',
                style: TextStyle(
                  color: Colors.white ,
                  fontSize: 16,
                ),
                
              )
            ),

            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Temps - Présence - Productivité',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),  
            
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  void _showForgotPasswordDialog(){
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reinitialisation de mot de passe'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Entrer à nouveau votre email pour changer votre mot de passe :'),
              const SizedBox(height: 10),
              TextFormField(
                onChanged: (value) {
                },
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez renseigner votre email'; 
                  }
                  return null ;
                },
              )
            ],
          ),
          contentPadding: const EdgeInsets.all(16),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF244B98),
              ),
              onPressed: () {
                // if (_formKey.currentState!.validate()) {

                  String email = _emailController.text;
                  Navigator.of(context).pop();
                  showDialog(
                    context: context, 
                    builder: (BuildContext context ){
                      return AlertDialog(
                        title: const Text('Notification'),
                        content: const Text('Consultez votre boite mail'),
                        actions: [
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFF244B98),
                            ),
                            onPressed: (){ Navigator.of(context).pop();}, 
                            child: const Text(
                              'Fermer', 
                              style: TextStyle( 
                                color: Colors.white,
                              ),
                            )
                          )
                        ],
                      );
                    }
                  
                  );
                  if (kDebugMode) {
                    print('Demande de changement de mot de passe pour : $email');
                  }
                // }
              }, 
              child: const Text(
                'Réinitialiser',
                style: TextStyle(
                  
                  color: Colors.white ,
                ),
              
              ),
            ),
          ],
        );
      }
    );
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
            
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 1),
                Container(
                  margin: const EdgeInsets.all(40.0),
                  child:Image.asset('assets/2sndlogo.png'),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer une email valide' ;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Mot de passe'),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Veuillez entrer votre mot de passe';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF244B98),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size(200, 50),
                  ),
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      String email = _emailController.text;
                      String password = _passwordController.text;

                      // authentification pour le login avec l'API

                      Navigator.push(
                        context, 
                        
                        MaterialPageRoute(builder: (context) =>  DashBoardPage( user: email,)),
                      
                      );



                      //affichage
                      if (kDebugMode) {
                        print('Email: $email ');
                      }
                      if (kDebugMode) {
                        print('Password: $password');
                      }
                    }
                  }, 
                  child: const Text(
                    'CONNEXION',
                    style: TextStyle(
                      color: Colors.white ,
                      fontSize: 16,
                ),
                  ),
                ),


                const SizedBox(height: 10),

                GestureDetector(
                  onTap: _showForgotPasswordDialog ,
                  child: const Text(
                    'Mot de passe oublié ?',
                    style: TextStyle(
                    
                      // decoration: TextDecoration.underline,
                    ),
                  ),
                ),


              ],
            ),
          
          ),
        
        ),
      ),
    );
  }
}



class DashBoardPage extends StatefulWidget {
  const DashBoardPage( { Key? key,  required this.user }) : super(key: key);
  final String user;
  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class Conversation{
  final String contactName;
  final String lastMessage;
  final String time;

  

  Conversation(this.contactName, this.lastMessage, this.time);

}

class AttendanceRecord {
  final String date;
  final String arrivalTime ;
  final String outTime;

  AttendanceRecord(this.date, this.arrivalTime, this.outTime);
}

class _DashBoardPageState extends State<DashBoardPage> {
  
  


  int _selectedIndex = 0;
  


 

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.white,));
    return Scaffold(
      
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        title: const Text(
          '2SND Attendance Register',
          style: TextStyle(
            color: Colors.white,
          ),
        
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        actions: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // color: Colors.white,
            ),
            child: IconButton(
              icon: const Icon(Icons.account_circle, size: 50, color: Colors.black, ),
              tooltip: 'Profil',
              

            
              onPressed: () {},
            ),

          ),
        ],
      ),
      body: Center(
        child: [
          const dash(),
          const Scan(),
        ][_selectedIndex]

      ), 
      
        
      
      
      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code, size: 50,),
            label: 'Scannez', 
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chat', 
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF244B98),
        onTap: (int index){
          setState(() {
            _selectedIndex=index;
          });
        },

      ),
    );

  }
}


















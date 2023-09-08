// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:snd_registre/main.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    final List<Conversation> conversations = [
      Conversation('DG :', 'Oui, bonjour appelle moi', '08:30'),
      Conversation('Angelo :', 'Je vais bien, Merci', 'Hier'),
      Conversation('Gerard :', 'Je serai absent à la reunion', '10:24'),
      Conversation('JEAN :', ' Coucou', '20:54'),
      Conversation('Hypolite :', 'Tu en es où pour le projet?', '10:24'),
      Conversation('Xavier :', ' pour le projet?', '10:24'),
      Conversation('Brown :', 'et ta santé ?', '10:24'),
      Conversation('Hospice :', 'Tu  es où ?', '10:24'),
      Conversation('Andrea :', 'tu etais a la reunion?', '10:24'),
      Conversation('Irving :', 'je suis parti  en mission', '10:24'),
      Conversation('Andil :', 'les documents sont deja prêt?', '10:24'),
      Conversation('Kyrie :', ' Vous avez de la visite', '10:24'),
    ];

    var size, height, width;

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Stack(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),

            // scrollDirection: Axis.vertical,
            // shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: conversations.map((Conversation conversation) {
                return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  leading: CircleAvatar(
                    radius: 20,
                    child: Text(conversation.contactName[0]),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Nouveau message',
            child: const Icon(Icons.message),
          ),
        ),
      ],
    );
  }
}

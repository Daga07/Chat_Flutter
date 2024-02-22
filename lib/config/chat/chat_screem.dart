import 'package:app_mensajes/config/widgets/My_mesaage.dart';
import 'package:app_mensajes/config/widgets/ella_screem.dart';
import 'package:app_mensajes/config/widgets/message_field.dart';
import 'package:app_mensajes/entities/message.dart';
import 'package:app_mensajes/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://data.ibtimes.sg/en/full/7054/jennifer-lopez.jpg?w=564'),
          ),
        ),
        title: const Text('♥ Mi amor ♥'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollcontroller,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];

                      return (message.fromWho == FromWho.hers)
                          ? EllMesage(message: message)
                          : MyMesage(message: message);
                    })),

            //caja de texto
            MessageFielBox(
              //onValio: (value) => chatProvider.sendMessage(value),
              onValio: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}

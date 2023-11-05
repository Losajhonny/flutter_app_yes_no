import 'package:app_yes_no/domain/entities/message.dart';
import 'package:app_yes_no/presentation/providers/chat_provider.dart';
import 'package:app_yes_no/presentation/widgets/chat/her_message_bubble.dart';
import 'package:app_yes_no/presentation/widgets/chat/my_message_bubble.dart';
import 'package:app_yes_no/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://picsum.photos/400"),
          ),
        ),
        title: const Text("Chat"),
        centerTitle: false,
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.scrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return (message.fromWho == FromWho.me)
                      ? MyMessageBubble(
                          message: message,
                        )
                      : HerMessageBubble(
                          message: message,
                        );
                },
              ),
            ),
            MessageFieldBox(
              //onValue: (value) {
              //  chatProvider.sendMessage(value);
              //},
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:app_yes_no/config/helpers/get_yes_no_aswer.dart';
import 'package:app_yes_no/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController _scrollController = ScrollController();
  final GetYesNoAnswer _getYesNoAnswer = GetYesNoAnswer();

  final List _messageList = [
  ];

  List get messageList => _messageList;
  ScrollController get scrollController => _scrollController;

  void sendMessage(String text) {
    if (text.isEmpty) return;
    _messageList.add(Message(text: text, fromWho: FromWho.me));

    if (text.endsWith("?")) herReply();

    notifyListeners();
    moveScrollToBottom();
  }

  void herReply() async {
    final answer = await _getYesNoAnswer.getAnswer();
    _messageList.add(answer);
    
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key, required this.onValue});

  final ValueChanged<String> onValue;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlinedInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(40.0),
      borderSide: const BorderSide(color: Colors.transparent),
    ); 

    final decoration = InputDecoration(
      hintText: 'End you message with "?"',
      filled: true,
      fillColor: color.secondary.withOpacity(0.1),
      enabledBorder: outlinedInputBorder,
      focusedBorder: outlinedInputBorder,
      suffixIcon: IconButton(
        onPressed: () {
          final textValue = textController.text;
          textController.clear();
          onValue(textValue);
        },
        icon: const Icon(Icons.send_outlined),
      ),
    );

    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: decoration,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        debugPrint(value);
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
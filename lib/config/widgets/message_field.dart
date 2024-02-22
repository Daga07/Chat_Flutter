// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class MessageFielBox extends StatelessWidget {
  final ValueChanged<String> onValio;
  const MessageFielBox({super.key, required this.onValio});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final colors = Theme.of(context).colorScheme;
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: colors.background),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      hintText: 'Mensaje pregunta "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
          onPressed: () {
            final textValue = textController.value.text;

            textController.clear();
            onValio(textValue);
          },
          icon: const Icon(Icons.send_rounded)),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValio(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}

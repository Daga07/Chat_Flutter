import 'package:flutter/material.dart';

import '../../entities/message.dart';

class EllMesage extends StatelessWidget {
  final Message message;
  const EllMesage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        const SizedBox(height: 5),

        _Imagen(message.imageUrl!),
        const SizedBox(height: 10),
        // imagen
      ],
    );
  }
}

class _Imagen extends StatelessWidget {
  final String imageUrl;
  const _Imagen(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Mi amor esta enviando una imagen'),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

Center errorMethod(Object error) => Center(child: Text(error.toString()));
Center loadMethod() => const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Colors.blueAccent),
          SizedBox(height: 10),
          Text('Maglumatlar işlenýär !'),
          Text('Garaşmagyňyzy haýys edýäris !'),
        ],
      ),
    );

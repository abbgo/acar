import 'package:flutter/material.dart';

Center errorMethod(Object error) => Center(child: Text(error.toString()));
Center loadMethod() =>
    const Center(child: CircularProgressIndicator(color: Colors.blueAccent));

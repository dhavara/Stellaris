import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../models/models.dart';
import 'package:http/http.dart' as http;

class ListDate extends StatelessWidget {
  const ListDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Food")),
    );
  }
}

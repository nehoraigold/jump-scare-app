import 'package:flutter/material.dart';
import 'package:jump_scare_app/model/movie.dart';

class JumpScareTile extends StatefulWidget {
  final JumpScare jumpScare;

  JumpScareTile(this.jumpScare, {super.key});

  @override
  State<JumpScareTile> createState() => _JumpScareTileState();
}

class _JumpScareTileState extends State<JumpScareTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    String type = widget.jumpScare.type.name;
    String timestamp = widget.jumpScare.time.toString();
    timestamp = timestamp.substring(0, timestamp.length - 7);
    return ExpansionTile(
        title: Text("$timestamp ($type)"),
        onExpansionChanged: (value) => setState(() {
              _isExpanded = value;
            }),
        trailing: Icon(
          _isExpanded ? Icons.arrow_drop_up_sharp : Icons.arrow_drop_down_sharp,
        ),
        children: <Widget>[
          ListTile(
            title: Text(widget.jumpScare.description),
          )
        ]);
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:jump_scare_app/utils/utils.dart';
import 'package:jump_scare_app/app_state.dart';

class PlaybackComponent extends StatelessWidget {
  const PlaybackComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.displaySmall!
        .copyWith(fontFamily: 'E1234', color: theme.colorScheme.onPrimary);
    // final nextJumpScare = appState.nextJumpScare();

    return FractionallySizedBox(
        widthFactor: 0.9,
        child: IntrinsicWidth(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 300,
            decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(-3, 3), // changes position of shadow
                  ),
                ]),
            child: Row(children: [
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    durationToString(appState.currTime),
                    style: textStyle,
                  )),
              Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.yellow,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    onPressed: () => appState.toggle(),
                    color: theme.colorScheme.onPrimary,
                    highlightColor: ,
                    icon: Icon(
                        appState.isPlaying() ? Icons.pause : Icons.play_arrow),
                  ))
            ]),
          ),
        ])));
  }
}

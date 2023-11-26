import 'package:flutter/material.dart';
import 'package:hotkey_system/hotkey_system.dart';


class _VirtualKeyView extends StatelessWidget {
  const _VirtualKeyView({
    Key? key,
    required this.keyLabel,
  }) : super(key: key);

  final String keyLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(3),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0.0, 1.0),
          ),
        ],
      ),
      child: Text(
        keyLabel,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyMedium?.color,
          fontSize: 12,
        ),
      ),
    );
  }
}

class HotKeyVirtualView extends StatelessWidget {
  const HotKeyVirtualView({
    Key? key,
    required this.hotKey,
  }) : super(key: key);

  final HotKey hotKey;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        for (KeyModifier keyModifier in hotKey.modifiers ?? [])
          _VirtualKeyView(
            keyLabel: keyModifier.keyLabel,
          ),
        _VirtualKeyView(
          keyLabel: hotKey.keyCode.keyLabel,
        ),
      ],
    );
  }
}
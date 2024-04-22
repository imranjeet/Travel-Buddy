import 'package:flutter/material.dart';
import 'package:travel_buddy/utils/widgets/curved_edges.dart';

class CurvedEdgesWidget extends StatelessWidget {
  const CurvedEdgesWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: child
    );
  }
}
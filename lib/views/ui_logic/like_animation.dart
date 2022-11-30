import 'package:flutter/material.dart';

class LikeAnimation extends StatefulWidget {
  final Widget child;
  final bool isAnimated;
  final Duration duration;
  final VoidCallback? onEnd;
  final bool smallLikes;

  const LikeAnimation(
      {Key? key,
      required this.child,
      required this.isAnimated,
      this.duration = const Duration(milliseconds: 150),
      this.onEnd,
      this.smallLikes = false})
      : super(key: key);

  @override
  State<LikeAnimation> createState() => _LikeAnimationState();
}

class _LikeAnimationState extends State<LikeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration.inMilliseconds ~/ 2),
    );
    scale = Tween<double>(begin: 1, end: 1.2).animate(controller);
  }

  @override
  void didUpdateWidget(covariant LikeAnimation oldWidget) {
    startAnimation() async {
      if (widget.isAnimated || widget.smallLikes) {
        await controller.forward();
        await controller.reverse();
        await Future.delayed(
          const Duration(milliseconds: 200),
        );

        if (widget.onEnd != null) {
          widget.onEnd!();
        }
      }
    }

    super.didUpdateWidget(oldWidget);
    if (widget.isAnimated != oldWidget.isAnimated) {
      startAnimation();
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: widget.child,
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:math' as math;

class RotatingImageContainer extends StatefulWidget {
  const RotatingImageContainer({super.key});

  @override
  State<RotatingImageContainer> createState() => _RotatingImageContainerState();
}

class _RotatingImageContainerState extends State<RotatingImageContainer>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;

  late AnimationController _controller;

  void _toggleHover() {
    setState(() => isHovered = !isHovered);
  }

  bool showSparkles = false;
  void _triggerSparkles() {
    setState(() => showSparkles = true);
    _controller.forward(from: 0); // Restart the animation
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() => showSparkles = false);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        _toggleHover();
        _triggerSparkles();
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              transform: Matrix4.rotationZ(isHovered ? 0 : math.pi / 36),
              height: size.width * 0.24,
              width: size.width * 0.24,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/ffff-removebg-preview.png'),
                ),
                border: Border.all(color: Colors.blue, width: 1.2),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            if (showSparkles)
              Positioned.fill(
                child: CustomPaint(
                  painter: ParticlePainter(_controller),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ParticlePainter extends CustomPainter {
  final Animation<double> animation;
  final List<Offset> _particleOffsets = [];
  final List<Color> _colors = [
    Colors.yellowAccent,
    Colors.orange,
    Colors.white
  ];

  ParticlePainter(this.animation) : super(repaint: animation) {
    // Generate random particle offsets
    for (int i = 0; i < 30; i++) {
      _particleOffsets.add(Offset(
        math.Random().nextDouble() * 200 - 100,
        math.Random().nextDouble() * 200 - 100,
      ));
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double progress = animation.value;
    final Paint paint = Paint();
    for (int i = 0; i < _particleOffsets.length; i++) {
      paint.color = _colors[i % _colors.length].withOpacity(1 - progress);
      final Offset offset = Offset(size.width / 2, size.height / 2) +
          _particleOffsets[i] * progress;
      canvas.drawCircle(offset, 3 * (1 - progress), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class RotatingImageContainer1 extends StatefulWidget {
  final String imgPath; // Path to the image in assets
  const RotatingImageContainer1({
    super.key,
    required this.imgPath,
  });

  @override
  State<RotatingImageContainer1> createState() =>
      _RotatingImageContainer1State();
}

class _RotatingImageContainer1State extends State<RotatingImageContainer1> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        transform: Matrix4.rotationZ(isHovered ? 0 : math.pi / 36),
        height: size.width * 0.24,
        width: size.width * 0.24,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(widget.imgPath), // Use imgPath for the asset
          ),
          border: Border.all(color: Colors.blue, width: 1.2), // Use your color
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

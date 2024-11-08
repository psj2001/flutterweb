import 'package:flutter/material.dart';

class CountWidget extends StatefulWidget {
  final Size size;
  final String text1;
  final String text2;
  final String text3;

  const CountWidget({
    super.key,
    required this.size,
    required this.text2,
    required this.text3,
    required this.text1,
  });

  @override
  _CountWidgetState createState() => _CountWidgetState();
}

class _CountWidgetState extends State<CountWidget> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${widget.text1}",
            style: TextStyle(
              color: _isHovering
                  ? Colors.white.withOpacity(1.0)
                  : Colors.white.withOpacity(0.8),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: widget.size.width * 0.05,
              shadows: _isHovering
                  ? [
                      Shadow(
                          blurRadius: 10,
                          color: Colors.white,
                          offset: Offset(0, 0))
                    ]
                  : [],
            ),
          ),
          SizedBox(width: 10),
          Text(
            "${widget.text2}\n${widget.text3}",
            style: TextStyle(
              color: _isHovering
                  ? Colors.white.withOpacity(1.0)
                  : Colors.white.withOpacity(0.8),
              fontFamily: 'Poppins',
              shadows: _isHovering
                  ? [
                      Shadow(
                          blurRadius: 10,
                          color: Colors.white,
                          offset: Offset(0, 0))
                    ]
                  : [],
            ),
          ),
        ],
      ),
    );
  }
}

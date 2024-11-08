import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/constants/styles.dart';
import 'package:porfolio/screens/widgets/text_widet.dart';

class ProjectCard extends StatefulWidget {
  final String imagess;
  final String name;
  const ProjectCard({super.key, required this.imagess, required this.name});

  @override
  State<ProjectCard> createState() => _nameState();
}

class _nameState extends State<ProjectCard> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: Container(
        height: size.width * 0.10,
        width: size.width * 0.10,
        decoration: BoxDecoration(
            color: AppColors.ebony.withOpacity(0.8),
            borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Container(
              height: size.width * 3,
              color: Colors.white,
              margin: EdgeInsets.all(50),
              child: Image.asset(
                '${widget.imagess}',
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                margin: EdgeInsets.all(10),
                height: _isHovered ? size.height * 0.10 : 0,
                width: size.width,
                decoration: Styles.gradientDecoration,
                curve: Curves.linear,
                duration: Duration(milliseconds: 400),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Expanded(
                        child: Container(
                          child: TextWidget(
                            sSize: size,
                            text: "${widget.name}",
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onHover(bool isHover) {
    setState(() {
      _isHovered = isHover;
    });
  }
}

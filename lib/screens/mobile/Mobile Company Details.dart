import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/constants/styles.dart';
import 'package:porfolio/screens/tablet/tablet_layout_page.dart';
import 'package:porfolio/screens/widgets/CustomTabBar.dart';
import 'package:porfolio/screens/widgets/count_container_widget.dart';
import 'package:porfolio/screens/widgets/header_text_widget.dart';
import 'package:porfolio/screens/widgets/myservice_widgets.dart';
import 'package:porfolio/screens/widgets/rotating_image_widget.dart';

class MobileCompanyDetails extends StatefulWidget {
  final String head1;
  final String head2;
  final String head3;
  final String image;
  const MobileCompanyDetails(
      {super.key,
      required this.head1,
      required this.head2,
      required this.head3,
      required this.image});

  @override
  State<MobileCompanyDetails> createState() => _MobileCompanyDetailsState();
}

class _MobileCompanyDetailsState extends State<MobileCompanyDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  final GlobalKey _tabSectionKey =
      GlobalKey(); // Define a GlobalKey for the Tab section
  final GlobalKey _flutterExperienceKey =
      GlobalKey(); // Define a GlobalKey for Flutter experience section

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToSection(GlobalKey key) {
    RenderBox? sectionBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    if (sectionBox != null) {
      double yPosition =
          sectionBox.localToGlobal(Offset.zero, ancestor: null).dy;
      _scrollController.animateTo(
        yPosition + _scrollController.offset,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Styles.gradientDecoration,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.18),
            child: Column(
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RotatingImageContainer1(
                        imgPath: '${widget.image}',
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.width * 0.09,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            HeaderTextWidget1(
                              size: size,
                              head1: '${widget.head1}',
                              head2: '${widget.head2}',
                              head3: '${widget.head3}',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

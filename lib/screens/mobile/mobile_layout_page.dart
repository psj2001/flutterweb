import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/constants/styles.dart';
import 'package:porfolio/screens/mobile/Mobile%20Company%20Details.dart';
import 'package:porfolio/screens/tablet/tablet_layout_page.dart';
import 'package:porfolio/screens/widgets/CustomTabBar.dart';
import 'package:porfolio/screens/widgets/count_container_widget.dart';
import 'package:porfolio/screens/widgets/header_text_widget.dart';
import 'package:porfolio/screens/widgets/myservice_widgets.dart';
import 'package:porfolio/screens/widgets/rotating_image_widget.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  final GlobalKey _tabSectionKey = GlobalKey(); // GlobalKey for Tab section
  final GlobalKey _flutterExperienceKey =
      GlobalKey(); // GlobalKey for Flutter experience section
  final GlobalKey _myServicesKey =
      GlobalKey(); // GlobalKey for MyServicesWidget section

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

  // Scroll to the section defined by the GlobalKey
  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
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
          controller: _scrollController,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.18),
            child: Column(
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [RotatingImageContainer()],
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
                            HeaderTextWidget(
                              size: size,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Social_Tab(size: size)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: size.width * 0.09,
                ),
                Container(
                  width: size.width,
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return MobileCompanyDetails(
                                head1:
                                    'Flutter Developer\n Aug-2023 to Oct 2024',
                                head2: 'Globosoft',
                                head3:
                                    'As a Flutter Developer at Globosoft, I played a key role in designing and developing innovative mobile applications for Android and iOS platforms. Collaborating closely with UI/UX designers, I transformed designs into intuitive, responsive user interfaces. I worked with backend developers to integrate RESTful APIs, ensuring dynamic, real-time content delivery. My expertise in debugging and performance optimization led to significant improvements in app responsiveness and reduced load times by 25%. In an Agile environment, I contributed to daily stand-ups, sprint planning, and code reviews, ensuring consistent coding standards. By leveraging CI/CD pipelines, I streamlined app deployment and updates. My ability to resolve user-reported issues quickly enhanced app user ratings by 15%. This experience deepened my knowledge in state management using GetX, and API integration while solidifying my reputation as a proactive problem-solver in app development',
                                image: 'assets/images/globosoft-n.jpg',
                              );
                            },
                          ));
                        },
                        child: CountWidget(
                          size: size,
                          text1: "1+",
                          text2: "Years of",
                          text3: "Work Experience",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: AppColors.paleSlate,
                        indent: size.width * 0.05,
                        endIndent: size.width * 0.05,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Scroll to the Tab section when tapped
                          scrollToSection(_tabSectionKey);
                        },
                        child: CountWidget(
                          size: size,
                          text1: "10+",
                          text2: "Projects",
                          text3: "Completed",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: AppColors.paleSlate,
                        indent: size.width * 0.05,
                        endIndent: size.width * 0.05,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Scroll to the MyServicesWidget section when tapped
                          scrollToSection(_myServicesKey);
                        },
                        child: CountWidget(
                          size: size,
                          text1: "2",
                          text2: "Years of",
                          text3: "Flutter Experience",
                        ),
                      ),
                      Divider(
                        color: AppColors.paleSlate,
                        indent: size.width * 0.05,
                        endIndent: size.width * 0.05,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CountWidget(
                        size: size,
                        text1: "3",
                        text2: "Live",
                        text3: "Projects",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.width * 0.09,
                ),
                Container(
                  key: _myServicesKey, // Assign the GlobalKey to this container
                  color: AppColors.ebony,
                  padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
                  child: MyServicesWidget2(size: size),
                ),
                Container(
                  key: _tabSectionKey, // Assign the GlobalKey to this container
                  width: size.width,
                  padding: EdgeInsets.symmetric(
                    vertical: size.width * 0.05,
                  ),
                  child: Column(
                    children: [
                      GradientTextWidget(
                        size: size,
                        text1: 'My Recent Works',
                      ),
                      SizedBox(height: size.height * 0.06),
                      CustomTabBar(
                        tabController: _tabController,
                      )
                    ],
                  ),
                ),
                // TAB
                Container(
                  height: size.height,
                  child: CustomTAbBarView(
                    tabController: _tabController,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

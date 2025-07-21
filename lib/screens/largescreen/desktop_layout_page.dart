import 'package:flutter/material.dart';
import 'package:porfolio/Projects.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/constants/project%20card%20.dart';
import 'package:porfolio/constants/styles.dart';
import 'package:porfolio/screens/largescreen/Company%20Details.dart';
import 'package:porfolio/screens/widgets/CustomTabBar.dart';
import 'package:porfolio/screens/widgets/count_container_widget.dart';
import 'package:porfolio/screens/widgets/header_text_widget.dart';
import 'package:porfolio/screens/widgets/myservice_widgets.dart';
import 'package:porfolio/screens/widgets/rotating_image_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout>
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

  bool isFlutterExperienceVisible = false; // Track visibility
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
          controller: _scrollController,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: size.height * 0.18),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HeaderTextWidget(
                          size: size,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Social_large(size: size),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [RotatingImageContainer()],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return CompanyDetails(
                              head1: 'Flutter Developer\n Aug-2023 to Oct 2024',
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
                        text1: "3+",
                        text2: "Years of",
                        text3: "Work Experience",
                      ),
                    ),
                    GestureDetector(
                      onTap: () => scrollToSection(
                          _tabSectionKey), // Scroll to Recent Works section
                      child: CountWidget(
                        size: size,
                        text1: "11+",
                        text2: "Work Projects",
                        text3: "Completed",
                      ),
                    ),
                    GestureDetector(
                      onTap: () => scrollToSection(
                          _flutterExperienceKey), // Scroll to Flutter Experience section
                      child: CountWidget(
                        size: size,
                        text1: "4+",
                        text2: "Years of",
                        text3: "Flutter Experience",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        scrollToSection(
                            _tabSectionKey); // Scroll to the tab section
                        _tabController.animateTo(1);
                      },
                      child: CountWidget(
                        size: size,
                        text1: "5",
                        text2: "Live",
                        text3: "Projects",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.12,
              ),
              // Flutter experience container.
              Container(
                key:
                    _flutterExperienceKey, // Assign the GlobalKey to this container
                color: AppColors.ebony,
                padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
                child: Column(
                  children: [
                    GradientText(
                      "My Flutter Experience",
                      colors: [
                        AppColors.studio,
                        AppColors.paleSlate,
                      ],
                      style: TextStyle(
                          fontSize: size.width * 0.030,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    MyServicesWidget(size: size),
                  ],
                ),
              ),
              // My Recent Works
              Container(
                color: AppColors.ebony,
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
                    // CustomTabBar(
                    //   tabController: _tabController,
                    // )
                    Wrap(
                      spacing: size.width *
                          0.02, // Adjust horizontal spacing as needed
                      runSpacing: size.height *
                          0.02, // Adjust vertical spacing as needed ,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProjectCardWidget(
                            image: 'assets/images/proptelli.png',
                            size: size,
                            androidLink:
                                'https://play.google.com/store/apps/details?id=com.proptelli.app&hl=en-US',
                            iosLink:
                                'https://apps.apple.com/us/app/proptelli/id6744108975',
                            subtitle:
                                'PropTelli is a platform for partners to earn by referring Dubai property leads.',
                            title: 'PropTelli',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProjectCardWidget(
                            image: 'assets/images/file.png',
                            size: size,
                            androidLink:
                                'https://play.google.com/store/apps/details?id=com.choose_n_fly',
                            iosLink:
                                'https://apps.apple.com/ae/app/choosenfly/id6476144503',
                            subtitle:
                                'Choosenfly is an app that is build for the purpose f noddjss jhjhas in this appa ',
                            title: 'Choose N Fly',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProjectCardWidget(
                            androidLink:
                                'https://play.google.com/store/search?q=malankara&c=apps&hl=en',
                            iosLink:
                                'https://apps.apple.com/mx/app/malankara/id6661021463?uo=2',
                            image: 'assets/images/M.png',
                            size: size,
                            subtitle:
                                'Malankara is an devotional app that includes prayers church prayer timing audio songs',
                            title: 'Malankara',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProjectCardWidget(
                            androidLink:
                                'https://play.google.com/store/apps/details?id=com.globosoft.choosemyfresh&hl=en-US&pli=1',
                            iosLink:
                                'https://apps.apple.com/in/app/choose-my-fresh/id1566818223',
                            image: 'assets/images/choosemyfresh.png',
                            size: size,
                            subtitle:
                                'Choosemyfresh is a online vegitables/fruits buying app ',
                            title: 'Choose My Fresh',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProjectCardWidget(
                            image: 'assets/images/Sanskey.png',
                            size: size,
                            subtitle:
                                'Sanskey is a crm wich assign task login logout ',
                            title: 'Sanskey',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProjectCardWidget(
                            image: 'assets/images/caspian.png',
                            size: size,
                            subtitle:
                                'Caspian is a crm app that include punchin/punchout ,leave application ,reambursement,salary slip ',
                            title: 'Caspian',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProjectCardWidget(
                            image:
                                'assets/images/Screenshot 2024-11-07 154430.png',
                            size: size,
                            subtitle:
                                'Myfitbuddy is an app based on gym products including trainer subscription reminder planner',
                            title: 'MyfitBuddy',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProjectCardWidget(
                            image: 'assets/images/landbank.png',
                            size: size,
                            subtitle:
                                'This app is for the users to sell their plots',
                            title: 'Land Bank Customer',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProjectCardWidget(
                            size: size,
                            image: 'assets/images/landbank.png',
                            subtitle:
                                'This app is for admin to assign agents also to publish plot to investors',
                            title: 'Land Bank Admin',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProjectCardWidget(
                            androidLink:
                                'https://play.google.com/store/apps/details?id=com.pazheriagentapp&hl=en-US',
                            iosLink: '',
                            image: 'assets/images/landbank.png',
                            size: size,
                            subtitle:
                                'This app is for the Agents to verify plot that assign by the admin',
                            title: 'Land Bank Agent',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProjectCardWidget(
                            image: 'assets/images/landbank.png',
                            size: size,
                            subtitle:
                                'This app is for the investors to buy plot investors can make intrest on plot through this app',
                            title: 'Land Bank Investor',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // TAB
              // Container(
              //   height: size.height,
              //   child: CustomTAbBarView(
              //     tabController: _tabController,
              //   ),
              // ),
              SizedBox(
                height: size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

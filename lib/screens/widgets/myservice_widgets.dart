import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/screens/largescreen/Company%20Details.dart';
import 'package:porfolio/screens/mobile/Mobile%20Company%20Details.dart';
import 'package:porfolio/screens/widgets/text_widet.dart';

class MyServicesWidget extends StatefulWidget {
  final Size size;
  const MyServicesWidget({super.key, required this.size});

  @override
  State<MyServicesWidget> createState() => _MyServicesWidgetState();
}

class _MyServicesWidgetState extends State<MyServicesWidget> {
  List<String> imagePaths = [
    'assets/images/globosoft-n.jpg',
    'assets/images/luminar.jpg',
    'assets/images/th.jpg',
  ];
  List<String> CompanyPaths = [
    '      Globosoft         ',
    'Luminar Technolab ',
    '         amFoss            ',
  ];
  List<String> PostPath = [
    'Flutter Developer Aug 2023 - Oct 2024           ',
    'Flutter Developer Intern Mar 2023 - Jul 2024    ',
    'Flutter Developer Training Nov 2022 - Dec - 2022',
  ];
  List<String> PostPath2 = [
    'As a Flutter Developer at Globosoft, I played a key role in designing and developing innovative mobile applications for Android and iOS platforms. Collaborating closely with UI/UX designers, I transformed designs into intuitive, responsive user interfaces. I worked with backend developers to integrate RESTful APIs, ensuring dynamic, real-time content delivery. My expertise in debugging and performance optimization led to significant improvements in app responsiveness and reduced load times by 25%. In an Agile environment, I contributed to daily stand-ups, sprint planning, and code reviews, ensuring consistent coding standards. By leveraging CI/CD pipelines, I streamlined app deployment and updates. My ability to resolve user-reported issues quickly enhanced app user ratings by 15%. This experience deepened my knowledge in state management using GetX, and API integration while solidifying my reputation as a proactive problem-solver in app development',
    'During my intensive Five-month Flutter Development course, I mastered the Flutter framework and honed my Android and iOS app development skills. I demonstrated my ability to handle real-world development scenarios by securing a developer position after just three months of training. My learning focused on key areas like API integration, performance optimization, and state management, particularly with GetX. I developed multiple applications from scratch, applying principles of Clean Architecture and MVC design. This hands-on experience built a solid foundation in mobile app development, preparing me for the challenges of my role at Globosoft.',
    'Completed a week-long intensive Flutter development course with amFOSS, gaining hands-on experience in building cross-platform applications.mproved skills in Flutter, Dart, and UI/UX design through active participation in course discussions and projects.',
  ];
  List<bool> _isHovered = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return CompanyDetails(
                    head1: PostPath[index],
                    head2: CompanyPaths[index],
                    head3: PostPath2[index],
                    image: imagePaths[index],
                  );
                },
              ));
            },
            child: MouseRegion(
              onEnter: (_) => setState(() => _isHovered[index] = true),
              onExit: (_) => setState(() => _isHovered[index] = false),
              child: AnimatedContainer(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  duration: Duration(microseconds: 300),
                  curve: Curves.easeInOut,
                  margin: EdgeInsets.symmetric(
                      horizontal: widget.size.width * 0.05),
                  width: widget.size.width,
                  decoration: BoxDecoration(
                    color: _isHovered[index] ? null : Colors.transparent,
                    border: Border.all(
                      color: _isHovered[index]
                          ? AppColors.studio.withOpacity(0.5)
                          : Colors.transparent,
                    ),
                    gradient: _isHovered[index]
                        ? LinearGradient(colors: [
                            AppColors.studio,
                            AppColors.ebony,
                          ])
                        : null,
                  ),
                  child: widget.size.width > 600
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                imagePaths[index],
                              ),
                            ),
                            SizedBox(
                              width: widget.size.height * 0.04,
                            ),
                            TextWidget(
                              sSize: widget.size,
                              text: CompanyPaths[index],
                              size: 22,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: widget.size.height * 0.08,
                            ),
                            Flexible(
                                child: TextWidget(
                              sSize: widget.size,
                              text: PostPath[index],
                              size: 16,
                              color: Colors.white,
                            )),
                            FaIcon(
                              _isHovered[index]
                                  ? FontAwesomeIcons.arrowTrendUp
                                  : FontAwesomeIcons.arrowTrendDown,
                              color: _isHovered[index]
                                  ? Colors.white
                                  : AppColors.studio,
                            )
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                imagePaths[index],
                              ),
                            ),
                            SizedBox(
                              width: widget.size.height * 0.04,
                            ),
                            TextWidget(
                              sSize: widget.size,
                              text: CompanyPaths[index],
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: widget.size.height * 0.08,
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              children: [
                                TextWidget(
                                  alignment: TextAlign.center,
                                  sSize: widget.size,
                                  text: PostPath[index],
                                  size: 16,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ],
                        )),
            ),
          );
        });
  }
}

class MyServicesWidget2 extends StatefulWidget {
  final Size size;
  const MyServicesWidget2({super.key, required this.size});

  @override
  State<MyServicesWidget2> createState() => _MyServicesWidget2State();
}

class _MyServicesWidget2State extends State<MyServicesWidget2> {
  List<String> imagePaths = [
    'assets/images/globosoft-n.jpg',
    'assets/images/luminar.jpg',
    'assets/images/th.jpg',
  ];
  List<String> companyPaths = [
    'Globosoft',
    'Luminar Technolab',
    'amFoss',
  ];
  List<String> ppostPaths = [
    'Flutter Developer \nAug 2023 - Oct 2024',
    'Flutter Developer \nIntern Mar 2023 - Jul 2024',
    'Flutter Developer \nTraining Nov 2022 - Dec 2022',
  ];
  List<String> postPaths = [
    'Flutter Developer Aug 2023 - Oct 2024',
    'Flutter Developer Intern Mar 2023 - Jul 2024',
    'Flutter Developer Training Nov 2022 - Dec 2022',
  ];
  List<String> postDescriptions = [
    'As a Flutter Developer at Globosoft, I played a key role in designing and developing innovative mobile applications for Android and iOS platforms. Collaborating closely with UI/UX designers, I transformed designs into intuitive, responsive user interfaces. I worked with backend developers to integrate RESTful APIs, ensuring dynamic, real-time content delivery. My expertise in debugging and performance optimization led to significant improvements in app responsiveness and reduced load times by 25%. In an Agile environment, I contributed to daily stand-ups, sprint planning, and code reviews, ensuring consistent coding standards. By leveraging CI/CD pipelines, I streamlined app deployment and updates. My ability to resolve user-reported issues quickly enhanced app user ratings by 15%. This experience deepened my knowledge in state management using GetX, and API integration while solidifying my reputation as a proactive problem-solver in app development',
    'During my intensive Five-month Flutter Development course, I mastered the Flutter framework and honed my Android and iOS app development skills. I demonstrated my ability to handle real-world development scenarios by securing a developer position after just three months of training. My learning focused on key areas like API integration, performance optimization, and state management, particularly with GetX. I developed multiple applications from scratch, applying principles of Clean Architecture and MVC design. This hands-on experience built a solid foundation in mobile app development, preparing me for the challenges of my role at Globosoft.',
    'Completed a week-long intensive Flutter development course with amFOSS, gaining hands-on experience in building cross-platform applications.mproved skills in Flutter, Dart, and UI/UX design through active participation in course discussions and projects.',
  ];
  List<bool> _isHovered = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Add navigation or action here
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return MobileCompanyDetails(
                  head1: ppostPaths[index],
                  head2: '${companyPaths[index]}',
                  head3:
                      'As a Flutter Developer at Globosoft, I played a key role in designing and developing innovative mobile applications for Android and iOS platforms. Collaborating closely with UI/UX designers, I transformed designs into intuitive, responsive user interfaces. I worked with backend developers to integrate RESTful APIs, ensuring dynamic, real-time content delivery. My expertise in debugging and performance optimization led to significant improvements in app responsiveness and reduced load times by 25%. In an Agile environment, I contributed to daily stand-ups, sprint planning, and code reviews, ensuring consistent coding standards. By leveraging CI/CD pipelines, I streamlined app deployment and updates. My ability to resolve user-reported issues quickly enhanced app user ratings by 15%. This experience deepened my knowledge in state management using GetX, and API integration while solidifying my reputation as a proactive problem-solver in app development',
                  image: '${imagePaths[index]}',
                );
              },
            ));
          },
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered[index] = true),
            onExit: (_) => setState(() => _isHovered[index] = false),
            child: AnimatedContainer(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              duration: Duration(milliseconds: 300), // Corrected duration
              curve: Curves.easeInOut,
              margin:
                  EdgeInsets.symmetric(horizontal: widget.size.width * 0.05),
              width: widget.size.width,
              decoration: BoxDecoration(
                color: _isHovered[index] ? null : Colors.transparent,
                border: Border.all(
                  color: _isHovered[index]
                      ? AppColors.studio.withOpacity(0.5)
                      : Colors.transparent,
                ),
                gradient: _isHovered[index]
                    ? LinearGradient(colors: [
                        AppColors.studio,
                        AppColors.ebony,
                      ])
                    : null,
              ),
              child: widget.size.width > 600
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(imagePaths[index]),
                        ),
                        SizedBox(width: widget.size.height * 0.04),
                        TextWidget(
                          sSize: widget.size,
                          text: companyPaths[index],
                          size: 22,
                          color: Colors.white,
                        ),
                        SizedBox(width: widget.size.height * 0.08),
                        Flexible(
                          child: TextWidget(
                            sSize: widget.size,
                            text: postPaths[index],
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                        FaIcon(
                          _isHovered[index]
                              ? FontAwesomeIcons.arrowTrendUp
                              : FontAwesomeIcons.arrowTrendDown,
                          color: _isHovered[index]
                              ? Colors.white
                              : AppColors.studio,
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(imagePaths[index]),
                        ),
                        SizedBox(width: widget.size.height * 0.04),
                        TextWidget(
                          sSize: widget.size,
                          text: companyPaths[index],
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(width: widget.size.height * 0.08),
                        Wrap(
                          children: [
                            TextWidget(
                              alignment: TextAlign.center,
                              sSize: widget.size,
                              text: postPaths[index],
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}

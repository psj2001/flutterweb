import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    'assets/images/technologies.jpg',
    'assets/images/casakeyrealestate.jpg',
    'assets/images/globosoft-n.jpg',
    'assets/images/luminar.jpg',
    'assets/images/slr.png',
  ];
  List<String> CompanyPaths = [
    'Technologies',
    'Casa Key Real Estate',
    'Globosoft',
    'Luminar Technolab',
    'SLR Shoppee',
  ];
  List<String> PostPath = [
    'Flutter Developer Oct 2025 - Present',
    'Flutter Developer Oct 2024 - Oct 2025',
    'Flutter Developer Aug 2023 - Oct 2024',
    'Flutter Developer Intern Mar 2023 - Jul 2024',
    'Freelance Flutter Developer  Apr 2022 - Oct 2022',
  ];
  List<String> PostPath2 = [
    'As a Flutter Developer at Technologies, I am engaged in building cutting-edge mobile applications that leverage the latest advancements in Flutter to deliver exceptional user experiences across multiple platforms. My role involves collaborating with cross-functional teams to design, develop, and deploy high-quality apps that meet client requirements and industry standards.',
    ' At CasaKey Real Estate LLC, I contributed to the development of PropTelli, a Flutter-based mobile app that allows global Channel Partners to register, add and manage real estate leads, track deal progress and commissions, and collaborate with CasaKey\'s Dubai-based sales team - empowering international agents to connect clients with Dubai\'s property market and earn commissions through a seamless, tech-driven platform.',
    'As a Flutter Developer at Globosoft, I played a key role in designing and developing innovative mobile applications...',
    'During my intensive Five-month Flutter Development course, I mastered the Flutter framework...',
    'As a Flutter Developer my career start from here as a Freelance Flutter Developer',
  ];

  List<bool> _isHovered = [];

  @override
  void initState() {
    super.initState();
    _isHovered = List.generate(imagePaths.length, (_) => false);
  }

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                duration: const Duration(milliseconds: 300),
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
                            text: CompanyPaths[index],
                            size: 22,
                            color: Colors.white,
                          ),
                          SizedBox(width: widget.size.height * 0.08),
                          Flexible(
                            child: TextWidget(
                              sSize: widget.size,
                              text: PostPath[index],
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
                          )
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
                            text: CompanyPaths[index],
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(width: widget.size.height * 0.08),
                          Wrap(
                            children: [
                              TextWidget(
                                alignment: TextAlign.center,
                                sSize: widget.size,
                                text: PostPath[index],
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
    'assets/images/technologies.jpg',
    'assets/images/casakeyrealestate.jpg',
    'assets/images/globosoft-n.jpg',
    'assets/images/luminar.jpg',
    'assets/images/slr.png',
  ];
  List<String> companyPaths = [
    'Technologies',
    'Casa Key Real Estate',
    'Globosoft',
    'Luminar Technolab',
    'SLR Shoppee',
  ];
  List<String> ppostPaths = [
    'Flutter Developer \n Oct 2025 - Present',
    'Flutter Developer \n Oct 2024 - Oct 2025',
    'Flutter Developer \n Aug 2023 - Oct 2024',
    'Flutter Intern    \n Mar 2023 - Jul 2024',
     'Freelance Flutter Developer  Apr 2022 - Oct 2022',
  ];
  List<String> postPaths = [
    'Flutter Developer Oct 2025 - Present',
    'Flutter Developer Oct 2024 - Oct 2025',
    'Flutter Developer Aug 2023 - Oct 2024',
    'Flutter Developer Intern Mar 2023 - Jul 2024',
    'Freelance Flutter Developer  Apr 2022 - Oct 2022',
  ];
  List<String> postDescriptions = [
    'As a Flutter Developer at Technologies, I am engaged in building cutting-edge mobile applications that leverage the latest advancements in Flutter to deliver exceptional user experiences across multiple platforms. My role involves collaborating with cross-functional teams to design, develop, and deploy high-quality apps that meet client requirements and industry standards.',
    ' At CasaKey Real Estate LLC, I contributed to the development of PropTelli, a Flutter-based mobile app that allows global Channel Partners to register, add and manage real estate leads, track deal progress and commissions, and collaborate with CasaKey\'s Dubai-based sales team - empowering international agents to connect clients with Dubai\'s property market and earn commissions through a seamless, tech-driven platform.',
    'As a Flutter Developer at Globosoft, I played a key role in designing and developing innovative mobile applications...',
    'During my intensive Five-month Flutter Development course, I mastered the Flutter framework...',
    'As a Flutter Developer my career start from here as a Freelance Flutter Developer',
  ];

  List<bool> _isHovered = [];

  @override
  void initState() {
    super.initState();
    _isHovered = List.generate(imagePaths.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return MobileCompanyDetails(
                  head1: ppostPaths[index],
                  head2: companyPaths[index],
                  head3: postDescriptions[index],
                  image: imagePaths[index],
                );
              },
            ));
          },
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered[index] = true),
            onExit: (_) => setState(() => _isHovered[index] = false),
            child: AnimatedContainer(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              duration: const Duration(milliseconds: 300),
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

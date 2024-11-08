import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/screens/widgets/ProjectCard.dart';
import 'package:porfolio/screens/widgets/text_widet.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  CustomTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isMobile = size.width < 600; // Adjust breakpoint as needed

    return Container(
      width: isMobile
          ? size.width * 0.8
          : size.width * 0.36, // Adjust width based on device
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
        ),
        color: AppColors.ebony,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TabBar(
        controller: tabController,
        dividerColor: Colors.transparent,
        tabs: [
          Tab(
            text: 'All Projects',
          ),
          Tab(
            text: 'Live Projects',
          ),
          // Tab(
          //   text: 'Hobby Projects',
          // ),
        ],
        indicator: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(20),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: TextStyle(
          fontSize: isMobile ? 12 : 16, // Smaller font size for mobile
          fontWeight: FontWeight.bold,
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        labelPadding: EdgeInsets.symmetric(
            horizontal: isMobile ? 10.0 : 20.0), // Reduced padding for mobile
      ),
    );
  }
}

class CustomTAbBarView extends StatelessWidget {
  final TabController tabController;

  CustomTAbBarView({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return TabBarView(
      controller: tabController,
      children: [
        AllProjects(
          size: size,
        ),
        LiveProjects(
          size: size,
        ),
        AllProjects(
          size: size,
        ),
      ],
    );
  }
}

class AllProjects extends StatelessWidget {
  final Size size;
  const AllProjects({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      //    decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.10),
      child: Center(
        child: GridView(
            //physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3 / 3),
            children: [
              ProjectCard(
                imagess: 'assets/images/file.png',
                name: 'Choose n fly',
              ),
              ProjectCard(
                imagess: 'assets/images/download.jpeg',
                name: 'My FitBuddy',
              ),
              ProjectCard(
                imagess: 'assets/images/Caspian.png',
                name: 'Caspian',
              ),
              ProjectCard(
                imagess: 'assets/images/landbank.png',
                name: 'Land Bank Customer',
              ),
              ProjectCard(
                imagess: 'assets/images/landbank.png',
                name: 'Land Bank Admin',
              ),
              ProjectCard(
                imagess: 'assets/images/landbank.png',
                name: 'Land Bank Agent',
              ),
              ProjectCard(
                imagess: 'assets/images/landbank.png',
                name: 'Land Bank Investor',
              ),
              ProjectCard(
                imagess: 'assets/images/M.png',
                name: 'Malankkara',
              ),
              ProjectCard(
                imagess: 'assets/images/choosemyfresh.png',
                name: 'Choose My Fresh',
              ),
              ProjectCard(
                imagess: 'assets/images/Sanskey.png',
                name: 'Sanskey',
              ),

              // ProjectCard(),
              // ProjectCard(),
              // ProjectCard(),
            ]),
      ),
    );
  }
}

class LiveProjects extends StatelessWidget {
  final Size size;
  const LiveProjects({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      //    decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.10),
      child: Center(
        child: GridView(
            //physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3 / 3),
            children: [
              GestureDetector(
                onTap: () {},
                child: ProjectCard(
                  imagess: 'assets/images/file.png',
                  name: 'Choose n fly',
                ),
              ),

              GestureDetector(
                onTap: () {},
                child: ProjectCard(
                  imagess: 'assets/images/M.png',
                  name: 'Malankkara',
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: ProjectCard(
                  imagess: 'assets/images/choosemyfresh.png',
                  name: 'Choose My Fresh',
                ),
              ),

              // ProjectCard(),
              // ProjectCard(),
              // ProjectCard(),
            ]),
      ),
    );
  }
}

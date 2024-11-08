import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:porfolio/constants/colors.dart';
import 'dart:js' as js;

import 'package:porfolio/constants/styles.dart';

class ProjectCardWidget extends StatelessWidget {
  final String title;
  final String image;
  final String subtitle;
  final String? iosLink;
  final String? androidLink;
  final Size size;

  ProjectCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.iosLink,
    this.androidLink,
    required this.size,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 290,
      width: 260, //decoration: Styles.gradientDecoration,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 38, 29, 61),
                blurRadius: 15,
                offset: Offset(-2, 5))
          ],
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppColors.ebony,
                AppColors.studio,
              ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Project image
          Image.asset(
            image,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            height: 140,
            width: 260,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 8),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          // Subtitle
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
          Spacer(),
          // Footer with links
          if (androidLink != null || iosLink != null)
            Container(
              color: Colors.transparent,
              //  decoration: Styles2.gradientDecoration,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Available on:',
                    style: TextStyle(color: Colors.amber, fontSize: 10),
                  ),
                  Spacer(),
                  if (iosLink != null)
                    InkWell(
                      onTap: () {
                        js.context.callMethod('open', [androidLink]);
                      },
                      child: FaIcon(
                        FontAwesomeIcons.android,
                        color: Colors.green,
                        size: 15,
                      ),
                    ),
                  if (androidLink != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: InkWell(
                        onTap: () {
                          js.context.callMethod('open', [iosLink]);
                        },
                        child: FaIcon(
                          FontAwesomeIcons.appStoreIos,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

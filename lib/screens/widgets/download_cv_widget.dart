import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:html' as html;
import 'package:flutter/foundation.dart' show kIsWeb;

class DownloadCVButton extends StatefulWidget {
  const DownloadCVButton({super.key});

  @override
  _DownloadCVButtonState createState() => _DownloadCVButtonState();
}

class _DownloadCVButtonState extends State<DownloadCVButton> {
  bool _isHovered = false;

  Future<void> _downloadCV() async {
    if (kIsWeb) {
      // Web-specific download logic
      const String assetPath = 'assets/PRANAV P S CV ORGS.pdf';

      // Step 1: Load the file from assets
      final byteData = await rootBundle.load(assetPath);
      final bytes = byteData.buffer.asUint8List();

      // Step 2: Create a Blob and trigger the download
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);

      final anchor = html.AnchorElement(href: url)
        ..setAttribute('download', 'PRANAV_P_S_CV.pdf') // Set download filename
        ..click(); // Trigger the download

      // Clean up
      html.Url.revokeObjectUrl(url);
      print('Download started');
    } else {
      // Handle non-web platforms here (mobile, desktop, etc.)
      print('Download logic for non-web platforms can go here.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click, // Set cursor to pointer
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: () async {
          await _downloadCV();
        },
        child: Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _isHovered
                  ? AppColors.paleSlate.withOpacity(0.8)
                  : AppColors.paleSlate,
              width: 2,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Download CV",
                style: TextStyle(
                  color: _isHovered
                      ? AppColors.paleSlate.withOpacity(0.8)
                      : AppColors.paleSlate,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox.square(
                dimension: 12,
              ),
              FaIcon(
                FontAwesomeIcons.download,
                color: _isHovered ? Colors.green : AppColors.paleSlate,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

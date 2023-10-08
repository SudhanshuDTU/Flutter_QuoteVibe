import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DeveloperProfile extends StatefulWidget {
  const DeveloperProfile({super.key});

  @override
  State<DeveloperProfile> createState() => _DeveloperProfileState();
}

class _DeveloperProfileState extends State<DeveloperProfile> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.red,
            )),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: height * 0.3,
                child: CircleAvatar(
                  radius: width * 0.3,
                  child: Image.network(
                    "https://i.ibb.co/z7BQpFn/IMG-6561-cleanup-removebg-preview-fotor-2023100810420.png",
                  ),
                ),
              ),
            ),
            Text(
              "Sudhanshu Jha",
              style: GoogleFonts.titilliumWeb(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.05),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Text(
              "Connect With Me",
              style: GoogleFonts.tienne(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.03),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: Platform.isAndroid ? height * 0.05 : width * 0.05,
                  child: InkWell(
                    child: Image.network(
                        "https://pbs.twimg.com/profile_images/1661161645857710081/6WtDIesg_400x400.png"),
                    onTap: () async {
                      const url = 'https://www.linkedin.com/in/sudhanshu-dtu/';
                      if (await canLaunchUrlString(url)) {
                        await launch(url,
                            forceWebView: true, enableJavaScript: true);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: Platform.isAndroid ? height * 0.05 : width * 0.05,
                  child: InkWell(
                    child: Image.network(
                        "https://play-lh.googleusercontent.com/VRMWkE5p3CkWhJs6nv-9ZsLAs1QOg5ob1_3qg-rckwYW7yp1fMrYZqnEFpk0IoVP4LM=w240-h480-rw"),
                    onTap: () async {
                      const url = 'https://www.instagram.com/sudhanshu_1902/';
                      if (await canLaunchUrlString(url)) {
                        await launch(url,
                            forceWebView: true, enableJavaScript: true);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: Platform.isAndroid ? height * 0.05 : width * 0.05,
                  child: InkWell(
                    child: Image.network(
                        "https://play-lh.googleusercontent.com/PCpXdqvUWfCW1mXhH1Y_98yBpgsWxuTSTofy3NGMo9yBTATDyzVkqU580bfSln50bFU"),
                    onTap: () async {
                      const url = 'https://github.com/SudhanshuDTU';
                      if (await canLaunchUrlString(url)) {
                        await launch(url,
                            forceWebView: true, enableJavaScript: true);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

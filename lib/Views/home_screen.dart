import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotevibe/Views/developer_profile.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("quotes").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData && snapshot.data != null) {
                return PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> quote = snapshot.data!.docs[index]
                          .data() as Map<String, dynamic>;
                      return Container(
                        color: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.07, horizontal: width * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/icon.png",
                              height: height * 0.1,
                              color: Colors.black,
                            ),
                            Flexible(
                              child: Center(
                                child: Text(
                                  quote["title"],
                                  style: GoogleFonts.caveat(
                                      fontWeight: FontWeight.bold,
                                      fontSize: height * 0.04),
                                ),
                              ),
                            ),
                            Text(
                              "⎯⎯  ${quote["author"]}",
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FloatingActionButton(
                                  shape: const CircleBorder(),
                                  backgroundColor:
                                      const Color.fromARGB(255, 232, 127, 162),
                                  onPressed: () async {
                                    await Share.share('"${quote["title"]}"');
                                  },
                                  elevation: 50,
                                  child: const Icon(Icons.share),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                  ),
                                  onPressed: () async {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              const DeveloperProfile(),
                                        ));
                                  },
                                  child: const Text(
                                    "About Developer",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ),
                          ],
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: Text(
                    "No Quote For Today ..",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.redAccent,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

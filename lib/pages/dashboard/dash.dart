import 'package:evote/component/app_text.dart';
import 'package:evote/component/inputs/app_sized_box.dart';
import 'package:evote/component/inputs/app_text_field.dart';
import 'package:evote/component/others/candidate_panel.dart';
import 'package:evote/component/others/news_panel.dart';
import 'package:evote/styles/colors.dart';
import 'package:evote/styles/text_styles.dart';
import 'package:evote/utils/extensions.dart';
import 'package:evote/values/json.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    return Scaffold(
      body: EvoteSizedBox(
        height: 100,
        width: 100,
        child: Column(
          children: [
            const EvoteSizedBox(
              height: 2.5,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "images/navbar.png",
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Column(
                  children: [
                    const EvoteSizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 12.0,
                        ),
                        child: Icon(
                          Icons.notification_important,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const EvoteSizedBox(
                      height: 2.5,
                    ),
                    EvoteText(
                      "Countdown to general elections",
                      style: EvoteTextStyle.medium.copyWith(
                        color: EvoteColors.white,
                      ),
                    ),
                    const EvoteSizedBox(
                      height: 2.5,
                    ),
                    Center(
                      child: RichText(
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.end,
                        // textDirection: TextDirection.rtl,
                        softWrap: true,
                        maxLines: 1,
                        textScaleFactor: 1,
                        text: TextSpan(
                          text: '12 ',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 34,
                            color: Colors.white,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'days',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 19,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: ' : ',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 19,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: '10 ',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 34,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: 'hrs',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 19,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: ' : ',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 19,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: '42 ',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 34,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: 'mins',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 19,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TabBar(
              controller: _controller,
              labelColor: EvoteColors.greenDark,
              indicatorColor: EvoteColors.greenDark,
              tabs: [
                Tab(
                  text: "NEWS",
                ),
                Tab(
                  text: "Candidates",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  SingleChildScrollView(
                    child: Container(
                      child: Padding(
                        padding: scaler.insets.all(8.0),
                        child: Column(
                          children: [
                            EvoteSizedBox(
                              height: 0.5,
                            ),
                            ...List.generate(5, (index) {
                              return NewsPanel(
                                newsData[index]["image"]!,
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      child: Padding(
                        padding: scaler.insets.all(8.0),
                        child: Column(
                          children: [
                            EvoteTextField(
                              hintText: "Search",
                            ),
                            EvoteSizedBox(
                              height: 2.5,
                            ),
                            ...List.generate(
                              presidentData.length,
                              (index) => CandidatePanel(
                                presidentData[index],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
          // ),
        ),
      ),
    );
  }
}

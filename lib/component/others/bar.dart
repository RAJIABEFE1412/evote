import 'package:evote/component/app_text.dart';
import 'package:evote/component/inputs/app_sized_box.dart';
import 'package:evote/styles/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChartSampleState();
}

class PieChartSampleState extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 18,
        ),
        EvoteText("Time left: 04:29:54"),
        EvoteSizedBox(
          height: 50,
          width: 100,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              startDegreeOffset: 180,
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 1,
              centerSpaceRadius: 80,
              sections: showingSections(),
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Indicator(
          color: EvoteColors.blue,
          text: 'Action Congress of Nigeria',
          isSquare: false,
          size: touchedIndex == 0 ? 18 : 16,
          textColor:
              touchedIndex == 0 ? EvoteColors.black : EvoteColors.darkGrey,
        ),
        Indicator(
          color: EvoteColors.yellow,
          text: 'People’s Democratic Party',
          isSquare: false,
          size: touchedIndex == 1 ? 18 : 16,
          textColor:
              touchedIndex == 0 ? EvoteColors.black : EvoteColors.darkGrey,
        ),
        Indicator(
          color: EvoteColors.pink,
          text: 'All Progressive Congress',
          isSquare: false,
          size: touchedIndex == 2 ? 18 : 16,
          textColor:
              touchedIndex == 0 ? EvoteColors.black : EvoteColors.darkGrey,
        ),
        Indicator(
          color: EvoteColors.green,
          text: 'All Nigeria Peoples Party',
          isSquare: false,
          size: touchedIndex == 3 ? 18 : 16,
          textColor:
              touchedIndex == 0 ? EvoteColors.black : EvoteColors.darkGrey,
        ),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      4,
      (i) {
        final isTouched = i == touchedIndex;
        const color0 = EvoteColors.blue;
        const color1 = EvoteColors.yellow;
        const color2 = EvoteColors.pink;
        const color3 = EvoteColors.green;

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: color0,
              value: 25,
              title: '',
              radius: 80,
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(
                      color: EvoteColors.white,
                      width: 6,
                    )
                  : BorderSide(
                      color: EvoteColors.white,
                    ),
            );
          case 1:
            return PieChartSectionData(
              color: color1,
              value: 25,
              title: '',
              radius: 65,
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(
                      color: EvoteColors.white,
                      width: 6,
                    )
                  : BorderSide(
                      color: EvoteColors.white,
                    ),
            );
          case 2:
            return PieChartSectionData(
              color: color2,
              value: 25,
              title: '',
              radius: 60,
              titlePositionPercentageOffset: 0.6,
              borderSide: isTouched
                  ? const BorderSide(color: EvoteColors.white, width: 6)
                  : BorderSide(color: EvoteColors.white.withOpacity(0)),
            );
          case 3:
            return PieChartSectionData(
              color: color3,
              value: 25,
              title: '',
              radius: 70,
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(color: EvoteColors.white, width: 6)
                  : BorderSide(color: EvoteColors.white.withOpacity(0)),
            );
          default:
            throw Error();
        }
      },
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor,
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 24.0,
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
                color: color,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

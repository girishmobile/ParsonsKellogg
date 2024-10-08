import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/color/color.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';

import '../../../../provider/dashboard_provider.dart';

class DashboardGraphWidget extends StatelessWidget {
  const DashboardGraphWidget({super.key, required this.provider});

  final DashboardProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: ten, top: ten),
          child: commonText(
              fontSize: fourteen,
              fontWeight: FontWeight.w600,
              text: metaDescription),
        ),
        Padding(
          padding: const EdgeInsets.only(left: ten, top: five),
          child: RichText(
              text: TextSpan(
                  text: store,
                  style: commonTextStyle(color: Colors.black, fontSize: ten),
                  children: [
                TextSpan(
                  text: ' $allStore',
                  style: commonTextStyle(color: Colors.red, fontSize: ten),
                ),
              ])),
        ),

        const Divider(
          thickness: 0.3,
        ),

        Expanded(
          child: SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        color: colorFillGraph,
                        value: provider.filled.toDouble(),
                        title: '',
                        titleStyle: commonTextStyle(color: Colors.white),
                        radius: twenty,
                      ),
                      PieChartSectionData(
                        color: colorEmptyGraph,
                        value: provider.empty.toDouble(),
                        title: '',
                        titleStyle: commonTextStyle(color: Colors.white),
                        radius: twenty,
                      ),
                    ],
                    centerSpaceRadius: fifty,
                    sectionsSpace: 2,
                  ),
                ),
                Positioned(
                    top: zero,
                    bottom: zero,
                    left: zero,
                    right: zero,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // Centers the content vertically
                        children: [
                          commonText(text: total),
                          const SizedBox(
                            height: five,
                          ),
                          commonText(text: "2350", fontWeight: FontWeight.w800)
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),

        // Legend
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LegendWidget(empty, colorEmptyGraph),
            LegendWidget(filled, colorFillGraph),
          ],
        ),
        const SizedBox(
          height: twenty,
        ),
      ],
    );
  }
}

class LegendWidget extends StatelessWidget {
  final String label;
  final Color color;

  const LegendWidget(this.label, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: ten,
          height: ten,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(three)),
        ),
        const SizedBox(width: four),
        commonText(text: label),
        const SizedBox(width: four),
      ],
    );
  }
}

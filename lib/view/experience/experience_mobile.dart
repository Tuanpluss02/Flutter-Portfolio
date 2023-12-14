import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/general_controller.dart';
import '../../resource/app_class.dart';
import '../../resource/colors.dart';

class ExperienceMobile extends StatefulWidget {
  const ExperienceMobile({Key? key}) : super(key: key);

  @override
  State<ExperienceMobile> createState() => _ExperienceMobileState();
}

class _ExperienceMobileState extends State<ExperienceMobile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppClass().getMqHeight(context) - 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    text: "02.",
                    style: TextStyle(
                        color: AppColors().neonColor,
                        fontSize: 20,
                        fontFamily: 'sfmono'),
                    children: <TextSpan>[
                      TextSpan(
                        text: ''' Where I've Worked''',
                        style: GoogleFonts.robotoSlab(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                    ]),
              ),
              Container(
                height: 0.5,
                margin: const EdgeInsets.only(left: 15),
                width: AppClass().getMqWidth(context) * 0.2,
                color: AppColors().textLight,
              )
            ],
          ),
          Consumer(builder: (context, ref, child) {
            var data = ref.watch(selectedExpProvider);
            return Container(
              width: AppClass().getMqWidth(context),
              margin: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...List.generate(AppClass().experienceList.length,
                            (index) => selectCompany(ref, data, index))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => launchUrl(Uri.parse(
                              AppClass().experienceList[data].website!)),
                          child: RichText(
                            text: TextSpan(
                                text: AppClass().experienceList[data].position,
                                style: GoogleFonts.roboto(
                                    color: AppColors().textColor,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontSize: 18),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        ' @${AppClass().experienceList[data].company}',
                                    style: GoogleFonts.roboto(
                                        color: AppColors().neonColor,
                                        fontSize: 18),
                                  )
                                ]),
                          ),
                        ),
                        Text(
                          AppClass().experienceList[data].duration!,
                          style: TextStyle(
                              color: AppColors().textLight,
                              letterSpacing: 1,
                              height: 1.5,
                              fontSize: 13,
                              fontFamily: 'sfmono'),
                        ),
                        expWidget(data)
                      ],
                    ),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }

  Widget selectCompany(WidgetRef ref, int selectedIndex, int index) {
    return InkWell(
      onTap: () {
        ref.read(selectedExpProvider.notifier).state = index;
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: index == selectedIndex
                ? AppColors().cardColor
                : Colors.transparent,
            border: Border(
                left: BorderSide(
                    color: index == selectedIndex
                        ? AppColors().neonColor
                        : Colors.white,
                    width: 2))),
        child: Text(
          AppClass().experienceList[index].company!,
          style: TextStyle(
              color: index == selectedIndex
                  ? AppColors().neonColor
                  : AppColors().textLight,
              height: 1.5,
              fontSize: 11,
              fontFamily: 'sfmono'),
        ),
      ),
    );
  }

  Widget expWidget(int indexExp) {
    return Column(
      children: [
        ...List.generate(
          AppClass().experienceList[indexExp].jobs!.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Icon(
                          Icons.arrow_right,
                          color: AppColors().neonColor,
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        width: AppClass().getMqWidth(context) * 0.5,
                        child: Text(
                          AppClass().experienceList[indexExp].jobs![index],
                          style: TextStyle(
                              color: AppColors().textLight,
                              letterSpacing: 1,
                              height: 1.5,
                              fontSize: 13,
                              fontFamily: 'sfmono'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

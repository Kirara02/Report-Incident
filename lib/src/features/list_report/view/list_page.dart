// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:report_incident/l10n/locale_keys.g.dart';
import 'package:report_incident/src/widgets/forms/ux_input_custom.dart';

import '../../../../gen/assets.gen.dart';
import '../../../widgets/card/report_card.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  TextEditingController searchController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(LocaleKeys.back_text.tr()),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 10,
          right: 20,
          left: 20,
          bottom: 30,
        ),
        child: ListView(
          children: [
            UXInputCustom(
              controller: searchController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 30,
              itemBuilder: (context, index) {
                List<Map<String, dynamic>> data = [
                  {
                    "title": "Kebakaran",
                    "description":
                        "Gedung A di gusur oleh warga karena menghalangi jalan",
                    "status": "Dalam Penanganan",
                    "img_url": [
                      Assets.images.img.path,
                      Assets.images.banner.path
                    ]
                  }
                ];

                return ReportCard(
                  data: data,
                );
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}

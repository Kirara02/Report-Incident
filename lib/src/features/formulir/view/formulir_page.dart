// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:report_incident/l10n/locale_keys.g.dart';
import 'package:report_incident/src/config/constant.dart';
import 'package:report_incident/src/config/screen.dart';
import 'package:report_incident/src/config/theme/colors.dart';
import 'package:report_incident/src/widgets/forms/column_form_custom.dart';

import '../../../widgets/dialogs/ux_toast_wrapper.dart';
import '../widget/image_bulk_picker.dart';

class FormulirPage extends StatefulWidget {
  const FormulirPage({Key? key}) : super(key: key);

  @override
  State<FormulirPage> createState() => _FormulirPageState();
}

class _FormulirPageState extends State<FormulirPage> {
  TextEditingController dateController = TextEditingController(text: '');
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController nomorController = TextEditingController(text: '');
  TextEditingController kecController = TextEditingController(text: '');
  TextEditingController villageController = TextEditingController(text: '');
  TextEditingController addressController = TextEditingController(text: '');
  TextEditingController typeController = TextEditingController(text: '');
  TextEditingController descController = TextEditingController(text: '');

  Future<File> _compressAndGetFile(String file, {int? rotate}) async {
    final filePath = file;
    final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = '${splitted}_out${filePath.substring(lastIndex)}';
    var result = await FlutterImageCompress.compressAndGetFile(file, outPath,
        quality: 75, rotate: rotate ?? 0);

    return File(result!.path);
  }

  Future _toast(String? message) {
    return UXToast.show(
        message: message ?? '',
        backgroundColor: AppColors.danger,
        textColor: UIColors.white);
  }

  Future _bulkImage({String? title, bool? showMore}) {
    return showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) =>
          ImageBulkPicker(title: title, showAdMore: showMore ?? true),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.back_text.tr()),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //NOTE Profile
              Text(
                LocaleKeys.formulir_profile_title.tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ColumnFormCustom(
                title: LocaleKeys.formulir_profile_date.tr(),
                controller: dateController,
              ),
              const SizedBox(
                height: 10.0,
              ),
              ColumnFormCustom(
                title: LocaleKeys.formulir_profile_name.tr(),
                controller: dateController,
                decoration: InputDecoration(
                  helperText: LocaleKeys.formulir_profile_name_helper.tr(),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ColumnFormCustom(
                title: LocaleKeys.formulir_profile_nomor.tr(),
                controller: nomorController,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        LocaleKeys.formulir_profile_identitas.tr(),
                        style: const TextStyle(
                          fontSize: AppConstants.kFontSizeM,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: AppConstants.kPaddingXS),
                      // hasKtp
                      //     ? const Icon(
                      //         Icons.check_circle_outline,
                      //         color: AppColors.primary,
                      //         size: AppConstants.kIconsS,
                      //       )
                      // : const SizedBox()
                    ],
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 30,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        _bulkImage(
                          showMore: false,
                          title: LocaleKeys.formulir_profile_identitas.tr(),
                        ).then((value) {});
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.biru2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Text(
                        LocaleKeys.select_text.tr(),
                        style: const TextStyle(
                          color: UIColors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      LocaleKeys.formulir_profile_identitas_helper.tr(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: AppConstants.kFontSizeS,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                LocaleKeys.formulir_address_title.tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ColumnFormCustom(
                title: LocaleKeys.formulir_address_subdistrict.tr(),
                controller: kecController,
              ),
              const SizedBox(
                height: 10.0,
              ),
              ColumnFormCustom(
                title: LocaleKeys.formulir_address_village.tr(),
                controller: villageController,
              ),
              const SizedBox(
                height: 10.0,
              ),
              ColumnFormCustom(
                title: LocaleKeys.formulir_address_address.tr(),
                controller: addressController,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                LocaleKeys.formulir_incident_title.tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ColumnFormCustom(
                title: LocaleKeys.formulir_incident_type.tr(),
                controller: typeController,
              ),
              const SizedBox(
                height: 10.0,
              ),
              ColumnFormCustom(
                title: LocaleKeys.formulir_incident_description.tr(),
                controller: descController,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        LocaleKeys.formulir_incident_image.tr(),
                        style: const TextStyle(
                          fontSize: AppConstants.kFontSizeM,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: AppConstants.kPaddingXS),
                      // hasKtp
                      //     ? const Icon(
                      //         Icons.check_circle_outline,
                      //         color: AppColors.primary,
                      //         size: AppConstants.kIconsS,
                      //       )
                      // : const SizedBox()
                    ],
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 30,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        _bulkImage(
                          title: LocaleKeys.formulir_incident_image.tr(),
                        ).then((value) {
                          List<File> data = value;
                          print(data);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.biru2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Text(
                        LocaleKeys.select_text.tr(),
                        style: const TextStyle(
                          color: UIColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: AppScreens.width,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.biru2,
                  ),
                  child: Text(
                    LocaleKeys.send_text.tr(),
                    style: const TextStyle(
                      color: UIColors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 30,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(LocaleKeys.home_dialog_announcement.tr())
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.biru2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    'success',
                    style: const TextStyle(
                      color: UIColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    dateController.dispose();
    nameController.dispose();
    nomorController.dispose();
    kecController.dispose();
    villageController.dispose();
    addressController.dispose();
    typeController.dispose();
    descController.dispose();
    super.dispose();
  }
}

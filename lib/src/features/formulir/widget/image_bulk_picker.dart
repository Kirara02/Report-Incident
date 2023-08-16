import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:report_incident/l10n/locale_keys.g.dart';
import 'package:report_incident/src/config/screen.dart';

import '../../../config/constant.dart';
import '../../../config/theme/colors.dart';

class ImageBulkPicker extends StatefulWidget {
  const ImageBulkPicker({this.title, this.showAdMore = true, Key? key})
      : super(key: key);
  final String? title;
  final bool showAdMore;

  @override
  State<ImageBulkPicker> createState() => _ImageBulkPickerState();
}

class _ImageBulkPickerState extends State<ImageBulkPicker> {
  List<File> _imageFiles = [];
  final picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    XFile? xfilePick = pickedFile;

    setState(() {
      if (xfilePick != null) {
        _imageFiles.add(File(xfilePick.path));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Nothing is selected')));
      }
    });
  }

  Future _chooseImageFrom() async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.camera),
              title: Text(
                LocaleKeys.image_camera.tr(),
              ),
              onTap: () {
                _pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: Text(
                LocaleKeys.image_gallery.tr(),
              ),
              onTap: () {
                _pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _addButton() {
    return GestureDetector(
      onTap: () => _chooseImageFrom(),
      child: Container(
        height: 100,
        width: 100,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: UIColors.grey_20,
          borderRadius: BorderRadiusDirectional.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            const Icon(
              Icons.add_a_photo,
              color: UIColors.grey_40,
              size: 60,
            ),
            Text(
              LocaleKeys.add_foto_text.tr(),
              style: const TextStyle(
                fontSize: AppConstants.kFontSizeM,
                color: UIColors.grey_60,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _imageFiles.isEmpty
              ? _addButton()
              : Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    ..._imageFiles.map((imageFile) {
                      int index = _imageFiles.indexOf(imageFile);

                      return Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.only(top: 20),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.file(
                                imageFile,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _imageFiles.removeAt(index);
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    color: UIColors.white.withOpacity(0.6),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.close),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    if (widget.showAdMore) _addButton(),
                  ],
                ),
          const SizedBox(height: 32),
          SizedBox(
            height: 45,
            width: AppScreens.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                onPressed: () async {
                  List<String> listImages = [];
                  final images = _imageFiles;
                  for (final image in images) {
                    listImages.add(image.path);
                  }
                  // print(images.length);
                  Navigator.pop(context, images);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.biru2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  LocaleKeys.send_text.tr(),
                  style: const TextStyle(
                    color: UIColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
    );
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }
}

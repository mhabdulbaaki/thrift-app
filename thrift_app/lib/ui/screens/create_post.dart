import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:thrift_app/res/string_values.dart';
import 'package:thrift_app/utilities/decoration.dart';
import 'package:thrift_app/utilities/validator.dart';

const String kGallery = 'Gallery';
const String kCamera = 'Camera';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final formKey = GlobalKey<FormState>();

  final picker = ImagePicker();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController locationController = TextEditingController();
  File imageFile;
  var date;
  var time;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(kCreatePostTitle),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: iDecoratorion(kDecoTitle),
                  controller: titleController,
                  validator: (value) {
                    return Validator.titleValidator(value);
                  },
                ),
                TextFormField(
                  decoration: iDecoratorion(kDecoDesc),
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  validator: (value) {
                    return Validator.descriptionValidator(value);
                  },
                ),
                GestureDetector(
                  onTap: () async {
                    buildShowDialog(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.2,
                    color: colorScheme.primary,
                    child: imageFile == null
                        ? Center(
                            child: Text('Upload image'),
                          )
                        : Image.file(imageFile),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final dateTime = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 7)));

                        if (dateTime != null) {
                          setState(() {
                            date = dateTime;
                          });
                        }
                      },
                      child: Text(date == null
                          ? kDate
                          : DateFormat('MMMMEEEEd').format(date)),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final timeOfDay = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());

                        if (timeOfDay != null) {
                          setState(() {
                            time = timeOfDay;
                          });
                        }
                      },
                      child: Text(time == null ? kTime : time),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        print('form Valid');
                      }
                    },
                    child: Text(kCreatePostButton)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future buildShowDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(kDialogTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                  onPressed: () async {
                    await pickImage(ImageSource.gallery);
                  },
                  child: Text(kGallery)),
              TextButton(
                  onPressed: () async {
                    await pickImage(ImageSource.camera);
                  },
                  child: Text(kCamera)),
            ],
          ),
        );
      });

  Future<void> pickImage(ImageSource imageSource) async {
    final pickedFile = await picker.getImage(source: imageSource);
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      }
    });
  }
}

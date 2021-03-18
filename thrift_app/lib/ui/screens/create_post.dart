import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:thrift_app/res/numerical_vals.dart';
import 'package:thrift_app/res/string_values.dart';
import 'package:thrift_app/ui/screens/location_search_delegate.dart';
import 'package:thrift_app/utilities/decoration.dart';
import 'package:thrift_app/utilities/validator.dart';

const String kGallery = 'Gallery';
const String kCamera = 'Camera';
const String kImagePlaceholder = 'Upload image';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final formKey = GlobalKey<FormState>();

  final picker = ImagePicker();

  final titleController = TextEditingController();

  final descriptionController = TextEditingController();

  final locationController = TextEditingController();
  File imageFile;
  DateTime date;
  TimeOfDay time;

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
                  decoration: formDecoratorion(kDecoTitle),
                  controller: titleController,
                  validator: Validator.titleValidator,
                ),
                SizedBox(
                  height: sizedBoxHeight,
                ),
                TextFormField(
                  decoration: formDecoratorion(kDecoDesc),
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  validator: Validator.descriptionValidator,
                ),
                SizedBox(
                  height: sizedBoxHeight,
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
                            child: Text(kImagePlaceholder),
                          )
                        : Image.file(
                            imageFile,
                            // fit: BoxFit.fill,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                SizedBox(
                  height: sizedBoxHeight,
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
                      child: Container(
                        padding: EdgeInsets.all(8),
                        color: colorScheme.primary,
                        child: Text(date == null
                            ? kDate
                            : DateFormat('MMMMEEEEd').format(date)),
                      ),
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
                      child: Container(
                          padding: EdgeInsets.all(8),
                          color: colorScheme.primary,
                          child: Text(
                              time == null ? kTime : time.format(context))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () async {
                    try {
                      showSearch(
                          context: context, delegate: LocationSearchDelegate());
                      // final currentLocation = await determinePosition();
                      // print(currentLocation);
                    } catch (error) {
                      appSnackBar(context, error);
                    }
                  },
                  child: Container(
                    height: 20,
                    width: double.infinity,
                    color: colorScheme.primary,
                    child: Center(child: Text('set location')),
                  ),
                ),
                SizedBox(
                  height: sizedBoxHeight,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState.validate() &&
                          time != null &&
                          date != null) {
                        ///ToDo: add post to firebase
                      } else {
                        appSnackBar(context, kInvalidFormMessage);
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

  void appSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                    Navigator.pop(context);
                  },
                  child: Text(kGallery)),
              TextButton(
                  onPressed: () async {
                    await pickImage(ImageSource.camera);
                    Navigator.pop(context);
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

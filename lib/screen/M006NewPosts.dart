import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/models/documents/document.dart';
import 'package:flutter_quill/widgets/controller.dart';
import 'package:flutter_quill/widgets/editor.dart';
import 'package:flutter_quill/widgets/toolbar.dart';
import 'package:khoi_nghiep/service/storage.dart';
import 'package:khoi_nghiep/widget/CommonWidget.dart';
import 'package:quill_delta/quill_delta.dart';

class M006NewPost extends StatefulWidget {
  @override
  _M006NewPostState createState() => _M006NewPostState();
}

class _M006NewPostState extends State<M006NewPost> {
  final file = File(Directory.systemTemp.path + "/quick_start.json");
  QuillController _controller = QuillController.basic();

  @override
  void initState() {
    super.initState();
    _loadDocument(file).then((document) {
      setState(() {
        _controller = QuillController(
            document: document, selection: TextSelection.collapsed(offset: 0));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.done, color: Colors.black),
            onPressed: () async {
              bool isSave = showAlertDialog(context, () {
                _saveDocument(context);
              });
              if (isSave = true) {
                // _saveDocument(context);
                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: QuillEditor.basic(
                    controller: _controller,
                    readOnly: false, // change to true to be view only mode
                  ),
                ),
              ),
              QuillToolbar.basic(
                  controller: _controller,
                  showColorButton: false,
                  showBackgroundColorButton: false,
                  showQuote: false,
                  showCodeBlock: false,
                  showListCheck: false,
                  uploadFileCallback: _uploadImageCallBack),
            ],
          ),
        ));
  }

  void _saveDocument(BuildContext context) {
    String contents = jsonEncode(_controller.document.toDelta());
    StorageService().uploadTopic('test', contents);
    // And show a snack bar on success.
    file.writeAsString(contents).then((_) {
      log('Lưu thành công');
    });
  }

  Future<dynamic> _loadDocument(final file) async {
    print('load');
    // if (await file.exists()) {
    //   final contents = await file.readAsString();
    //   return Document.fromJson(jsonDecode(contents));
    // }
    final Delta delta = Delta()..insert("\n");
    return Document.fromJson(jsonDecode(delta.toString()));
  }

  Future<String> _uploadImageCallBack(final file) async {
    // call upload file API and return file's absolute url
    if (file == null) return null;
    final path = await StorageService().uploadFile(file);
    return path;
  }
}

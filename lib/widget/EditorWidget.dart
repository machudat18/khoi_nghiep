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
import 'package:quill_delta/quill_delta.dart';

class EditorPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<EditorPage> {
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
            onPressed: () {
              _saveDocument(context);
              Navigator.of(context).pop();
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
                  uploadFileCallback: _uploadImageCallBack),
            ],
          ),
        ));
  }

  void _saveDocument(BuildContext context) {
    // Notus documents can be easily serialized to JSON by passing to
    // `jsonEncode` directly
    debugPrint(_controller.document.toDelta().toString());
    String contents = jsonEncode(_controller.document.toDelta());

    // For this example we save our document to a temporary file.

    // And show a snack bar on success.
    file.writeAsString(contents).then((_) {
      log('Lưu thành công');
    });
  }

  Future<dynamic> _loadDocument(final file) async {
    print('load');
    if (await file.exists()) {
      final contents = await file.readAsString();
      return Document.fromJson(jsonDecode(contents));
    }
    final Delta delta = Delta()..insert("Zefyr Quick Start\n");
    return Document.fromJson(jsonDecode(delta.toString()));
  }

  Future<String> _uploadImageCallBack(File file) async {
    // call upload file API and return file's absolute url
    if (file == null) return null;
    return file.path.toString();
  }

  void save() {}
}

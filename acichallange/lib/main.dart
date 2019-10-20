import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(home: MriScanner()));
}

class MriScanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MriScannerState();
  }
}

class MriScannerState extends State<MriScanner> {
  List<File> _image=[];
  int val=0;

  Future getImage() async {
    
   await ImagePicker.pickImage(source: ImageSource.gallery).then(( image){
       
       _image.add(image);
       
        
    
    setState(() {      
    });
    });
       
  }

  Future getImage2() async {
   await ImagePicker.pickImage(source: ImageSource.gallery).then(( image){
       _image.add(image);
       
    setState(() {      
    });
    });
       
        
    
       
  }
  Future uploadmultipleimage(List<File> images) async {
  var uri = Uri.parse("http://10.20.0.67/upload");
  http.MultipartRequest request = new http.MultipartRequest('POST', uri);
  // request.headers[''] = '';
  // request.fields['user_id'] = '10';
  // request.fields['post_details'] = 'dfsfdsfsd';
  //multipartFile = new http.MultipartFile("imagefile", stream, length, filename: basename(imageFile.path));
  List<MultipartFile> newList = new List<MultipartFile>();
  for (int i = 0; i < images.length; i++) {
    // File imagqeFile = File(images[i].toString());
    var stream =
        new http.ByteStream(DelegatingStream.typed(images[i].openRead()));
    var length = await images[i].length();
    var multipartFile = new http.MultipartFile("file[]", stream, length,
        filename: basename(images[i].path));
    newList.add(multipartFile);
  }
  request.files.addAll(newList);
  var response = await request.send();
  if (response.statusCode == 200) {
    print("Image Uploaded");
  } else {
    print("Upload Failed");
  }
  response.stream.transform(utf8.decoder).listen((value) {
    print(value);
  });
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Mri Scannar"),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                "Automated Mri",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )),
            Center(
                child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Scanner",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ))),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                  )
                ]),
            Center(
              child: Text("Steps To use This App",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Step 1:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0, left: 2.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Choose the Mri TestImage from the",
                              ),
                              Text(
                                "gallary.",
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: Container(
                    //width: 100.0,
                    height: 50.0,
                    decoration: new BoxDecoration(
                      color: Colors.blueAccent,
                      border: new Border.all(color: Colors.white, width: 2.0),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: new Center(
                      child: new Text(
                        'Choose Image',
                        style:
                            new TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: _image.isEmpty
                        ? Text('No image selected.')
                        : Image.file(_image[0]),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Step 2:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Choose the Mri LabelImage from the",
                              ),
                              Text(
                                " gallary.",
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    getImage2();
                    val=1;
                    
                  },
                  child: Container(
                    //width: 100.0,
                    height: 50.0,
                    decoration: new BoxDecoration(
                      color: Colors.blueAccent,
                      border: new Border.all(color: Colors.white, width: 2.0),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: new Center(
                      child: new Text(
                        'Choose Image',
                        style:
                            new TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: val!=1
                        ? Text('No image selected.')
                        : Image.file(_image[1]),
                  ),
                ),
              ],
            ),
             Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Step 3:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0, left: 2.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Click on the Upload Button",
                          )),
                    ),
                  ],
                ),
                 GestureDetector(
                  onTap: () {
                    uploadmultipleimage(_image);
                  },
                  child: Container(
                    //width: 100.0,
                    height: 50.0,
                    decoration: new BoxDecoration(
                      color: Colors.blueAccent,
                      border: new Border.all(color: Colors.white, width: 2.0),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: new Center(
                      child: new Text(
                        'Upload Image',
                        style:
                            new TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,)
          ],
        ),
      ),
    );
  }
}

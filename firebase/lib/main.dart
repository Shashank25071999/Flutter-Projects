import 'dart:io';
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
GoogleSignIn _googleSignIn = GoogleSignIn();
void main() async {
  final FirebaseApp app = await FirebaseApp.configure(
      name: 'Shashank',
      options: FirebaseOptions(
          googleAppID: "1:656291102872:android:1b7829f2ac180d28",
          gcmSenderID: '656291102872',
          apiKey: "AIzaSyCPR_qVnujXgwpB3QteMfGOQckrpxeurQk",
          projectID: "macrotech-44e5c"));

         final FirebaseStorage storage =  FirebaseStorage(app: app,storageBucket: 'gs://macrotech-44e5c.appspot.com');
  runApp(new FilePickerDemo());




}



class FilePickerDemo extends StatefulWidget {
  
  FilePickerDemo();
  @override
  _FilePickerDemoState createState() => new _FilePickerDemoState();
}

class _FilePickerDemoState extends State<FilePickerDemo> {
    
  _FilePickerDemoState();
 // final FirebaseStorage storage;
  String _fileName;
  String _status;
  String _path;
  Map<String, String> _paths;
  String _extension;
  bool _multiPick = false;
  bool _hasValidMime = false;
  FileType _pickingType;
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    _status = "not signed in";
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }
  // void _signInGoogle()async{
  //  GoogleSignInAccount googleuser= await _googleSignIn.signIn();
  //GoogleSignInAuthentication googleauth = await googleuser.authentication;
//  final FirebaseUser user= await _auth.signInWithGoogle(idToken:googleauth.idToken,accessToken:googleauth.accessToken);

  //}

  void _signInAnon() async {
    FirebaseUser user = await _auth.signInAnonymously();
    if (user != null && user.isAnonymous) {
      setState(() {
        _status = "Signed in";
      });
    } else {
      _status = "sign in failed";
    }
  }

  void _signOut() async {
    await _auth.signOut();

    setState(() {
      _status = 'Sign out';
    });
  }
  void _upload(Uri path)async{
    Directory systemTempDir = Directory.systemTemp;
    File file= await File.fromUri(path);
    String locations = await  FirebaseStorage.upload    (file,path.toString() );
  }

  Future<String> upload(File file,String basename)async{
    StorageReference ref=FirebaseStorage.instance.ref().child('file/test/${basename}');
    StorageUploadTask uploadTask=ref.putFile(file);
    // Uri location =(await uploadTask.future).downloadUrl;

    String name =await ref.getName();
    String bucket= await ref.getBucket();
    Uri    location =await ref.getDownloadURL();
    String pathsh=await ref.getPath();
    print("bucket:${bucket}");
    print("location:${location}");
    print("pathsh:${pathsh}");
    print("name:${name}");

    return location.toString();
  }

  void _openFileExplorer() async {
    if (_pickingType != FileType.CUSTOM || _hasValidMime) {
      try {
        if (_multiPick) {
          _path = null;
          _paths = await FilePicker.getMultiFilePath(
              type: _pickingType, fileExtension: _extension);
        } else {
          _paths = null;
          _path = await FilePicker.getFilePath(
              type: _pickingType, fileExtension: _extension);
        }
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
      if (!mounted) return;

      setState(() {
        _fileName = _path != null
            ? _path.split('/').last
            : _paths != null ? _paths.keys.toString() : '...';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('File Picker example app'),
        ),
        body: new Center(
            child: new Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: new SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: new DropdownButton(
                      hint: new Text('LOAD PATH FROM'),
                      value: _pickingType,
                      items: <DropdownMenuItem>[
                        new DropdownMenuItem(
                          child: new Text('FROM AUDIO'),
                          value: FileType.AUDIO,
                        ),
                        new DropdownMenuItem(
                          child: new Text('FROM IMAGE'),
                          value: FileType.IMAGE,
                        ),
                        new DropdownMenuItem(
                          child: new Text('FROM VIDEO'),
                          value: FileType.VIDEO,
                        ),
                        new DropdownMenuItem(
                          child: new Text('FROM ANY'),
                          value: FileType.ANY,
                        ),
                        new DropdownMenuItem(
                          child: new Text('CUSTOM FORMAT'),
                          value: FileType.CUSTOM,
                        ),
                      ],
                      onChanged: (value) => setState(() {
                            _pickingType = value;
                            if (_pickingType != FileType.CUSTOM) {
                              _controller.text = _extension = '';
                            }
                          })),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 100.0),
                  child: _pickingType == FileType.CUSTOM
                      ? new TextFormField(
                          maxLength: 15,
                          autovalidate: true,
                          controller: _controller,
                          decoration:
                              InputDecoration(labelText: 'File extension'),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            RegExp reg = new RegExp(r'[^a-zA-Z0-9]');
                            if (reg.hasMatch(value)) {
                              _hasValidMime = false;
                              return 'Invalid format';
                            }
                            _hasValidMime = true;
                          },
                        )
                      : new Container(),
                ),
                new ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 200.0),
                  child: new SwitchListTile.adaptive(
                    title: new Text('Pick multiple files',
                        textAlign: TextAlign.right),
                    onChanged: (bool value) =>
                        setState(() => _multiPick = value),
                    value: _multiPick,
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                  child: new RaisedButton(
                    onPressed: () => _openFileExplorer(),
                    child: new Text("Open file picker"),
                  ),
                ),
                new Builder(
                  builder: (BuildContext context) => new Container(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: new Scrollbar(
                          child: _path != null || _paths != null
                              ? new ListView.separated(
                                  itemCount: _paths != null && _paths.isNotEmpty
                                      ? _paths.length
                                      : 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final bool isMultiPath =
                                        _paths != null && _paths.isNotEmpty;
                                    final String name = 'File $index: ' +
                                        (isMultiPath
                                            ? _paths.keys.toList()[index]
                                            : _fileName ?? '...');
                                    final path = isMultiPath
                                        ? _paths.values
                                            .toList()[index]
                                            .toString()
                                        : _path;

                                    return new ListTile(
                                      title: new Text(
                                        name,
                                      ),
                                      subtitle: new Text(path),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          new Divider(),
                                )
                              : new Container(),
                        ),
                      ),
                ),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Sign in"),
                      onPressed: () => _signInAnon(),
                    ),
                    RaisedButton(
                      child: Text("Sign out"),
                      onPressed: () => _signOut(),
                    ),
                    Text("${_status}"),
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}

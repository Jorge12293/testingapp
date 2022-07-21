import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

class FileLoadPage extends StatefulWidget {
  const FileLoadPage();

  @override
  State<FileLoadPage> createState() => _FileLoadPageState();
}

class _FileLoadPageState extends State<FileLoadPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  /*
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false();
    }
  }
*/
  void mesTEXT() {
    print('fINALIZO guradado ......................................');
  }

  saveToDatabase(String url) async {
    try {
      var dbTimeKey = DateTime.now();
      var formatDate = DateFormat('MM D, yyyy');
      var formatTime = DateFormat('EEEE, hh: mm aaa');
      String date = formatDate.format(dbTimeKey);
      String time = formatTime.format(dbTimeKey);

      var data = {"image": url, "description": 'Save Testing', "date": date};

      FirebaseFirestore.instance
          .collection('PRUEBA')
          .doc()
          .set(data)
          .whenComplete(() => {mesTEXT()})
          .onError((error, stackTrace) => print(
              error.toString() + ' ===========  ' + stackTrace.toString()));
    } on FirebaseException catch (e) {
      print(e.toString());
    } catch (e) {
      print(' 11111111111111111111111111111111111111111111111111111111 ');
      print(e.toString());
      print(' 11111111111111111111111111111111111111111111111111111111 ');
    }
  }

  void selectDescription() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              // titlePadding: EdgeInsets.symmetric(vertical: 40),
              // titlePadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // Navigator.pop(context);
                        },
                        child: const Text('x'),
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          primary: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                ElevatedButton(
                    onPressed: () {
                      //selectDescription();
                      /*
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );*/
                    },
                    child:
                        const Text("Cancelar", style: TextStyle(fontSize: 10)),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(120, 30),
                        primary: Colors.red,
                        shape: const StadiumBorder())),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Solicitar Asignacion",
                        style: TextStyle(fontSize: 10)),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(120, 30),
                        primary: const Color(0xFF3DC815),
                        shape: const StadiumBorder())),
              ],
              content: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.report_outlined,
                        color: Color(0xFF7FCCC3), size: 50),
                    const Text(
                        'Reporte error en el número de identificación y el documento para una corrección efectiva.'),
                    const SizedBox(height: 10),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: new InputDecoration(
                                fillColor: Colors.white70,
                                filled: true,
                                hintText: 'Cedula',
                                labelText: 'Ingrese la cedula',
                                labelStyle: TextStyle(color: Colors.grey),
                                hintStyle: TextStyle(
                                    fontSize: 20.0, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.teal,
                                  ),
                                ),
                              )),
                          const SizedBox(height: 10),
                          TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: new InputDecoration(
                                fillColor: Colors.white70,
                                filled: true,
                                hintText: 'Cedula',
                                labelText: 'Ingrese la cedula',
                                labelStyle: TextStyle(color: Colors.grey),
                                hintStyle: TextStyle(
                                    fontSize: 20.0, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.teal,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Icon(Icons.backup, color: Colors.grey, size: 50),
                        Text(' Adjuntar',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
              ));
        });
  }

  void selectTypeRoutingInfo() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            //  titlePadding: EdgeInsets.symmetric(vertical: 40),
            titlePadding: EdgeInsets.zero,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // Navigator.pop(context);
                      },
                      child: const Text('x'),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        primary: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                  onPressed: () {
                    selectDescription();
                    //Navigator.pop(context);
                  },
                  child: const Text("Cancelar", style: TextStyle(fontSize: 10)),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 30),
                      primary: Colors.red,
                      shape: const StadiumBorder())),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Solicitar Asignacion",
                      style: TextStyle(fontSize: 10)),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 30),
                      primary: const Color(0xFF3DC815),
                      shape: const StadiumBorder())),
            ],
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.report_outlined,
                    color: Color(0xFF7FCCC3), size: 50),
                RichText(
                  text: const TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: <InlineSpan>[
                        TextSpan(
                            text:
                                'Este No. de Documento de identidad ya se encuentra regitrado como '),
                        TextSpan(
                            text: 'MARTIN CONTRERAS',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' de la '),
                        TextSpan(
                            text: 'U EDUC \n\n',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: '¿Desea continuar con el registro?'),
                      ]),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('File Load'),
        ),
        body: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  selectDescription();
                  //  selectTypeRoutingInfo();
                },
                child: Text('Save Data'),
              ),
              ElevatedButton(
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: [
                        'png',
                        'jpg',
                        'pdf',
                        'doc',
                      ],
                    );

                    if (result != null) {
                      try {
                        PlatformFile file = result.files.first;
                        print(file.name);
                        print(file.bytes);
                        print(file.size);
                        print(file.extension);
                        print(file.path);
                        File file2 = File(file.path.toString());
                        Uint8List? fileBytes = result.files.first.bytes;
                        String fileName = result.files.first.name;
                        /*await FirebaseStorage.instance
                            .ref('uploads20/$fileName')
                            .putFile(file2);*/

                        final Reference postFileReference =
                            FirebaseStorage.instance.ref().child('uploads25');
                        var timeKey = DateTime.now();
                        print(timeKey);
                        print(postFileReference.toString());
                        print(' ============ ');

                       UploadTask uploadTask = postFileReference
                            .child(timeKey.toString() +
                                '.' +
                                file.extension.toString())
                            .putFile(file2);
                        //String txtQ = uploadTask.snapshot.ref.fullPath;
                        // print(txtQ);
                        // Listen for state changes, errors, and completion of the upload.
                        
                        uploadTask.snapshotEvents
                            .listen((TaskSnapshot taskSnapshot) {
                          print(taskSnapshot);
                          switch (taskSnapshot.state) {
                            case TaskState.running:
                              final progress = 100.0 *
                                  (taskSnapshot.bytesTransferred /
                                      taskSnapshot.totalBytes);
                              print("Upload is $progress% complete.");
                              break;
                            case TaskState.paused:
                              print("Upload is paused.");
                              break;
                            case TaskState.canceled:
                              print("Upload was canceled");
                              break;
                            case TaskState.error:
                              print("Handle unsuccessful uploads.");
                              // Handle unsuccessful uploads
                              break;
                            case TaskState.success:
                              print("Handle successful uploads on complete.");
                              print('**********');
                              print(taskSnapshot.ref.fullPath);
                              saveToDatabase(
                                  taskSnapshot.ref.fullPath.toString());
                              print('**********');
                              // Handle successful uploads on complete
                              // ...
                              break;
                            default:
                              print('**********');
                              break;
                          }
                        }).onError((error) {
                          print('Errror0000000000000000000000');
                          print(error.toString());
                        });

                        // Resume the upload.
                         bool resumed = await uploadTask.resume();
                        print('resumed, $resumed');

                        uploadTask.whenComplete(() => {print('Finalizo')});
                      } on FirebaseException catch (e) {
                        print('eRROR fIREBASE......');
                      }
                      ccatch(e) {
                        print('eRROR fIREBASE...... 2');
                      }
                      /*
                      var imageUrl =
                          await (await uploadTask.whenComplete(() => getDoa));*/

                      // File file = File(result.files.single.path);
                      // Upload file
                      // await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes!);

                    } else {
                      print('No se cargo documento');
                      // User canceled the picker
                    }
                  },
                  child: Text('Load File'))
            ],
          ),
        ));
  }
}

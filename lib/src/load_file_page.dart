import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
                  child: const Text("Cancelar",
                      style: TextStyle(fontSize: 10)),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 30),
                      primary: Colors.red,
                      shape: const StadiumBorder())),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Solicitar Asignacion", style: TextStyle(fontSize: 10)),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 30),
                      primary: const Color(0xFF3DC815),
                      shape: const StadiumBorder())),
            ],
            content: SingleChildScrollView(
  child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.report_outlined,
                    color: Color(0xFF7FCCC3), size: 50),
                    
                const Text('Reporte error en el número de identificación y el documento para una corrección efectiva.'),
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
                          labelStyle: TextStyle(
                            color: Colors.grey
                          ),
                          hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                          border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.teal,
                          ),
                        ),
                        )
                      ),
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
                          labelStyle: TextStyle(
                            color: Colors.grey
                          ),
                          hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                          border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.teal,
                          ),
                        ),
                        )
                      ),
      
                    ],
                  ),
                ),
                 const SizedBox(height: 10),
                Row(
                  children:const [
                   Icon(Icons.backup,
                    color:Colors.grey, size: 50),
                   Text(' Adjuntar',style: TextStyle(fontWeight: FontWeight.bold))
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
                      PlatformFile file = result.files.first;
                      print(file.name);
                      print(file.bytes);
                      print(file.size);
                      print(file.extension);
                      print(file.path);
                      File file2 = File(file.path.toString());
                      // File file = File(result.files.single.path);
                      // Upload file
                      Uint8List? fileBytes = result.files.first.bytes;
                      String fileName = result.files.first.name;
                      await FirebaseStorage.instance
                          .ref('uploads20/$fileName')
                          .putFile(file2);
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

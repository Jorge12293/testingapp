import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage2(title: 'Flutter Testing'),
    );
  }
}

class UserNotify {
  UserNotify({
    required this.id,
    required this.fecha,
    required this.usuario,
    required this.tipo,
    required this.nombre,
    required this.leido,
  });
  int id;
  String fecha;
  String usuario;
  String tipo;
  String nombre;
  bool leido;
}

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  List<String> listaString = [];

  List<UserNotify> _userNotifyList = [];
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  void initState() {
    loadData();
    _userNotifyList = _generateItems();
    super.initState();
    // setState(() { });
  }

  List<UserNotify> _generateItems() {
    List<UserNotify> listUserNotify = [];
    listUserNotify.add(
     UserNotify ( 
      id:1,
      fecha:'07-17-2022',
      usuario:'Representante',
      tipo:'Aviso Administrador',
      nombre:'Jorge',
      leido:false,
      )
    );
    listUserNotify.add(
     UserNotify ( 
      id:2,
      fecha:'08-17-2022',
      usuario:'Conductor',
      tipo:'Aviso Administrador',
      nombre:'Juan',
      leido:true,
      )
    );
    listUserNotify.add(
     UserNotify ( 
      id:3,
      fecha:'09-17-2022',
      usuario:'Conductor',
      tipo:'Aviso Administrador',
      nombre:'Pedro',
      leido:false,
      )
    );
    return listUserNotify;

    /*
    return List.generate(15, (int index) {
      return UserNotify(
        id: index + 1,
        fecha: '17-02-2022',
        usuario: 'REPRESENTANTE',
        tipo: 'Aviso ',
        nombre: 'Juan ',
        leido: false,
      );
    });
    */
  }

  void updateSort(int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(
        label: Text('FECHA'),
        numeric: false,
      ),
      const DataColumn(
        label: Text('USUARIO'),
        numeric: false,
      ),
      const DataColumn(
        label: Text('TIPO'),
        numeric: false,
      ),
      const DataColumn(
        label: Text('NOMBRE'),
        numeric: false,
      ),
      const DataColumn(
        label: Text(' '),
        numeric: false,
      ),
    ];
  }

  void selectTypeRoutingInfo(UserNotify userNotify) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.circle_notifications),
                    Text('  Notificacion'),
                  ]),
              actionsAlignment: MainAxisAlignment.center,
              actionsPadding: EdgeInsets.zero,
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Aceptar",
                        style: TextStyle(color: Color(0xFF3DC815))),
                    style: ElevatedButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        primary: Colors.white,
                        shape: const StadiumBorder())),
              ],
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text:  TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: <InlineSpan>[
                          TextSpan(
                              text: 'Destinatario: (${userNotify.usuario})',
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                          const TextSpan(text: '\n'),
                          TextSpan(
                              text: userNotify.nombre,
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                          const TextSpan(text: '\n\n'),
                          TextSpan(
                              text: userNotify.fecha,
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                          const TextSpan(text: '\n\n'),
                          TextSpan(
                              text:userNotify.tipo),
                        ]),
                  ),
                  const Divider(thickness: 1)
                ],
              ));
        });
  }

  DataRow _createRow(UserNotify userNotify) {
    return DataRow(
      key: ValueKey(userNotify.id),
      //selected: userNotify.leido,
      onSelectChanged: (bool? isSelected) {
        if (isSelected != null) {
          selectTypeRoutingInfo(userNotify);
        }
      },
      cells: [
        DataCell(
          Container(
            padding: const EdgeInsets.all(1),
            width: MediaQuery.of(context).size.width * 0.15,
            child: Text(
              userNotify.fecha,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10),
            ),
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width * 0.15,
            child: Text(
              userNotify.usuario,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10),
            ),
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.all(1),
            width: MediaQuery.of(context).size.width * 0.15,
            child: Text(
              userNotify.tipo,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10),
            ),
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.all(1),
            width: MediaQuery.of(context).size.width * 0.15,
            child: Text(
              userNotify.nombre,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10),
            ),
          ),
        ),
        DataCell(
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
              child: (userNotify.leido)
              ? const Icon(Icons.circle_rounded, color: Colors.green)
              : const Icon(Icons.circle_rounded, color: Colors.red)),
        ),
      ],
    );
  }

  void loadData() async {
    listaString.add('Hola');
    listaString.add('Hola');
    listaString.add('Hola');
    listaString.add('Hola');

    try {
      await FirebaseFirestore.instance
          .collection('cuencaprueba')
          .doc('novedades')
          .collection('CIRO')
          .doc('conductor')
          .snapshots()
          .forEach((element) {
        element.data.call();
      });
    } catch (e) {
      print(e.toString());
      print('error...................');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: DataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              columnSpacing: 0,
              dividerThickness: 1,
              dataTextStyle: const TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.black),
              headingRowColor: MaterialStateColor.resolveWith(
                  (states) => const Color.fromARGB(255, 228, 225, 225)),
              headingTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
              showCheckboxColumn: false,
              columns: _createColumns(),
              rows: _userNotifyList.map((item) => _createRow(item)).toList(),
            ),
          ),
        ));
  }
}

class Item {
  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.isSelected,
  });

  int id;
  String name;
  double price;
  String description;
  bool isSelected;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> listaString = [];

  List<Item> _items = [];
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  void initState() {
    loadData();
    _items = _generateItems();
    super.initState();
    // setState(() { });
  }

  List<Item> _generateItems() {
    return List.generate(15, (int index) {
      return Item(
        id: index + 1,
        name: 'Item ${index + 1}',
        price: (index + 1) * 1000.00,
        description: 'Details of item ${index + 1}',
        isSelected: false,
      );
    });
  }

  void updateSort(int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(
        label: Text('No'),
        numeric: false, // Deliberately set to false to avoid right alignment.
      ),
      DataColumn(
        label: const Text('Name'),
        numeric: false,
        tooltip: 'Name of the item',
        onSort: (int columnIndex, bool ascending) {
          if (ascending) {
            _items.sort((item1, item2) => item1.name.compareTo(item2.name));
          } else {
            _items.sort((item1, item2) => item2.name.compareTo(item1.name));
          }

          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
          });
        },
      ),
      DataColumn(
        label: const Text('Price'),
        numeric: false, // Deliberately set to false to avoid right alignment.
        tooltip: 'Price of the item',
        onSort: (int columnIndex, bool ascending) {
          if (ascending) {
            _items.sort((item1, item2) => item1.price.compareTo(item2.price));
          } else {
            _items.sort((item1, item2) => item2.price.compareTo(item1.price));
          }

          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
          });
        },
      ),
      const DataColumn(
        label: Text('Description'),
        numeric: false,
        tooltip: 'Description of the item',
      ),
    ];
  }

  DataRow _createRow(Item item) {
    return DataRow(
      // index: item.id, // for DataRow.byIndex
      key: ValueKey(item.id),
      selected: item.isSelected,
      onSelectChanged: (bool? isSelected) {
        if (isSelected != null) {
          item.isSelected = isSelected;

          setState(() {});
        }
      },
      color: MaterialStateColor.resolveWith((Set<MaterialState> states) =>
          states.contains(MaterialState.selected)
              ? Colors.red
              : Color.fromARGB(100, 215, 217, 219)),
      cells: [
        DataCell(
          Text(item.id.toString()),
        ),
        DataCell(
          Text(item.name),
          placeholder: false,
          showEditIcon: true,
          onTap: () {
            print('onTap');
          },
        ),
        DataCell(Text(item.price.toString())),
        DataCell(
          Text(item.description),
        ),
      ],
    );
  }

  void loadData() async {
    listaString.add('Hola');
    listaString.add('Hola');
    listaString.add('Hola');
    listaString.add('Hola');

    try {
      /*
      CollectionReference _collectionReference =
          FirebaseFirestore.instance.collection('cuenca');
      QuerySnapshot users = await _collectionReference.get();
      if (users.docs.isNotEmpty) {
        for (var doc in users.docs) {
          print(doc['titulo']);
          print(doc.data().toString());
        }
      }*/
      /*
      CollectionReference _collectionReference = FirebaseFirestore.instance
          .collection('cuencaprueba')
          .doc('novedades')
          .collection('CIRO');
      QuerySnapshot users = await _collectionReference.get();
      if (users.docs.isNotEmpty) {
        for (var doc in users.docs) {
          print(doc.id);
        }
      }*/
/*
      final docRef = FirebaseFirestore.instance
          .collection('cuencaprueba')
          .doc('novedades')
          .collection('CIRO')
          .doc('conductor').get();

      docRef.then((DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          print('Data =>$data');
        },
        onError: (e) => print("Error getting document: $e"),
      );

*/

      await FirebaseFirestore.instance
          .collection('cuencaprueba')
          .doc('novedades')
          .collection('CIRO')
          .doc('conductor')
          .snapshots()
          .forEach((element) {
        element.data.call();
      });

/*
      QuerySnapshot users = await _collectionReference.get();
      if (users.docs.isNotEmpty) {
        for (var doc in users.docs) {
          print(doc.get(doc.id).toString());
        }
      }
*/
      /*
      docRef.get().then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          print(documentSnapshot.id);
          print('Document exists on the database');
        }
      });*/
    } catch (e) {
      print(e.toString());
      print('error...................');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: DataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              columnSpacing: 0,
              dividerThickness: 5,
              onSelectAll: (bool? isSelected) {
                if (isSelected != null) {
                  _items.forEach((item) {
                    item.isSelected = isSelected;
                  });

                  setState(() {});
                }
              },
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 10)),
              dataRowColor: MaterialStateColor.resolveWith(
                  (Set<MaterialState> states) =>
                      states.contains(MaterialState.selected)
                          ? Colors.blue
                          : Color.fromARGB(100, 215, 217, 219)),
              dataRowHeight: 80,
              dataTextStyle: const TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.black),
              headingRowColor: MaterialStateColor.resolveWith(
                  (states) => const Color.fromARGB(255, 228, 225, 225)),
              headingRowHeight: 80,
              headingTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
              horizontalMargin: 10,
              showBottomBorder: true,
              showCheckboxColumn: false,
              columns: _createColumns(),
              rows: _items.map((item) => _createRow(item)).toList(),
            ),
          ),
        ));
  }
}

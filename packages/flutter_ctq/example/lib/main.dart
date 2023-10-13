import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_ctq/flutter_ctq.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

late final String ctqFileDir;
const filename = 'jpn-eng.dico';

Future<void> copyFile(String filename) async {
  var data = (await rootBundle.load(join('assets', filename)));
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  File(join(ctqFileDir, filename)).writeAsBytesSync(bytes);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterCTQReader.ensureInitialized();
  ctqFileDir = join((await getApplicationDocumentsDirectory()).path, "ctq");

  final dir = Directory(ctqFileDir);

  if (!dir.existsSync()) {
    dir.createSync();
  }

  await copyFile(filename);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final reader = FlutterCTQReader(join(ctqFileDir, filename));
  List<MapEntry<String, int>> entries = [];

  @override
  void dispose() {
    reader.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FlutterCTQ example app'),
        ),
        body: Builder(
          builder: (context) => SafeArea(
            child: ListView(
              shrinkWrap: true,
              children: [
                TextField(
                  onChanged: (value) {
                    entries.clear();
                    reader.find(value, count: 20).forEach((entry) {
                      for (var e in entry.value) {
                        entries.add(MapEntry(entry.key, e));
                      }
                    });

                    setState(() {});
                  },
                ),
                ...entries.map(
                  (e) => ListTile(
                    title: Text(e.key),
                    trailing: Text("${e.value}"),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          final entry = reader.get(e.value);

                          assert(entry.isNotEmpty);

                          return EntryView(entry: entry);
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EntryView extends StatelessWidget {
  const EntryView({super.key, required this.entry});

  final String entry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Entry view')),
      body: SingleChildScrollView(
        child: Center(
          child: Text(entry),
        ),
      ),
    );
  }
}

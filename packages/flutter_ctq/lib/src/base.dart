import 'package:ctq/ctq.dart';
import 'package:flutter_ctq/src/ffi/io.dart';

class FlutterCTQReader extends CTQReader {
  FlutterCTQReader(super.filename);

  static void ensureInitialized() => loadLibctq(createLibraryImpl());
  static String get maxSupportedVersion => CTQReader.maxSupportedVersion;
  static String get minSupportedVersion => CTQReader.maxSupportedVersion;
}

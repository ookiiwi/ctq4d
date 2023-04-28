import 'dart:ffi';

import 'package:ctq/generated/reader.g.dart' as g;
import 'package:ffi/ffi.dart';

g.CTQReader? reader;

class LibctqNotLoaded implements Exception {}

class CTQReaderError implements Exception {}

void loadLibctq(DynamicLibrary lib) {
  reader ??= g.CTQReader(lib);
}

typedef CTQFindResult = List<MapEntry<String, List<int>>>;

class CTQReader {
  late Pointer<g.ctq_ctx> _ctx;

  CTQReader(String filename) {
    _checkLibIsLoaded();

    _ctx = reader!.ctq_create_reader(filename.toNativeUtf8().cast());

    if (_ctx == nullptr) {
      throw CTQReaderError();
    }
  }

  static String get maxSupportedVersion => g.CTQ_WRITER_MAX_SUPPORTED_VERSION;
  static String get minSupportedVersion => g.CTQ_WRITER_MIN_SUPPORTED_VERSION;

  String get readerVersion {
    _checkLibIsLoaded();
    String ret = "";

    var rv = reader!.ctq_reader_version(_ctx);

    if (rv != nullptr) {
      ret = rv.cast<Utf8>().toDartString();
      malloc.free(rv);
    }

    return ret;
  }

  String get writerVersion {
    _checkLibIsLoaded();
    String ret = "";

    var rv = reader!.ctq_writer_version(_ctx);

    if (rv != nullptr) {
      ret = rv.cast<Utf8>().toDartString();
      malloc.free(rv);
    }

    return ret;
  }

  void close() {
    _checkLibIsLoaded();

    reader!.ctq_destroy_reader(_ctx);
  }

  CTQFindResult find(String keyword,
      {int offset = 0,
      int count = 20,
      int pathIdx = 0,
      String filter = "",
      int filterPathIdx = 0}) {
    _checkLibIsLoaded();

    final ret = <MapEntry<String, List<int>>>[];

    using((arena) {
      print('search for $keyword with $filter');
      var rv = reader!.ctq_find(
        _ctx,
        keyword.toNativeUtf8().cast(),
        offset,
        count,
        pathIdx,
        filter.toNativeUtf8().cast(),
        filterPathIdx,
      );

      if (rv == nullptr) {
        return;
      }

      var e = rv.elementAt(0).ref;
      for (int i = 0; e.ids != nullptr; ++i) {
        final ids = <int>[];

        for (int j = 0; j < e.id_cnt; ++j) {
          ids.add(e.ids[j]);
        }

        ret.add(MapEntry(e.key.cast<Utf8>().toDartString(), ids));
        e = rv.elementAt(i + 1).ref;
      }

      reader!.ctq_find_ret_free(rv);
    });

    return ret;
  }

  String get(int id) {
    _checkLibIsLoaded();

    String entry = "";
    var rv = reader!.ctq_get(_ctx, id);

    if (rv != nullptr) {
      entry = rv.cast<Utf8>().toDartString();
      malloc.free(rv);
    }

    return entry;
  }

  Map<int, String> getAll(Iterable<int> ids) {
    final ret = <int, String>{};

    for (var e in ids) {
      ret[e] = get(e);
    }

    return ret;
  }

  void _checkLibIsLoaded() {
    if (reader == null) {
      throw LibctqNotLoaded();
    }
  }
}

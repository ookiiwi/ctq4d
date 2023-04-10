import 'dart:ffi';
import 'dart:io';

DynamicLibrary? _lib;

DynamicLibrary createLibraryImpl() {
  const base = 'ctq';

  if (Platform.isIOS) {
    _lib ??= DynamicLibrary.executable();
  } else {
    _lib ??= DynamicLibrary.open('lib$base.so');
  }

  return _lib!;
}

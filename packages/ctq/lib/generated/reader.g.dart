// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint
import 'dart:ffi' as ffi;

/// Binding of `headers/ctq_reader.h`
class CTQReader {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  CTQReader(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  CTQReader.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  ffi.Pointer<ctq_ctx> ctq_create_reader(
    ffi.Pointer<ffi.Char> filename,
  ) {
    return _ctq_create_reader(
      filename,
    );
  }

  late final _ctq_create_readerPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ctq_ctx> Function(
              ffi.Pointer<ffi.Char>)>>('ctq_create_reader');
  late final _ctq_create_reader = _ctq_create_readerPtr
      .asFunction<ffi.Pointer<ctq_ctx> Function(ffi.Pointer<ffi.Char>)>();

  void ctq_destroy_reader(
    ffi.Pointer<ctq_ctx> ctx,
  ) {
    return _ctq_destroy_reader(
      ctx,
    );
  }

  late final _ctq_destroy_readerPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ctq_ctx>)>>(
          'ctq_destroy_reader');
  late final _ctq_destroy_reader =
      _ctq_destroy_readerPtr.asFunction<void Function(ffi.Pointer<ctq_ctx>)>();

  ffi.Pointer<ctq_find_ret> ctq_find(
    ffi.Pointer<ctq_ctx> ctx,
    ffi.Pointer<ffi.Char> keyword,
    int offset,
    int count,
    int path_idx,
    ffi.Pointer<ffi.Char> filter,
    int filter_path_idx,
  ) {
    return _ctq_find(
      ctx,
      keyword,
      offset,
      count,
      path_idx,
      filter,
      filter_path_idx,
    );
  }

  late final _ctq_findPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ctq_find_ret> Function(
              ffi.Pointer<ctq_ctx>,
              ffi.Pointer<ffi.Char>,
              ffi.Size,
              ffi.Size,
              ffi.Int,
              ffi.Pointer<ffi.Char>,
              ffi.Int)>>('ctq_find');
  late final _ctq_find = _ctq_findPtr.asFunction<
      ffi.Pointer<ctq_find_ret> Function(ffi.Pointer<ctq_ctx>,
          ffi.Pointer<ffi.Char>, int, int, int, ffi.Pointer<ffi.Char>, int)>();

  ffi.Pointer<ffi.Char> ctq_get(
    ffi.Pointer<ctq_ctx> ctx,
    int id,
  ) {
    return _ctq_get(
      ctx,
      id,
    );
  }

  late final _ctq_getPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Char> Function(
              ffi.Pointer<ctq_ctx>, ffi.Uint64)>>('ctq_get');
  late final _ctq_get = _ctq_getPtr
      .asFunction<ffi.Pointer<ffi.Char> Function(ffi.Pointer<ctq_ctx>, int)>();

  ffi.Pointer<ffi.Char> ctq_writer_version(
    ffi.Pointer<ctq_ctx> ctx,
  ) {
    return _ctq_writer_version(
      ctx,
    );
  }

  late final _ctq_writer_versionPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Char> Function(
              ffi.Pointer<ctq_ctx>)>>('ctq_writer_version');
  late final _ctq_writer_version = _ctq_writer_versionPtr
      .asFunction<ffi.Pointer<ffi.Char> Function(ffi.Pointer<ctq_ctx>)>();

  ffi.Pointer<ffi.Char> ctq_reader_version(
    ffi.Pointer<ctq_ctx> ctx,
  ) {
    return _ctq_reader_version(
      ctx,
    );
  }

  late final _ctq_reader_versionPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Char> Function(
              ffi.Pointer<ctq_ctx>)>>('ctq_reader_version');
  late final _ctq_reader_version = _ctq_reader_versionPtr
      .asFunction<ffi.Pointer<ffi.Char> Function(ffi.Pointer<ctq_ctx>)>();

  void ctq_find_ret_free(
    ffi.Pointer<ctq_find_ret> arr,
  ) {
    return _ctq_find_ret_free(
      arr,
    );
  }

  late final _ctq_find_ret_freePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ctq_find_ret>)>>(
          'ctq_find_ret_free');
  late final _ctq_find_ret_free = _ctq_find_ret_freePtr
      .asFunction<void Function(ffi.Pointer<ctq_find_ret>)>();
}

class __mbstate_t extends ffi.Union {
  @ffi.Array.multi([128])
  external ffi.Array<ffi.Char> __mbstate8;

  @ffi.LongLong()
  external int _mbstateL;
}

class __darwin_pthread_handler_rec extends ffi.Struct {
  external ffi
          .Pointer<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>
      __routine;

  external ffi.Pointer<ffi.Void> __arg;

  external ffi.Pointer<__darwin_pthread_handler_rec> __next;
}

class _opaque_pthread_attr_t extends ffi.Struct {
  @ffi.Long()
  external int __sig;

  @ffi.Array.multi([56])
  external ffi.Array<ffi.Char> __opaque;
}

class _opaque_pthread_cond_t extends ffi.Struct {
  @ffi.Long()
  external int __sig;

  @ffi.Array.multi([40])
  external ffi.Array<ffi.Char> __opaque;
}

class _opaque_pthread_condattr_t extends ffi.Struct {
  @ffi.Long()
  external int __sig;

  @ffi.Array.multi([8])
  external ffi.Array<ffi.Char> __opaque;
}

class _opaque_pthread_mutex_t extends ffi.Struct {
  @ffi.Long()
  external int __sig;

  @ffi.Array.multi([56])
  external ffi.Array<ffi.Char> __opaque;
}

class _opaque_pthread_mutexattr_t extends ffi.Struct {
  @ffi.Long()
  external int __sig;

  @ffi.Array.multi([8])
  external ffi.Array<ffi.Char> __opaque;
}

class _opaque_pthread_once_t extends ffi.Struct {
  @ffi.Long()
  external int __sig;

  @ffi.Array.multi([8])
  external ffi.Array<ffi.Char> __opaque;
}

class _opaque_pthread_rwlock_t extends ffi.Struct {
  @ffi.Long()
  external int __sig;

  @ffi.Array.multi([192])
  external ffi.Array<ffi.Char> __opaque;
}

class _opaque_pthread_rwlockattr_t extends ffi.Struct {
  @ffi.Long()
  external int __sig;

  @ffi.Array.multi([16])
  external ffi.Array<ffi.Char> __opaque;
}

class _opaque_pthread_t extends ffi.Struct {
  @ffi.Long()
  external int __sig;

  external ffi.Pointer<__darwin_pthread_handler_rec> __cleanup_stack;

  @ffi.Array.multi([8176])
  external ffi.Array<ffi.Char> __opaque;
}

class ctq_ctx_internal extends ffi.Opaque {}

class ctq_find_ret extends ffi.Struct {
  external ffi.Pointer<ffi.Char> key;

  external ffi.Pointer<ffi.Uint64> ids;

  @ffi.Size()
  external int id_cnt;
}

typedef ctq_ctx = ctq_ctx_internal;

const String CTQ_WRITER_MAX_SUPPORTED_VERSION = '0.0.1';

const String CTQ_WRITER_MIN_SUPPORTED_VERSION = '0.0.1';

const int true1 = 1;

const int false1 = 0;

const int __WORDSIZE = 64;

const int __DARWIN_ONLY_64_BIT_INO_T = 1;

const int __DARWIN_ONLY_UNIX_CONFORMANCE = 1;

const int __DARWIN_ONLY_VERS_1050 = 1;

const int __DARWIN_UNIX03 = 1;

const int __DARWIN_64_BIT_INO_T = 1;

const int __DARWIN_VERS_1050 = 1;

const int __DARWIN_NON_CANCELABLE = 0;

const String __DARWIN_SUF_EXTSN = '\$DARWIN_EXTSN';

const int __DARWIN_C_ANSI = 4096;

const int __DARWIN_C_FULL = 900000;

const int __DARWIN_C_LEVEL = 900000;

const int __STDC_WANT_LIB_EXT1__ = 1;

const int __DARWIN_NO_LONG_LONG = 0;

const int _DARWIN_FEATURE_64_BIT_INODE = 1;

const int _DARWIN_FEATURE_ONLY_64_BIT_INODE = 1;

const int _DARWIN_FEATURE_ONLY_VERS_1050 = 1;

const int _DARWIN_FEATURE_ONLY_UNIX_CONFORMANCE = 1;

const int _DARWIN_FEATURE_UNIX_CONFORMANCE = 3;

const int __has_ptrcheck = 0;

const int __DARWIN_NULL = 0;

const int __PTHREAD_SIZE__ = 8176;

const int __PTHREAD_ATTR_SIZE__ = 56;

const int __PTHREAD_MUTEXATTR_SIZE__ = 8;

const int __PTHREAD_MUTEX_SIZE__ = 56;

const int __PTHREAD_CONDATTR_SIZE__ = 8;

const int __PTHREAD_COND_SIZE__ = 40;

const int __PTHREAD_ONCE_SIZE__ = 8;

const int __PTHREAD_RWLOCK_SIZE__ = 192;

const int __PTHREAD_RWLOCKATTR_SIZE__ = 16;

const int USER_ADDR_NULL = 0;

const int INT8_MAX = 127;

const int INT16_MAX = 32767;

const int INT32_MAX = 2147483647;

const int INT64_MAX = 9223372036854775807;

const int INT8_MIN = -128;

const int INT16_MIN = -32768;

const int INT32_MIN = -2147483648;

const int INT64_MIN = -9223372036854775808;

const int UINT8_MAX = 255;

const int UINT16_MAX = 65535;

const int UINT32_MAX = 4294967295;

const int UINT64_MAX = -1;

const int INT_LEAST8_MIN = -128;

const int INT_LEAST16_MIN = -32768;

const int INT_LEAST32_MIN = -2147483648;

const int INT_LEAST64_MIN = -9223372036854775808;

const int INT_LEAST8_MAX = 127;

const int INT_LEAST16_MAX = 32767;

const int INT_LEAST32_MAX = 2147483647;

const int INT_LEAST64_MAX = 9223372036854775807;

const int UINT_LEAST8_MAX = 255;

const int UINT_LEAST16_MAX = 65535;

const int UINT_LEAST32_MAX = 4294967295;

const int UINT_LEAST64_MAX = -1;

const int INT_FAST8_MIN = -128;

const int INT_FAST16_MIN = -32768;

const int INT_FAST32_MIN = -2147483648;

const int INT_FAST64_MIN = -9223372036854775808;

const int INT_FAST8_MAX = 127;

const int INT_FAST16_MAX = 32767;

const int INT_FAST32_MAX = 2147483647;

const int INT_FAST64_MAX = 9223372036854775807;

const int UINT_FAST8_MAX = 255;

const int UINT_FAST16_MAX = 65535;

const int UINT_FAST32_MAX = 4294967295;

const int UINT_FAST64_MAX = -1;

const int INTPTR_MAX = 9223372036854775807;

const int INTPTR_MIN = -9223372036854775808;

const int UINTPTR_MAX = -1;

const int INTMAX_MAX = 9223372036854775807;

const int UINTMAX_MAX = -1;

const int INTMAX_MIN = -9223372036854775808;

const int PTRDIFF_MIN = -9223372036854775808;

const int PTRDIFF_MAX = 9223372036854775807;

const int SIZE_MAX = -1;

const int RSIZE_MAX = 9223372036854775807;

const int WCHAR_MAX = 2147483647;

const int WCHAR_MIN = -2147483648;

const int WINT_MIN = -2147483648;

const int WINT_MAX = 2147483647;

const int SIG_ATOMIC_MIN = -2147483648;

const int SIG_ATOMIC_MAX = 2147483647;

const int __DARWIN_WCHAR_MAX = 2147483647;

const int __DARWIN_WCHAR_MIN = -2147483648;

const int __DARWIN_WEOF = -1;

const int _FORTIFY_SOURCE = 2;

const int NULL = 0;

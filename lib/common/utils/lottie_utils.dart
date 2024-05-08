import 'package:digital_stamp_quiz/common/extensions/extensions.dart';
import 'package:lottie/lottie.dart';

class LottieUtils {
  static Future<LottieComposition?> customDecoder(List<int> bytes) {
    return LottieComposition.decodeZip(bytes, filePicker: (files) {
      return files.firstWhereOrNull(
          (f) => f.name.startsWith('animations/') && f.name.endsWith('.json'));
    });
  }
}

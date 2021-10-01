import 'package:easy_localization/easy_localization.dart';

extension StringTranslate on String {
  String translate() {
    return this.tr();
  }
}

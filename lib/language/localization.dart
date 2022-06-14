

import 'package:ecommerce/language/ar.dart';
import 'package:ecommerce/language/en.dart';
import 'package:ecommerce/language/fr.dart';
import 'package:ecommerce/utils/my-strings.dart';
import 'package:get/get.dart';

class LocalizationApp extends Translations{
  @override
  Map<String, Map<String, String>> get keys =>{
    ene:en,
    ara:ar,
    frf:fr
  };

}
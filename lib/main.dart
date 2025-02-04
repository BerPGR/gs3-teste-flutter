import 'package:flutter/material.dart';
import 'package:gs3/app/app_widget.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting("pt_br").then((_) => runApp(const AppWidget()));
}
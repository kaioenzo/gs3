import 'package:flutter/material.dart';

import 'screens/homepage.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('pt_BR', null).then(
    (_) => runApp(
      const MaterialApp(
        title: 'GS3',
        home: Homepage(),
      ),
    ),
  );
}

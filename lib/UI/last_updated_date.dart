import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LastUpdatedDateFormatter {
  final DateTime lastUpdated;
  LastUpdatedDateFormatter({@required this.lastUpdated});
  String lastUpdatedStatusText() {
    if (lastUpdated != null) {
      final formatter = DateFormat.yMd().add_Hms();
      final formatted = formatter.format(lastUpdated);
      return 'Last updated: $formatted';
    }
    return '';
  }
}

class LastUpdatedDateStatus extends StatelessWidget {
  final String text;

  const LastUpdatedDateStatus({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        alignment: Alignment.center,
        height: 40,
        color: Colors.white,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.purple, fontWeight: FontWeight.w800, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static Future<DateTime> vShowDatePicker(BuildContext context, {DateTime? selectedDate, DateTime? startDate}) async {
    var data = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: startDate ?? DateTime.now(),
        lastDate: DateTime(
          DateTime.now().year + 1,
          12,
        ));

    return data ?? selectedDate!;
  }

  static String formatDate(String? date, {String? patern = "dd-MM-yyyy"}) {
    if (date == null || date == " ") {
      return "-";
    } else {
      try {
        var dateFormated = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").parse(date);
        return DateFormat(patern).format(dateFormated);
      } catch (_) {
        try {
          var dateFormated = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
          return DateFormat(patern).format(dateFormated);
        } catch (e) {
          try {
            var dateFormated = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(date);
            return DateFormat(patern).format(dateFormated);
          } catch (e) {
            try {
              var dateFormated = DateFormat("yyyy-MM-dd").parse(date);
              return DateFormat(patern).format(dateFormated);
            } catch (e) {
              return "-";
            }
          }
        }
      }
    }
  }

  static DateTime? formatDateToDateTime(String? date) {
    if (date == null || date == " ") {
      return null;
    } else {
      try {
        var dateFormated = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(date);
        return dateFormated;
      } catch (_) {
        try {
          var dateFormated = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
          return dateFormated;
        } catch (_) {
          return null;
        }
      }
    }
  }

  static int getIdDay(String day) {
    switch (day) {
      case "NONE":
        return 0;
      case "SENIN":
        return 1;
      case "SELASA":
        return 2;
      case "RABU":
        return 3;
      case "KAMIS":
        return 4;
      case "JUMAT":
        return 5;
      case "SABTU":
        return 6;
      default:
        return 0;
    }
  }

  static DateTime getLastDayOfMonth(DateTime date) {
    // Get the first day of the next month
    DateTime firstDayOfNextMonth = (date.month == 12) ? DateTime(date.year + 1, 1, 1) : DateTime(date.year, date.month + 1, 1);

    // Subtract one day from the first day of next month to get the last day of the current month
    return firstDayOfNextMonth.subtract(const Duration(days: 1));
  }

  static String getDateForImage() {
    return DateFormat("yyyyMMddhhmmss").format(DateTime.now());
  }

  static String formatPhoneNumber(String input) {
    // Hapus semua karakter non-digit (simbol, spasi, tanda +, dll)
    String cleaned = input.replaceAll(RegExp(r'[^\d]'), '');

    // Jika sudah diawali dengan 62, hapus 62 di depan
    if (cleaned.startsWith('62')) {
      cleaned = cleaned.substring(2);
    }

    // Hapus semua nol di depan setelah 62 dihapus
    cleaned = cleaned.replaceFirst(RegExp(r'^0+'), '');

    // Tambahkan 62 di depan
    String result = '62$cleaned';

    log('formatPhoneNumber: $result');
    return result;
  }

  static String encrypt(String input) {
    const original = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const substituted = "5678901234NOPQRSTUVWXYZABCDEFGHIJKLM";

    final buffer = StringBuffer();

    for (var char in input.characters) {
      final index = original.indexOf(char.toUpperCase());
      if (index != -1) {
        buffer.write(substituted[index]);
      } else {
        buffer.write(char); // karakter seperti '/' dan ';' tetap
      }
    }

    return buffer.toString();
  }
}

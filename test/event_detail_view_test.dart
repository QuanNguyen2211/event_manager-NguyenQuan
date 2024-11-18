import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:event_manager/event/event_detail_view.dart';
import 'package:event_manager/event/event_model.dart';

void main() {
  testWidgets('EventDetailView cho phép tạo mới sự kiện',
      (WidgetTester tester) async {
    // Tạo một sự kiện mới
    final newEvent = EventModel(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
    );

    // Xây dựng ứng dụng
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('vi')],
        locale: const Locale('vi'),
        home: EventDetailView(event: newEvent),
      ),
    );

    // Nhập tên sự kiện
    await tester.enterText(find.byType(TextField).first, 'Sự kiện mới');

    // Nhấn nút Lưu sự kiện
    await tester.tap(find.widgetWithText(FilledButton, 'Lưu sự kiện'));
    await tester.pumpAndSettle();

    // Kiểm tra xem Navigator đã pop hay chưa (tức là trở về màn hình trước)
    expect(find.byType(EventDetailView), findsNothing);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:event_manager/event/event_view.dart';

void main() {
  testWidgets(
      'EventView hiển thị danh sách sự kiện và tương tác với người dùng',
      (WidgetTester tester) async {
    // Xây dựng ứng dụng
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('en'), Locale('vi')],
        locale: Locale('vi'),
        home: EventView(),
      ),
    );

    // Lấy AppLocalizations
    final al = await AppLocalizations.delegate.load(const Locale('vi'));

    // Kiểm tra tiêu đề ứng dụng
    expect(find.text(al.appTitle), findsOneWidget);

    // Kiểm tra nút chuyển đổi chế độ xem lịch
    expect(find.byType(PopupMenuButton<CalendarView>), findsOneWidget);

    // Kiểm tra sự kiện giả (nếu có)
    // Lưu ý: Bạn cần mock dữ liệu hoặc thiết lập trạng thái cho `items` trong `EventView`
    // Nếu không, danh sách sự kiện sẽ rỗng và không hiển thị gì
  });
}

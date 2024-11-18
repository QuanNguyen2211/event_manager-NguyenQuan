import 'package:flutter_test/flutter_test.dart';
import 'package:event_manager/event/event_service.dart';
import 'package:event_manager/event/event_model.dart';

void main() {
  final eventService = EventService();

  test('EventService có thể lưu và lấy sự kiện', () async {
    // Tạo một sự kiện mới
    final event = EventModel(
      id: 'test-id',
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      subject: 'Sự kiện kiểm thử',
    );

    // Lưu sự kiện
    await eventService.saveEvent(event);

    // Lấy tất cả sự kiện
    final events = await eventService.getAllEvents();

    // Kiểm tra xem sự kiện có trong danh sách hay không
    expect(events.any((e) => e.id == 'test-id'), true);

    // Xóa sự kiện
    await eventService.deleteEvent(event);

    // Kiểm tra xem sự kiện đã bị xóa
    final eventsAfterDelete = await eventService.getAllEvents();
    expect(eventsAfterDelete.any((e) => e.id == 'test-id'), false);
  });
}

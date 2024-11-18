import 'package:flutter_test/flutter_test.dart';
import 'package:event_manager/event/event_model.dart';

void main() {
  group('EventModel Tests', () {
    test('EventModel instantiation', () {
      final event = EventModel(
        id: '1',
        startTime: DateTime(2023, 10, 1, 10, 0),
        endTime: DateTime(2023, 10, 1, 12, 0),
        isAllDay: false,
        subject: 'Meeting',
        notes: 'Discuss project updates',
        recurrenceRule: 'FREQ=DAILY;COUNT=10',
      );

      expect(event.id, '1');
      expect(event.startTime, DateTime(2023, 10, 1, 10, 0));
      expect(event.endTime, DateTime(2023, 10, 1, 12, 0));
      expect(event.isAllDay, false);
      expect(event.subject, 'Meeting');
      expect(event.notes, 'Discuss project updates');
      expect(event.recurrenceRule, 'FREQ=DAILY;COUNT=10');
    });

    test('EventModel copyWith', () {
      final event = EventModel(
        id: '1',
        startTime: DateTime(2023, 10, 1, 10, 0),
        endTime: DateTime(2023, 10, 1, 12, 0),
      );

      final updatedEvent = event.copyWith(
        subject: 'Updated Meeting',
        isAllDay: true,
      );

      expect(updatedEvent.subject, 'Updated Meeting');
      expect(updatedEvent.isAllDay, true);
      expect(updatedEvent.startTime, event.startTime);
      expect(updatedEvent.endTime, event.endTime);
    });

    test('EventModel toMap and fromMap', () {
      final event = EventModel(
        id: '1',
        startTime: DateTime(2023, 10, 1, 10, 0),
        endTime: DateTime(2023, 10, 1, 12, 0),
        subject: 'Meeting',
      );

      final map = event.toMap();
      final newEvent = EventModel.fromMap(map);

      expect(newEvent, equals(event));
    });

    test('EventModel toJson and fromJson', () {
      final event = EventModel(
        id: '2',
        startTime: DateTime(2023, 11, 1, 9, 0),
        endTime: DateTime(2023, 11, 1, 11, 0),
        subject: 'Conference',
      );

      final jsonStr = event.toJson();
      final newEvent = EventModel.fromJson(jsonStr);

      expect(newEvent, equals(event));
    });

    test('EventModel formatted time strings', () {
      final event = EventModel(
        startTime: DateTime(2023, 12, 25, 8, 30),
        endTime: DateTime(2023, 12, 25, 10, 30),
      );

      expect(event.formatedStartTimeString, '8:30, 25/12/2023');
      expect(event.formatedEndTimeString, '10:30, 25/12/2023');
    });
  });
}

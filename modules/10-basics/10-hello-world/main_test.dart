import 'package:test/test.dart';
import 'package:test_process/test_process.dart';

void main() {
  test('hello',  () async {
    var process = await TestProcess.start('dart', ['main.dart']);
    var firstLine = await process.stdout.next;
    expect(firstLine, equals('Hello, World!'));
  });
}


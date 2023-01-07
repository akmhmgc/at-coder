import 'dart:io';

void main() {
  var chars = stdin.readLineSync()?.split('');
  num count = 0;
  for (var char in chars!) {
    if (char == 'v') count++;
    if (char == 'w') count += 2;
  }
  print(count);
}

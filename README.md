# sgf_parser

a sgf file parser, can parse sgf string to a sgf tree object.

sgf格式围棋棋谱解析器

## dependencies
```
dependencies:
  sgf_parser:
    git: https://github.com/qhzhyt/dart-sgf-parser.git
```

## usage

```dart
import 'package:sgf_parser/parser.dart';
SGFParser parser = SGFParser();
SGFTree tree = parser.parse("(;CA[utf8])");
print(tree);
```

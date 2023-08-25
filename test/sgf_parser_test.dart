import 'package:flutter_test/flutter_test.dart';
import 'package:sgf_parser/parser.dart';

import 'test_data.dart';

void main() {
  test('adds one to input values', () {
    final parser = SGFParser();
    for (var sgf in sgfList) {
      SGFTree tree = parser.parse(sgf);
      print('=================');
      print(tree.root);
      print('--------------');
      print(tree.nodeList);
      print('--------------');
      for(int i = 0; i < tree.subTreeList.length; i++){
        print('-----========---------');
        print(tree.subTreeList[i].root);
        print('-----========---------');
        print(tree.subTreeList[i].nodeList);
        print('-----========---------');
        print(tree.subTreeList[i].subTreeList);
        print('-----========---------');
      }
      print('=================');
      expect(tree.toSGF(), sgf);
    }
    for (var sgf in sgflist2) {
      expect(parser.parse(sgf['source']!).toSGF(), sgf['expect']);
    }
    var tree = parser.parse(
        '(;CA[utf-8]AB[fb][ee][dd][ff][ec][bf]AW[cc][eg][ge][db][bd][df][fd][gg]CR[ff][dd][mg][eg][dj][jj][pj][jp][pp][dp][jd][pd][cc][mm][gm][ge]MA[gg]LB[sj:C][js:A][ja:B][aa:H][aj:D][as:E][ss:F][sa:G]AP[Sabaki:0.51.1]SZ[19]AB[ce]MULTIGOGM[1])');
    expect(tree.nodeList.first.attributes['AP']?.values[0].left, 'Sabaki');
    expect(tree.root.getAttribute('CA')!.toSGF(), 'CA[utf-8]');
    expect(tree.root.getAttribute('AB')!.getStringList(),
        ['fb', 'ee', 'dd', 'ff', 'ec', 'bf', 'ce']);
    expect(tree.root.getAttribute('LB')!.getStringMap(), {
      'sj': 'C',
      'js': 'A',
      'ja': 'B',
      'aa': 'H',
      'aj': 'D',
      'as': 'E',
      'ss': 'F',
      'sa': 'G'
    });
    //    print(tree.root.getAttribute('LB').getStringList());
    //    print(tree.root.getAttribute('LB').getString());
    //
    //    print(tree.root.getAttribute('LB').value);
    //
    //    print(tree.root['CA'].value);

    for (var sgf in toleranceSgf) {
      expect(parser.parse(sgf['source']!).toSGF(), sgf['expect']);
    }

    for (var sgf in errorSgfList) {
      try {
        parser.parse(sgf['source']!);
      } catch (exception) {
        print(exception);
        //expect(exception.toString(), sgf['expect']);
      }
    }
  });
}




import 'package:sgf_parser/parser.dart';

class GoSGFTree {

  bool isRoot = false;
  static SGFParser parser = SGFParser();
  late SGFTree sgfTree;
  GoSGFTree(this.sgfTree, {this.isRoot = true}){
    _buildTree();
  }

  _buildTree() {}

  GoSGFTree.fromCode(String code, {this.isRoot = true}) {
    sgfTree = parser.parse(code);
    _buildTree();
  }
}

//class GoSGF
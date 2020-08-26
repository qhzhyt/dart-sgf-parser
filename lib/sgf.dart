// sgf 文件数据结构对应的类

class SGFTree {
  List<SGFNode> nodeList;
  List<SGFTree> subTreeList;

  SGFTree(this.nodeList, this.subTreeList);

  @override
  String toString() {
    String text = '(\n';
    for (SGFNode node in nodeList) {
      text += '  ' + node.toString();
    }
    for (SGFTree subTree in subTreeList) {
      text += '  ' + subTree.toString();
    }
    text += ')\n';
    return text;
  }

  String toSGF() {
    String text = '(';
    for (SGFNode node in nodeList) {
      text += node.toSGF();
    }
    for (SGFTree subTree in subTreeList) {
      text += subTree.toSGF();
    }
    text += ')';
    return text;
  }

  SGFNode get root => nodeList?.first;
}

class SGFNode {
  Map<String, SGFAttribute> attributes;
  List<String> attributeNameList;

  SGFNode(this.attributeNameList, this.attributes);

  SGFAttribute getAttribute(String name) => this[name];

  SGFAttribute operator [](String name) {
    if (attributes.containsKey(name)) {
      return attributes[name];
    }
    return null;
  }

  @override
  String toString() {
    String text = ';';
    for (var key in attributeNameList) {
      var value = attributes[key];
      text += value.toString();
    }

    text += '\n';
    return text;
  }

  String toSGF() {
    String text = ';';
    for (var key in attributeNameList) {
      var value = attributes[key];
      text += value.toSGF();
    }
    return text;
  }
}

class SGFAttribute {
  String name;
  List<SGFValue> values = List<SGFValue>();

  SGFAttribute(this.name);

  get value => values.map((value) => value.toString()).toList().join();

  void addValue(SGFValue value) {
    values.add(value);
  }

  String getString() => values.first?.getString();

  int getInt() => values.first?.getInt();

  double getFloat() => values.first?.getFloat();

  List<String> getStringList() =>
      values.map((value) => value.getString()).toList();

  Map<String, String> getStringMap() {
    Map<String, String> result = Map<String, String>();
    for (var value in values) {
      if (value.left != null && value.left != null) {
        result[value.left] = value.right;
      }
    }
    return result;
  }

  @override
  String toString() {
    String text = name;
    if (values.length > 0) {
      for (SGFValue value in values) {
        text += value.toString();
      }
    } else {
      text += '[]';
    }
    return text;
  }

  toSGF() {
    String text = name;
    if (values.length > 0) {
      for (SGFValue value in values) {
        text += value.toSGF();
      }
    } else {
      text += '[]';
    }
    return text;
  }
}

class SGFValue {
  String left;
  String right;

  SGFValue(this.left, {this.right});

  String get value => getString();

  String getString() {
    if (left == null) {
      return null;
    }
    if (right == null) {
      return left;
    }
    return left + ':' + right;
  }

  int getInt() {
    return int.tryParse(left) ?? 0;
  }

  double getFloat() {
    return double.tryParse(left) ?? 0.0;
  }

  @override
  String toString() {
    if (left == null) {
      return '[]';
    }

    if (right == null) {
      return '[' + left + ']';
    }

    return '[' + left + ':' + right + ']';
  }

  String toSGF() {
    if (left == null) {
      return '[]';
    }
    if (right == null) {
      return '[' + left + ']';
    }
    return '[' + left + ':' + right + ']';
  }
}

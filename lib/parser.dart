import 'dart:collection';

import 'package:sgf_parser/sgf.dart';

export 'package:sgf_parser/sgf.dart';

enum ParseStatus { INIT, STATUS, TREE, NODE, ATTRIBUTE, VALUE }

skipBlankChar(current, next) {
  while ([' ', '\t', '\n', '\r', '\r\n',].indexOf(current()) > 0) {
    next();
  }
}

class SGFParser {
  SGFTree parseTree(current, next, exception) {
    List<SGFNode> nodeList = [];
    List<SGFTree> subTreeList = [];

    skipBlankChar(current, next);
    while (current() != null) {
      switch (current()) {
        case ';':
          next();
          SGFNode node = parseNode(current, next, exception);
          nodeList.add(node);
          break;
        case '(':
          next();
          SGFTree subTree = parseTree(current, next, exception);
          next();
          subTreeList.add(subTree);
          skipBlankChar(current, next);
          break;
        case ')':
          return SGFTree(nodeList, subTreeList);
        default:
          throw exception("Expected a ';', '(' or ')', but got '${current()}'");
      }
    }
    return SGFTree(nodeList, subTreeList);
  }

  SGFTree parse(String code) {
    int length = code.length;
    int pos = 0;

    next() {
      pos++;
      if (pos < length) {
        return code[pos];
      }
      return null;
    }

    current() {
      if (pos < length) {
        return code[pos];
      }
      return null;
    }

    exception(reason) {
      return Exception("$pos: sgf parse fail, $reason");
    }

    skipBlankChar(current, next);
    if (current() == '(') {
      next();
      return parseTree(current, next, exception);
    } else {
      throw exception("SGF should start with '('");
    }
  }

  SGFNode parseNode(current, next, exception) {
    skipBlankChar(current, next);
    Map<String, SGFAttribute> attributes = HashMap<String, SGFAttribute>();

    SGFAttribute? currentAttribute = null;

    List<String> attributeNameList = [];

    while (current() != null) {
      switch (current()) {
        case '[':

          if(currentAttribute == null) {
            throw exception("Expected a attribute name, but got '${current()}'");
          }

          next();
          String lValue = parseValue(current, next, endChars: ']:');
          if (current() == ':') {
            next();
            String rValue = parseValue(current, next, endChars: ']');
            currentAttribute.addValue(SGFValue(lValue, right: rValue));
          } else {
            currentAttribute.addValue(SGFValue(lValue, right: ''));
          }
          if(current() != ']') {
            throw exception("Expected a ']', but got ${current() == null ? null : "'" + current() + "'"}");
          }
          skipBlankChar(current, next);
          next();
          skipBlankChar(current, next);
          break;
        case ';':
        case '(':
        case ')':
          if (currentAttribute != null) {
            if (!attributeNameList.contains(currentAttribute.name)) {
              attributeNameList.add(currentAttribute.name);
              attributes[currentAttribute.name] = currentAttribute;
            }
          }
          return SGFNode(attributeNameList, attributes);
        default:
          if (currentAttribute != null) {
            if (!attributeNameList.contains(currentAttribute.name)) {
              attributeNameList.add(currentAttribute.name);
              attributes[currentAttribute.name] = currentAttribute;
            }
          }

          if('~!#%^&*:;\'"\\'.contains(current())) {
            throw exception("Expected a attribute name, but got '${current()}'");
          }

          String attributeName =
              parseValue(current, next, endChars: '[ \n\r\t();:]');
          skipBlankChar(current, next);
          if(current() != '[') {
            throw exception("Expected a '[', but got ${current() == null ? null : "'" + current() + "'"}");
          }
          if (attributeNameList.contains(attributeName)) {
            currentAttribute = attributes[attributeName]!;
          } else {
            currentAttribute = SGFAttribute(attributeName);
          }
          skipBlankChar(current, next);
      }
    }
    if(currentAttribute != null) {
      throw exception("Attribute '${currentAttribute.name}' need at least one value");
    }
    return SGFNode(attributeNameList, attributes);
  }

  String parseValue(current, next, {endChars = '[ '}) {
    bool escape = false;
    String result = '';
    while (current() != null) {
      if (escape) {
        result += current();
        escape = false;
      } else {
        if (endChars.contains(current())) {
          return result;
        }
        if (current() == '\\') {
          escape = true;
        } else {
          result += current();
        }
      }
      next();
    }

    return result;
  }
}

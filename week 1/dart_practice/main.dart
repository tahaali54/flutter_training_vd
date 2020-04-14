import 'dart:io';
import 'dart:math';

main() {
  Solution obj = new Solution();
  obj.analyzeFile();
  obj.calculateLineWithHighestFrequency();
  obj.printHighestWordFrequencyAcrossLines();

  //user input
  //var line = stdin.readLineSync();
}

class Solution {
  List<LineAnalyzer> analyzers = List();
  int highestCountAcrossLines = 0;
  List<LineAnalyzer> highestCountWordsAcrossLines = List();

  void analyzeFile() {
    List<String> text = File('file.txt').readAsStringSync().split('\n');
    int lineNumber = 0;
    text.forEach((line) {
      analyzers.add(LineAnalyzer(line, lineNumber += 1));
    });
  }

  void calculateLineWithHighestFrequency() {
    analyzers.forEach((analyzer) {
      if (analyzer.highestWfCount > highestCountAcrossLines) {
        highestCountAcrossLines = analyzer.highestWfCount;
      }
    });
    analyzers.forEach((analyzer) {
      if (analyzer.highestWfCount == highestCountAcrossLines) {
        highestCountWordsAcrossLines.add(analyzer);
      }
    });
  }

  void printHighestWordFrequencyAcrossLines() {
    print('The following words have the highest word frequency per line:');
    highestCountWordsAcrossLines.forEach((analyzer) {
      print(
          '${analyzer.highestWfWords} (appears in line ${analyzer.lineNumber})');
    });
  }
}

class LineAnalyzer {
  LineAnalyzer(this.content, this.lineNumber) {
    calculateWordFrequency();
  }
  String content;
  int lineNumber;
  int highestWfCount = 0;
  List<String> highestWfWords = List();

  void calculateWordFrequency() {
    List<String> splitContent = content.toLowerCase().split(' ');
    Map<String, int> words = Map();
    for (String item in splitContent) {
      if (words.containsKey(item)) {
        words[item] = words[item] + 1;
      } else {
        words[item] = 0;
      }
    }
    highestWfCount = words.values.reduce(max);
    words.forEach((key, value) {
      if (value == highestWfCount) {
        highestWfWords.add(key);
      }
    });
  }
}

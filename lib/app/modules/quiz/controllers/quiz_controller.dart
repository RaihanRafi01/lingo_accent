import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class QuizController extends GetxController {
  final List<String> wordChoices = [
    'Is',
    'Ujan',
    'Your',
    'Whats',
    'May',
    'We',
    'Name'
  ];

  RxInt totalBlanks = 0.obs;
  final sentenceWords = <String>[].obs;
  RxMap<String, bool> wordUsed = <String, bool>{}.obs; // Tracks used words
  final stt.SpeechToText speechToText = stt.SpeechToText();
  RxBool isListening = false.obs;

  // Computed sentence string
  RxString get constructedSentence => RxString(sentenceWords.join(" "));

  @override
  void onInit() {
    super.onInit();
    _initSpeech();
    for (var word in wordChoices) {
      wordUsed[word] = false; // Initially setting to false
    }
    wordUsed.refresh(); // This will notify the UI of changes to wordUsed
  }

  void addWordToSentence(String word) {
    if (sentenceWords.length < totalBlanks.value) {
      sentenceWords.add(word);
      wordUsed.update(word, (value) => true,
          ifAbsent: () => true); // Ensure update
    }
  }

  Future<void> _initSpeech() async {
    bool available = await speechToText.initialize();
    if (!available) {
      print("Speech recognition not available");
    }
  }

  void startListening() async {
    if (!speechToText.isAvailable) return;

    isListening.value = true;
    await speechToText.listen(
      onResult: (result) {
        print('::::::::::::::::::::${result.recognizedWords}');
        String recognizedWord = result.recognizedWords;
        _processRecognizedWord(recognizedWord);
      },
    );
  }

  void stopListening() {
    isListening.value = false;
    speechToText.stop();
  }

  void _processRecognizedWord(String sentence) {
    // Split the sentence into words
    List<String> recognizedWords = sentence.split(' ');

    // Iterate through the recognized words
    for (String word in recognizedWords) {
      // Normalize the recognized word
      String normalizedWord =
          word.toLowerCase().replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

      // Check if the normalized word matches any word in wordChoices
      String matchedWord = wordChoices.firstWhere(
        (choice) => choice.toLowerCase() == normalizedWord,
        orElse: () => '',
      );

      // If a match is found, add it to the sentence
      if (matchedWord.isNotEmpty && !wordUsed[matchedWord]!) {
        addWordToSentence(matchedWord);
        wordUsed[matchedWord] = true;
      }
    }
  }

  void resetSentence() {
    sentenceWords.clear();
    wordUsed.updateAll((key, value) => false);
  }
}

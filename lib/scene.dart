// scene.dart — Data Model
// "The Quiet" — Choose Your Own Adventure
//
// Mirrors the role of question.dart from the Quizzer project.

class Scene {
  final String storyText;     // narrative text shown to the player
  final String imageAsset;    // asset path for the scene illustration
  final String? audioAsset;   // optional asset path for background music or sound
  final List<String> choices; // button labels the player sees
  final List<int> nextScenes; // next scene index per choice — parallel to choices

  const Scene({
    required this.storyText,
    required this.imageAsset,
    this.audioAsset,
    required this.choices,
    required this.nextScenes,
  });

  // Returns true when the scene has no choices, meaning it is an ending
  bool get isEnding => choices.isEmpty;
}

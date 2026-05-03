// main.dart — UI Entry Point
// "The Quiet" — Choose Your Own Adventure

import 'package:flutter/material.dart';
// TODO: uncomment once audioplayers is wired
// import 'package:audioplayers/audioplayers.dart';
import 'StoryBrain.dart';

StoryBrain storyBrain = StoryBrain();

void main() => runApp(const ChooseAdventure());

class ChooseAdventure extends StatelessWidget {
  const ChooseAdventure({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Quiet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A3A4A),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFF0D1B22),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0A1520),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'THE QUIET',
            style: TextStyle(
              color: Color(0xFFB0D4E0),
              fontSize: 14,
              letterSpacing: 4,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: StoryPage(),
          ),
        ),
      ),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  // TODO: add AudioPlayer field here once audioplayers is wired
  // final AudioPlayer _bgPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // TODO: start looping ambient audio here
    // _startAmbient();
  }

  // TODO: uncomment once audioplayers is ready
  // Future<void> _startAmbient() async {
  //   await _bgPlayer.setReleaseMode(ReleaseMode.loop);
  //   await _bgPlayer.play(AssetSource('audio/ambient.mp3'));
  // }

  // Called when the player taps a choice button.
  // choiceIndex is the button's position in getChoices() list.
  // nextScene() looks up nextScenes[choiceIndex] to find the target scene.
  void makeChoice(int choiceIndex) {
    setState(() {
      storyBrain.nextScene(choiceIndex);
      if (storyBrain.isGameOver()) {
        _showEndingDialog();
      }
    });
  }

  // Ending popup: shows which ending reached + Restart button
  void _showEndingDialog() {
    // TODO: play ending sting and stop background music here
    // _bgPlayer.stop();
    // AudioPlayer().play(AssetSource('audio/ending_sting.mp3'));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            backgroundColor: const Color(0xFF1A2C35),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: const BorderSide(color: Color(0xFF3A6070), width: 1),
            ),
            title: Text(
              storyBrain.getEndingType().toUpperCase(),
              style: const TextStyle(
                color: Color(0xFFB0D4E0),
                fontSize: 13,
                letterSpacing: 3,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            content: const Text(
              'Would you like to start over?',
              style: TextStyle(color: Color(0xFF8AABB8), fontSize: 15),
              textAlign: TextAlign.center,
            ),
            actions: [
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF1E4D60),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      storyBrain.restart();
                    });
                    Navigator.of(ctx).pop();
                  },
                  child: const Text(
                    'RESTART',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    });
  }

  // Builds one button per choice using getChoices().
  // List.generate keeps index i in sync with nextScenes[i] via nextScene(i).
  List<Widget> buildChoiceButtons() {
    final List<String> choices = storyBrain.getChoices();

    return List.generate(choices.length, (i) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: SizedBox(
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFF1A3A4A),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
                side: const BorderSide(color: Color(0xFF2D5E74), width: 1),
              ),
            ),
            onPressed: () => makeChoice(i),
            child: Text(
              choices[i],
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFCDE8F0),
                fontSize: 15,
                height: 1.4,
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        // Scene image
        Expanded(
          flex: 3,
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            child: Image.asset(
              storyBrain.getSceneImage(),
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Scene text
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
            child: Text(
              storyBrain.getStoryText(),
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFFD4EAF2),
                height: 1.75,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Choice buttons
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: buildChoiceButtons(),
        ),

      ],
    );
  }
}

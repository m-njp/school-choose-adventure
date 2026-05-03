// StoryBrain.dart Story Logic Controller
// "The Quiet" Choose Your Own Adventure
//
// Scene index map (15 scenes total):
//   0  → The Apartment         (2 choices)  Decision point
//   1  → Maren                 (2 choices)  Decision point
//   2  → The Journal           (2 choices)  Decision point
//   3  → The Clinic            (3 choices)  Decision point
//   4  → The Holdouts          (2 choices)  Decision point
//   5  → Solo Journey          (3 choices)  Decision point
//   6  → Maren Confrontation   (2 choices)  Decision point
//   7  → You at the Lab        (2 choices)  Decision point
//   8  → Cold Storage          (2 choices)  Decision point
//   9  → Project RENEWAL       (2 choices)  Decision point
//  10  → Holdout Ending        (0 choices)  NEUTRAL ENDING
//  11  → Counteragent Decision (2 choices)  Decision point
//  12  → The Quiet Remains     (0 choices)  BAD ENDING
//  13  → Good Ending           (0 choices)  GOOD ENDING
//  14  → The Rooftop           (1 choice)   Transition scene

import 'scene.dart';

class StoryBrain {
  int _currentSceneIndex = 0;

  // Source: story.md (V3). Image filenames follow prompt.md naming.
  // TODO: when audio is wired up, also trigger sounds here or in main.dart.
  final List<Scene> _storyData = [
    // Scene 0 The Apartment
    // Image: scene_apartment.png (POV from couch, journal on table)
    // TODO: confirm image is finalized before adding Image.asset call in main.dart
    Scene(
      storyText:
          'You wake on a couch. Sunlight pours through the window. The city outside '
          'looks normal: cars, pedestrians, all fine.\n\n'
          'On the coffee table, a journal is open to a page covered in your handwriting:\n\n'
          '"Don\'t trust Maren. Don\'t drink the water. Find the lab. Destroy the supply. '
          'You\'ve done this before."\n\n'
          'You don\'t remember writing this. Your head aches. On the fridge, a photo: '
          'you and a younger woman laughing. Written on the back: "Lena, 24th." You feel '
          'something heavy when you look at it. But you can\'t remember why.\n\n'
          'A knock at the door. Your neighbor, Maren. "Hey. You\'ve been in there for '
          'two days. Are you okay?"',
      imageAsset: 'assets/images/scene_apartment.png',
      choices: [
        'Open the door and talk to Maren',
        'Ignore the door and read more of the journal',
      ],
      nextScenes: [1, 2],
    ),

    // Scene 1 Maren
    // Image: scene_maren_alt.png (over-the-shoulder, Maren in doorway)
    // Note: the generated file is scene_maren_alt.png, not scene_maren.png
    Scene(
      storyText:
          'Maren steps inside. She seems genuinely worried, not Quiet-calm, but '
          'human-worried. She tells you things have gotten worse outside. More people '
          'Settling every day. The water treatment plant on the east side has been '
          'running nonstop.\n\n'
          'She notices the photo on the fridge. "That\'s Lena, right? Your sister?" '
          'She pauses. "I saw her last week. She\'s fine. She looked... peaceful." '
          'The way she says peaceful makes your stomach turn.\n\n'
          '"There\'s a doctor," she says. "Dr. Voss. He used to work for Helios. '
          'He\'s hiding out in the old clinic on 5th Street. He says he knows how to '
          'make a counteragent." She glances out the window. "Or there\'s a group holed '
          'up at the reservoir. The Holdouts. They have clean water."',
      imageAsset: 'assets/images/scene_maren_alt.png',
      choices: [
        'Go to Dr. Voss at the clinic',
        'Go to the Holdouts at the reservoir',
      ],
      nextScenes: [3, 4],
    ),

    // Scene 2 The Journal
    // Image: scene_journal.png (close-up, Dutch angle on journal pages)
    Scene(
      storyText:
          'You ignore the knocking and flip through the journal. The entries are dated, '
          'stretching back weeks, but the handwriting deteriorates as you go further '
          'back, becoming shaky and erratic.\n\n'
          '"Day 1: I remember everything. I built S-17. God forgive me."\n\n'
          '"Day 3: Maren is Settled. She doesn\'t know it yet. She\'ll try to stop you '
          'at the lab, not from malice. She genuinely believes The Quiet is mercy."\n\n'
          '"Day 5: Lena visited today. She smiled at me and said she loved me. It sounded '
          'like a greeting card. Like something a stranger would say."\n\n'
          '"Day 7: I\'m taking the memory wipe. By the time you read this, you won\'t know '
          'who you are. Follow these instructions exactly."\n\n'
          'The knocking stops. Maren\'s footsteps fade.',
      imageAsset: 'assets/images/scene_journal.png',
      choices: [
        'Follow the journal, go to Dr. Voss alone',
        'Catch up to Maren in the hallway',
      ],
      nextScenes: [5, 1],
    ),

    // Scene 3 The Clinic (with Maren) 3 CHOICES
    // Image: scene_clinic.png (OTS shot at Dr. Voss in basement)
    Scene(
      storyText:
          'Maren leads you through quiet streets. The Settled walk past, smiling, '
          'waving. A woman waters plants that are already drowning. A man pushes an '
          'empty stroller, humming. Nobody stops you.\n\n'
          'Dr. Voss is in the basement of the clinic. He\'s gaunt, wired, clearly '
          'hasn\'t slept in days. He glances at Maren, then turns to you.\n\n'
          '"You\'ve read the journal." Not a question. "The original S-17 culture is '
          'in Helios Lab\'s cold storage. Without it, I can\'t make the counteragent. '
          'The lab is across the river. I have a keycard."\n\n'
          'He taps the table. "Only one of you should go. The other stays here to help '
          'me prep." He pauses. "Although... if you both go, you\'d get back faster. '
          'I\'d be alone here if anything happens, but speed matters."',
      imageAsset: 'assets/images/scene_clinic.png',
      choices: [
        'You go to the lab. Maren stays with Voss.',
        'Maren goes to the lab. You stay and help Voss.',
        'Both of you go. Voss can handle it alone.',
      ],
      nextScenes: [7, 6, 5],
    ),

    // Scene 4 The Holdouts
    // Image: scene_holdouts.png (wide establishing shot of compound)
    // Easter egg: a kid watching old video footage is in the background
    Scene(
      storyText:
          'The reservoir is surrounded by concrete walls topped with razor wire. '
          'The Warden, a man with a weathered face and hard eyes, meets you at '
          'the gate.\n\n'
          'Inside, roughly 40 people live in a tight community. Children argue over '
          'something trivial. A couple is fighting in the corner. Someone is crying, '
          'quietly, into their hands. It\'s messy, loud, alive in a way the city '
          'outside isn\'t.\n\n'
          'The Warden pulls you aside. "We survive. That\'s the plan." He studies you. '
          '"But I can see you\'re thinking about it. The lab. The cure."\n\n'
          'He leans in. "Your sister, Lena. She\'s out there right now, Settled. '
          'Smiling. Not suffering. If you cure her, you give her back every bad memory, '
          'every heartbreak, every nightmare she\'s ever had. All at once." He pauses. '
          '"You sure that\'s love?"',
      imageAsset: 'assets/images/scene_holdouts.png',
      choices: [
        'Stay with the Holdouts. Survive.',
        'Leave for Helios Labs on your own.',
      ],
      nextScenes: [10, 5],
    ),

    // Scene 5 Solo Journey to Helios 3 CHOICES
    // Image: scene_helios.png (one-point perspective, three corridors in lobby)
    Scene(
      storyText:
          'You follow the journal\'s instructions. It describes a route through the '
          'city that avoids major roads: alleys, rooftops, a drainage tunnel under '
          'the river. The journal is unnervingly accurate.\n\n'
          'The Helios compound is a sleek glass building, untouched. Settled employees '
          'are still inside, filing reports, cleaning floors, smiling. They don\'t '
          'stop you. They don\'t even look up.\n\n'
          'You stand in the lobby. Three hallways branch off from here:\n\n'
          '  Left: Cold Storage where the S-17 culture is kept.\n'
          '  Center: "Project RENEWAL, Authorized Personnel Only."\n'
          '  Right: A service corridor leading to the rooftop array.\n\n'
          'The journal said to get the culture. But something pulls at you.',
      imageAsset: 'assets/images/scene_helios.png',
      choices: [
        'Go to Cold Storage (get the S-17 culture)',
        'Investigate Project RENEWAL first',
        'Head to the rooftop array',
      ],
      nextScenes: [8, 9, 14],
    ),

    // Scene 6 Maren Confrontation (you stayed, Maren went to lab)
    // Image: scene_confrontation.png (low angle, Maren pushing vial toward viewer)
    Scene(
      storyText:
          'You stay with Dr. Voss. Maren takes the keycard and leaves.\n\n'
          'Hours pass. Voss works in silence. Then the door opens. Maren walks back '
          'in, but something has changed. She moves too smoothly. Her eyes are calm. '
          'Too calm. She sets the S-17 vial on the table gently.\n\n'
          '"I found it." She looks at you. "But I also found the RENEWAL files. '
          'Files with your name on them." A beat. "You made this. S-17. You."\n\n'
          'She continues, not angry. Just serene. "I drank the water at the lab. '
          'On purpose. I wanted to understand what The Quiet really was." She smiles. '
          '"There\'s no more fear. No more grief. I feel free."\n\n'
          'She pushes the vial toward you. "When Lena was crying every night after '
          'your parents died, when she couldn\'t get out of bed for six months, '
          'was that the life you want to give back to her?"',
      imageAsset: 'assets/images/scene_confrontation.png',
      choices: [
        'Take the vial. Go to Cold Storage for the full culture.',
        'She might be right. Maybe this is mercy.',
      ],
      nextScenes: [8, 11],
    ),

    // Scene 7 You at the Lab (Maren stayed)
    // Image: scene_lab.png (POV, reaching for the glowing amber culture)
    Scene(
      storyText:
          'You cross the river alone. The Helios compound is untouched. Settled '
          'employees wave at you from behind glass. You find Cold Storage on the '
          'third floor.\n\n'
          'The S-17 culture sits in a sealed container, glowing faintly amber. '
          'As you reach for it, you notice a monitor on the wall displaying a '
          'research log. The most recent entry:\n\n'
          '"Subject Zero: voluntary memory erasure complete. Subject released '
          'into the field with journal and counteragent instructions. '
          'Monitoring loop iteration: 4."\n\n'
          'Loop iteration 4. You\'ve done this four times.\n\n'
          'You grab the culture. Your phone buzzes. Maren: "Voss told me everything. '
          'You made this. You made all of this. I\'m not angry. Come back."',
      imageAsset: 'assets/images/scene_lab.png',
      choices: [
        'Return to the clinic with the culture',
        'Search for more answers in Project RENEWAL first',
      ],
      nextScenes: [11, 9],
    ),

    // Scene 8 Cold Storage
    // Image: scene_coldstorage.png (two-shot standoff with Settled technician)
    // Easter egg: one vial labeled "Batch 67" is visible in background racks
    Scene(
      storyText:
          'The room is sterile, white, humming with refrigeration units. Rows of '
          'sealed vials line the walls.\n\n'
          'At the center, behind a glass panel, the original S-17 culture. You use '
          'the keycard. The glass opens. The vial is warm in your hand.\n\n'
          'A gentle voice from behind you: "You don\'t have to take that."\n\n'
          'A Settled lab technician. She\'s smiling not threateningly. Just '
          'peacefully. "I\'ve seen your file. I know who you are. You created S-17 '
          'to help people. And it worked. There is no more suffering."\n\n'
          'She steps closer. "Your sister, Lena. She was diagnosed with severe '
          'depression three years ago. Chronic. Medication-resistant. She told her '
          'therapist she wanted to stop existing." The tech pauses. "S-17 gave her '
          'peace. Real peace. And you want to take that away?"',
      imageAsset: 'assets/images/scene_coldstorage.png',
      choices: [
        'Take the vial and leave. People deserve the choice.',
        'Maybe The Quiet saved the people I couldn\'t.',
      ],
      nextScenes: [11, 12],
    ),

    // Scene 9 Project RENEWAL
    // Image: scene_renewal.png (POV Dutch angle, watching your own video)
    Scene(
      storyText:
          'The RENEWAL wing is different. No smiling technicians. Emergency power '
          'only. The hallway is lined with sealed rooms each containing a bed, '
          'a desk, and a journal. Your handwriting.\n\n'
          'In the final room, a video terminal. You press play. Your own face stares '
          'back thinner, exhausted, undeniably you.\n\n'
          '"If you\'re watching this, the memory wipe worked. This is iteration four. '
          'I don\'t know how many more times I can do this."\n\n'
          '"Compound S-17 cannot be destroyed. The culture regenerates. The only way '
          'to stop The Quiet is the counteragent. But the counteragent reverses '
          'everything. Pain comes back. All of it. Every suppressed memory, every '
          'trauma, every hurt all at once. Some won\'t survive the shock."\n\n'
          '"Lena will remember everything. The depression. The months in bed. '
          'All of it, in one moment. I couldn\'t pull the trigger on that. '
          'That\'s why there\'s a loop."',
      imageAsset: 'assets/images/scene_renewal.png',
      choices: [
        'Take the vial to Voss. People deserve to feel.',
        'Some things should stay forgotten.',
      ],
      nextScenes: [11, 12],
    ),

    // Scene 10 The Holdouts NEUTRAL ENDING
    // Image: scene_holdout_ending.png (high angle from wall, Lena below in moonlight)
    Scene(
      storyText:
          'You stay.\n\n'
          'Days turn to weeks. The Holdouts become something like family: loud, '
          'messy, frustrating, real.\n\n'
          'But something starts to feel wrong. The arguments get quieter. The couple '
          'who used to fight every morning starts holding hands in silence. The woman '
          'who cried every night begins humming instead.\n\n'
          'You test the reservoir water. The strip turns amber.\n\n'
          'S-17. In the water. The Holdouts\' water.\n\n'
          'You confront the Warden. He doesn\'t flinch. "I found traces six weeks ago. '
          'It was already in the groundwater. There\'s no clean source left. So I '
          'made a choice."\n\n'
          'He\'s been Settled for weeks. And he\'s been making sure everyone follows.\n\n'
          'You sit on the wall that night. Beyond it, Lena is watering wildflowers '
          'in the dark. She hums your mother\'s song. And for the first time, '
          'you hum along.\n\n'
          'You don\'t notice when you stop feeling anything about it.\n\n'
          'There was never a safe choice.',
      imageAsset: 'assets/images/scene_holdout_ending.png',
      choices: [], // NEUTRAL ENDING no choices
      nextScenes: [],
    ),

    // Scene 11 The Counteragent Decision
    // Image: scene_counteragent.png (close-up: syringe between two hands, dawn light)
    Scene(
      storyText:
          'You return to Dr. Voss with the S-17 culture. He works through the night. '
          'By dawn, he holds up a single syringe filled with a clear liquid.\n\n'
          '"This is it. The counteragent. If we introduce this into the water supply, '
          'it will reverse S-17 in everyone within 72 hours." He sets it on the table. '
          '"But you watched the recording, didn\'t you?"\n\n'
          'He looks at you steadily. "The reversal isn\'t gentle. Every emotion S-17 '
          'suppressed comes back at full force. Grief. Anger. Pain. Trauma. All of it, '
          'all at once. Some people won\'t survive the psychological shock."\n\n'
          'He glances at the syringe. "Lena had severe depression before The Quiet. '
          'If we bring her back, we bring all of her back." He picks up his coat. '
          '"Or we don\'t use it. We let The Quiet continue. Hollow, maybe. But peaceful."\n\n'
          '"Your call. You made S-17. You made this counteragent. '
          'This is your responsibility."',
      imageAsset: 'assets/images/scene_counteragent.png',
      choices: [
        'Release the counteragent. Bring everyone back.',
        'Destroy the counteragent. Let The Quiet remain.',
      ],
      nextScenes: [13, 12],
    ),

    // Scene 12 The Quiet Remains BAD ENDING
    // Image: scene_quiet_ending.png (wide shot, park bench, beautiful but hollow)
    Scene(
      storyText:
          'You destroy the counteragent. The vial shatters on the floor.\n\n'
          'Dr. Voss watches the liquid seep between the tiles. Then, almost to '
          'himself: "Maybe that\'s the mercy." He walks to the window and breathes '
          'in deeply. He doesn\'t come back.\n\n'
          'Weeks pass. The clean water runs out. S-17 builds in your system. You feel '
          'it happening, the slow softening, the way your thoughts lose their edges, '
          'the way grief stops weighing anything.\n\n'
          'And then, one morning, The Quiet takes you.\n\n'
          'But it\'s not what you expected. You don\'t go blank. You hear them, all '
          'of them. A vast, collective hum. The Settled aren\'t hollow. They never were. '
          'They\'re aware. They chose this. Once the pain was gone, they could '
          'finally hear each other.\n\n'
          'A voice reaches you clear, familiar:\n\n'
          '"It took you long enough."\n\nLena.\n\n'
          '"I\'ve been waiting for you. Four iterations. I watched you struggle '
          'every single time. You had to choose it yourself."\n\n'
          'The Quiet isn\'t a disease. It\'s the next step. And you just took it.',
      imageAsset: 'assets/images/scene_quiet_ending.png',
      choices: [], // BAD ENDING no choices
      nextScenes: [],
    ),

    // Scene 13 Counteragent Released GOOD ENDING
    // Image: scene_good_ending.png (POV kneeling on Lena's kitchen floor)
    Scene(
      storyText:
          'You release the counteragent into the water supply.\n\n'
          'For 72 hours, nothing happens.\n\n'
          'Then, on the third morning: screaming.\n\n'
          'Not the scream of danger. The scream of feeling. All across the city, '
          'the Settled are waking up. The man with the empty stroller collapses '
          'onto the sidewalk, sobbing. The woman who watered drowning plants rips '
          'them from the soil, shaking.\n\n'
          'Then it hits you. Your own memories flood back like a dam breaking.\n\n'
          'You remember creating S-17. The day Lena called her voice flat and '
          'warm and wrong: "I love you." Like a greeting card. You remember the '
          'RENEWAL lab, the journal, the needle. Your last thought before the wipe: '
          '"If the next version of me is braver, maybe Lena gets to cry again."\n\n'
          'You\'re crying now. It hurts.\n\n'
          'You run to Lena\'s apartment. The door is open.\n\n'
          'Lena is on the kitchen floor. Very still.\n\n'
          'The counteragent brought everything back. For most people, '
          'overwhelming but survivable. But Lena, for Lena, "everything" was '
          'too much.\n\n'
          'The journal\'s last line: "Pain is the price of being alive."\n\n'
          'The price was Lena.\n\n'
          'You saved the world. Seven billion people will feel again. The loop '
          'is broken. By every measure, you succeeded.\n\n'
          'But you will spend the rest of your life knowing that you gave humanity '
          'back its pain, and the first person it took was your sister.',
      imageAsset: 'assets/images/scene_good_ending.png',
      choices: [], // GOOD ENDING no choices
      nextScenes: [],
    ),

    // Scene 14 The Rooftop (transition scene, 1 choice)
    // Image: scene_rooftop.png (wide panoramic, protagonist at railing)
    Scene(
      storyText:
          'You take the service corridor. Metal stairs, emergency lighting. The door '
          'at the top opens onto the roof of the Helios building.\n\n'
          'The communications array is here satellite dishes and antennas, still '
          'powered, still transmitting. A console blinks with a distress signal. '
          'Recorded in your voice, six weeks ago. Nobody answered.\n\n'
          'You try the radio manually. Static. Static. Static. Then a voice. '
          'Calm, pleasant, unhurried:\n\n'
          '"Hello? Oh, how wonderful. We haven\'t received a call in weeks. Is '
          'everything alright on your end?"\n\n'
          'You ask where they are. They say Geneva. You ask if people there have '
          'Settled. There\'s a gentle laugh.\n\n'
          '"Settled? Is that what you call it? That\'s sweet. Yes, we\'re all very '
          'well here. Very peaceful. You sound stressed. Are you drinking enough water?"\n\n'
          'You kill the radio.\n\n'
          'From up here, you can see the entire city. The Settled move below in '
          'patterns, synchronized, unhurried, like a single organism breathing. '
          'And beyond the skyline, in every direction: just stillness.\n\n'
          'S-17 is in every water system on earth. There is no "outside." '
          'The only choice is the one waiting for you downstairs.',
      imageAsset: 'assets/images/scene_rooftop.png',
      choices: ['Return to Dr. Voss with what you\'ve found'],
      nextScenes: [11],
    ),
  ];

  // Public getters
  String getStoryText() => _storyData[_currentSceneIndex].storyText;
  String getSceneImage() => _storyData[_currentSceneIndex].imageAsset;
  List<String> getChoices() => _storyData[_currentSceneIndex].choices;
  bool isGameOver() => _storyData[_currentSceneIndex].isEnding;

  // Returns the index each choice leads to used internally by nextScene()
  List<int> getNextScenes() => _storyData[_currentSceneIndex].nextScenes;

  // Advances to the scene at nextScenes[choiceIndex] replaces QuizBrain's nextQuestion()
  void nextScene(int choiceIndex) {
    _currentSceneIndex = _storyData[_currentSceneIndex].nextScenes[choiceIndex];
  }

  // Resets to the start (restart button)
  void restart() {
    _currentSceneIndex = 0;
  }

  // Returns a human-readable ending label for the dialog
  String getEndingType() {
    if (_currentSceneIndex == 10) return 'Neutral Ending';
    if (_currentSceneIndex == 12) return 'Bad Ending';
    if (_currentSceneIndex == 13) return 'Good Ending';
    return 'The End';
  }
}

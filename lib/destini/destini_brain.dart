import 'story.dart';

class DestiniBrain {
  int _currentStory = 0;
  bool showChoice2 = true;

  String getStoryTitle() {
    return _storyData[_currentStory].storyTitle;
  }

  String getChoice1() {
    return _storyData[_currentStory].choice1;
  }

  String getChoice2() {
    return _storyData[_currentStory].choice2;
  }

  void submitAnswer(int choice) {
    if (choice == 1) {
      _currentStory = _storyData[_currentStory].choice1Destination;
    } else {
      _currentStory = _storyData[_currentStory].choice2Destination;
    }
    if (_storyData[_currentStory].choice2.isEmpty) {
      showChoice2 = false; //If choice2 is empty, hide choice2
      return; //Ends the method by returning
    }
    showChoice2 = true;
  }

  List<Story> _storyData = [
    Story(
        storyID: 0,
        storyTitle:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choice1: 'I\'ll hop in. Thanks for the help!',
        choice2: 'Better ask him if he\'s a murderer first.',
        choice1Destination: 2,
        choice2Destination: 1),
    Story(
        storyID: 1,
        storyTitle: 'He nods slowly, unphased by the question.',
        choice1: 'At least he\'s honest. I\'ll climb in.',
        choice2: 'Wait, I know how to change a tire.',
        choice1Destination: 2,
        choice2Destination: 3),
    Story(
        storyID: 2,
        storyTitle:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choice1: 'I love Elton John! Hand him the cassette tape.',
        choice2: 'It\'s him or ! You take the knife and stab him.',
        choice1Destination: 5,
        choice2Destination: 4),
    Story(
        storyID: 3,
        storyTitle:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choice1: 'Restart',
        choice2: '',
        choice1Destination: 0),
    Story(
        storyID: 4,
        storyTitle:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choice1: 'Restart',
        choice2: '',
        choice1Destination: 0),
    Story(
        storyID: 5,
        storyTitle:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choice1: 'Restart',
        choice2: '',
        choice1Destination: 0),
  ];
}

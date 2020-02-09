import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPreferences sharedPreferences;

  Future<SharedPreferences> getSharedPrefs() async {
    if (sharedPreferences != null) {
      sharedPreferences = await SharedPreferences.getInstance();
    }
    return sharedPreferences;
  }

  Future<String> getHighScore() async {
    final sharedPreferences = await getSharedPrefs();
    int score = sharedPreferences.getInt('high_score');
    if (score == null) {
      score = 0;
    }
    return score.toString();
  }

  setHighScore(int score) async {
    final sharedPreferences = await getSharedPrefs();
    int highScore = sharedPreferences.getInt('high_score');
    if (highScore == null) {
      sharedPreferences.setInt('high_score', score);
    } else {
      if (score > highScore) {
        sharedPreferences.setInt('high_score', score);
      }
    }
  }
}

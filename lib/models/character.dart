import 'package:characters_app/models/skill.dart';
import 'package:characters_app/models/stats.dart';
import 'package:characters_app/models/vocation.dart';

class Character with Stats {
// Now character class graps all fields and methods defind in Stats mixin 
// and implements them here.

  // constructor
  Character({
    required this.name,
    required this.slogan,
    required this.vocation, // vocation."smth from kinds of vocations"
    required this.id
  });

  //fields
  final Set<Skill> skills = {};
  final Vocation vocation; //model vocation
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;


  // getters 
  bool get isFav => _isFav;


  //not fav at the begaining. 
  //_ means you cant access it from outside - only using the function

  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

 




}

// dummy char data

List<Character> characters = [
  Character(name: "khaled", slogan: 'Kapumf!', vocation: Vocation.wizard, id: '1'),
  Character(name: "Ahlam", slogan: 'best ever', vocation: Vocation.ninja, id: '2'),
  Character(name: "Lulu", slogan: 'my wife', vocation: Vocation.raider, id: '3'),
  Character(name: "Faisal", slogan: 'GOAT', vocation: Vocation.junkie, id: '4'),
  Character(name: "blah blah", slogan: 'GOAT', vocation: Vocation.wizard, id: '5'),
  Character(name: "Mo .. ", slogan: 'GOAT', vocation: Vocation.ninja, id: '6'),
  Character(name: "Yasser", slogan: 'GOAT', vocation: Vocation.junkie, id: '7'),





];
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'pokemon.g.dart';


@JsonSerializable()
@HiveType(typeId: 01)
class Pokemon {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? id;
  @HiveField(2)
  String? imageurl;
  @HiveField(3)
  String? xdescription;
  @HiveField(4)
  String? ydescription;
  @HiveField(5)
  String? height;
  @HiveField(6)
  String? category;
  @HiveField(7)
  String? weight;
  @HiveField(8)
  List<dynamic>? typeofpokemon;
  @HiveField(9)
  List<dynamic>? weaknesses;
  @HiveField(10)
  List<dynamic>? evolutions;
  @HiveField(11)
  List<dynamic>? abilities;
  @HiveField(12)
  int? hp;
  @HiveField(13)
  int? attack;
  @HiveField(14)
  int? defense;
  @HiveField(15)
  int? special_attack;
  @HiveField(16)
  int? special_defense;
  @HiveField(17)
  int? speed;
  @HiveField(18)
  int? total;
  @HiveField(19)
  String? male_percentage;
  @HiveField(20)
  String? female_percentage;
  @HiveField(21)
  int? genderless;
  @HiveField(22)
  String? cycles;
  @HiveField(23)
  String? egg_groups;
  @HiveField(24)
  String? evolvedfrom;
  @HiveField(25)
  String? reason;
  @HiveField(26)
  String? base_exp;


  // create a constructor for the above 

  Pokemon({
    this.name,
    this.id,
    this.imageurl,
    this.xdescription,
    this.ydescription,
    this.height,
    this.category,
    this.weight,
    this.typeofpokemon,
    this.weaknesses,
    this.evolutions,
    this.abilities,
    this.hp,
    this.attack,
    this.defense,
    this.special_attack,
    this.special_defense,
    this.speed,
    this.total,
    this.male_percentage,
    this.female_percentage,
    this.genderless,
    this.egg_groups,
    this.evolvedfrom,
    this.reason,
    this.base_exp
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

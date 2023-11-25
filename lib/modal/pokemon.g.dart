// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonAdapter extends TypeAdapter<Pokemon> {
  @override
  final int typeId = 1;

  @override
  Pokemon read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pokemon(
      name: fields[0] as String?,
      id: fields[1] as String?,
      imageurl: fields[2] as String?,
      xdescription: fields[3] as String?,
      ydescription: fields[4] as String?,
      height: fields[5] as String?,
      category: fields[6] as String?,
      weight: fields[7] as String?,
      typeofpokemon: (fields[8] as List?)?.cast<dynamic>(),
      weaknesses: (fields[9] as List?)?.cast<dynamic>(),
      evolutions: (fields[10] as List?)?.cast<dynamic>(),
      abilities: (fields[11] as List?)?.cast<dynamic>(),
      hp: fields[12] as int?,
      attack: fields[13] as int?,
      defense: fields[14] as int?,
      special_attack: fields[15] as int?,
      special_defense: fields[16] as int?,
      speed: fields[17] as int?,
      total: fields[18] as int?,
      male_percentage: fields[19] as String?,
      female_percentage: fields[20] as String?,
      genderless: fields[21] as int?,
      egg_groups: fields[23] as String?,
      evolvedfrom: fields[24] as String?,
      reason: fields[25] as String?,
      base_exp: fields[26] as String?,
    )..cycles = fields[22] as String?;
  }

  @override
  void write(BinaryWriter writer, Pokemon obj) {
    writer
      ..writeByte(27)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.imageurl)
      ..writeByte(3)
      ..write(obj.xdescription)
      ..writeByte(4)
      ..write(obj.ydescription)
      ..writeByte(5)
      ..write(obj.height)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.weight)
      ..writeByte(8)
      ..write(obj.typeofpokemon)
      ..writeByte(9)
      ..write(obj.weaknesses)
      ..writeByte(10)
      ..write(obj.evolutions)
      ..writeByte(11)
      ..write(obj.abilities)
      ..writeByte(12)
      ..write(obj.hp)
      ..writeByte(13)
      ..write(obj.attack)
      ..writeByte(14)
      ..write(obj.defense)
      ..writeByte(15)
      ..write(obj.special_attack)
      ..writeByte(16)
      ..write(obj.special_defense)
      ..writeByte(17)
      ..write(obj.speed)
      ..writeByte(18)
      ..write(obj.total)
      ..writeByte(19)
      ..write(obj.male_percentage)
      ..writeByte(20)
      ..write(obj.female_percentage)
      ..writeByte(21)
      ..write(obj.genderless)
      ..writeByte(22)
      ..write(obj.cycles)
      ..writeByte(23)
      ..write(obj.egg_groups)
      ..writeByte(24)
      ..write(obj.evolvedfrom)
      ..writeByte(25)
      ..write(obj.reason)
      ..writeByte(26)
      ..write(obj.base_exp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      name: json['name'] as String?,
      id: json['id'] as String?,
      imageurl: json['imageurl'] as String?,
      xdescription: json['xdescription'] as String?,
      ydescription: json['ydescription'] as String?,
      height: json['height'] as String?,
      category: json['category'] as String?,
      weight: json['weight'] as String?,
      typeofpokemon: json['typeofpokemon'] as List<dynamic>?,
      weaknesses: json['weaknesses'] as List<dynamic>?,
      evolutions: json['evolutions'] as List<dynamic>?,
      abilities: json['abilities'] as List<dynamic>?,
      hp: json['hp'] as int?,
      attack: json['attack'] as int?,
      defense: json['defense'] as int?,
      special_attack: json['special_attack'] as int?,
      special_defense: json['special_defense'] as int?,
      speed: json['speed'] as int?,
      total: json['total'] as int?,
      male_percentage: json['male_percentage'] as String?,
      female_percentage: json['female_percentage'] as String?,
      genderless: json['genderless'] as int?,
      egg_groups: json['egg_groups'] as String?,
      evolvedfrom: json['evolvedfrom'] as String?,
      reason: json['reason'] as String?,
      base_exp: json['base_exp'] as String?,
    )..cycles = json['cycles'] as String?;

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'imageurl': instance.imageurl,
      'xdescription': instance.xdescription,
      'ydescription': instance.ydescription,
      'height': instance.height,
      'category': instance.category,
      'weight': instance.weight,
      'typeofpokemon': instance.typeofpokemon,
      'weaknesses': instance.weaknesses,
      'evolutions': instance.evolutions,
      'abilities': instance.abilities,
      'hp': instance.hp,
      'attack': instance.attack,
      'defense': instance.defense,
      'special_attack': instance.special_attack,
      'special_defense': instance.special_defense,
      'speed': instance.speed,
      'total': instance.total,
      'male_percentage': instance.male_percentage,
      'female_percentage': instance.female_percentage,
      'genderless': instance.genderless,
      'cycles': instance.cycles,
      'egg_groups': instance.egg_groups,
      'evolvedfrom': instance.evolvedfrom,
      'reason': instance.reason,
      'base_exp': instance.base_exp,
    };

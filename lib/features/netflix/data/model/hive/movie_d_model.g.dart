// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_d_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDModelAdapter extends TypeAdapter<MovieDModel> {
  @override
  final int typeId = 1;

  @override
  MovieDModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDModel(
      id_: fields[0] as int,
      backdropPath_: fields[1] as String,
      title_: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id_)
      ..writeByte(1)
      ..write(obj.backdropPath_)
      ..writeByte(2)
      ..write(obj.title_);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

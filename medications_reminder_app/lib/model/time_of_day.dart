import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TimeOfDayAdapter extends TypeAdapter<TimeOfDay>{



  @override
  void write(BinaryWriter writer, TimeOfDay obj){
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..writeByte(obj.hour)
      ..writeByte(1)
      ..writeByte(obj.minute);
  }

  TimeOfDay read(BinaryReader reader){
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeOfDay(
      hour: fields[0] as int,
      minute: fields[1] as int
    );
  }

  @override
  int get typeId => 15;

}
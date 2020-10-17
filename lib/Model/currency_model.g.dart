// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) {
  return CurrencyModel(
    CAD: json['CAD'],
    HKD: json['HKD'],
    ISK: json['ISK'],
    PHP: json['PHP'],
    CZH: json['CZH'],
    AUD: json['AUD'],
    base: json['base'],
    DKK: json['DKK'],
    INR: json['INR'],
    RON: json['RON'],
    SEK: json['SEK'],
  );
}

Map<String, dynamic> _$CurrencyModelToJson(CurrencyModel instance) =>
    <String, dynamic>{
      'CAD': instance.CAD,
      'HKD': instance.HKD,
      'ISK': instance.ISK,
      'PHP': instance.PHP,
      'DKK': instance.DKK,
      'CZH': instance.CZH,
      'AUD': instance.AUD,
      'RON': instance.RON,
      'SEK': instance.SEK,
      'base': instance.base,
      'INR': instance.INR,
    };

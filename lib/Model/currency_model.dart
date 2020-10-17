import 'package:json_annotation/json_annotation.dart';

part 'currency_model.g.dart';

// Model class for getting the data

@JsonSerializable()
class CurrencyModel{
  double CAD;
  double HKD;
  double ISK;
  double PHP;
  double DKK;
  double CZH;
  double AUD;
  double RON;
  double SEK;
  double base;
  double INR;

  CurrencyModel({this.CAD,this.HKD,this.ISK,this.PHP,this.CZH,this.AUD,this.base,this.DKK,this.INR,this.RON,this.SEK});

  factory CurrencyModel.fromJson(Map<String,dynamic> json)=> _$CurrencyModelFromJson(json);
  Map<String,dynamic>toJson()=>_$CurrencyModelToJson(this);

}
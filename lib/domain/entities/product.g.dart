// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String?,
      price: json['price'] as String?,
      imageUrl: json['imageUrl'] as String?,
      productUrl: json['productUrl'] as String?,
      shop: json['shop'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'productUrl': instance.productUrl,
      'shop': instance.shop,
    };

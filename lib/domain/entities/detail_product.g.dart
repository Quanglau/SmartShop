// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailProduct _$DetailProductFromJson(Map<String, dynamic> json) =>
    DetailProduct(
      name: json['name'] as String?,
      price: json['price'] as String?,
      galleryImageUrls: (json['galleryImageUrls'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      compareProducts: (json['compareProducts'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      similarProducts: (json['similarProducts'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DetailProductToJson(DetailProduct instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'galleryImageUrls': instance.galleryImageUrls,
      'compareProducts': instance.compareProducts,
      'similarProducts': instance.similarProducts,
    };

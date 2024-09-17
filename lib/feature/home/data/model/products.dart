import 'package:json_annotation/json_annotation.dart';
part '../api/products.g.dart';
@JsonSerializable()
class Products {
    @JsonKey(name: "id")
    final int id;
    @JsonKey(name: "title")
    final String title;
    @JsonKey(name: "price")
    final double price;
    @JsonKey(name: "description")
    final String description;
    @JsonKey(name: "category")
    final Category category;
    @JsonKey(name: "image")
    final String image;
    @JsonKey(name: "rating")
    final Rating rating;

    Products({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image,
        required this.rating,
    });

    factory Products.fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);

    Map<String, dynamic> toJson() => _$ProductsToJson(this);
}

enum Category {
    @JsonValue("electronics")
    ELECTRONICS,
    @JsonValue("jewelery")
    JEWELERY,
    @JsonValue("men's clothing")
    MEN_S_CLOTHING,
    @JsonValue("women's clothing")
    WOMEN_S_CLOTHING
}

@JsonSerializable()
class Rating {
    @JsonKey(name: "rate")
    final double rate;
    @JsonKey(name: "count")
    final int count;

    Rating({
        required this.rate,
        required this.count,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

    Map<String, dynamic> toJson() => _$RatingToJson(this);
}

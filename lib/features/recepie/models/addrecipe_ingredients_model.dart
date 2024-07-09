import 'package:get/get.dart';

class RecipeIngredientModel {
  RxString name;
  RxString quantity;

  RecipeIngredientModel({required this.name, required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'Name': name.value,
      'Quantity': quantity.value,
    };
  }

  factory RecipeIngredientModel.fromJson(Map<String, dynamic> json) {
    return RecipeIngredientModel(
      name: (json['Name'] ?? '').obs,
      quantity: (json['Quantity'] ?? '').obs,
    );
  }
}

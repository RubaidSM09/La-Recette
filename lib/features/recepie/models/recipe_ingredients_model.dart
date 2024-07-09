class RecipeIngredientModel {
  String? name;
  String? quantity;

  RecipeIngredientModel({
    this.name,
    this.quantity,
  });

  /// Json Format
  toJson() {
    return {'Name': name, 'Quantity': quantity};
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory RecipeIngredientModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) return RecipeIngredientModel();

    return RecipeIngredientModel(
      name: data['Name'],
      quantity: data['Quantity'],
    );
  }
}
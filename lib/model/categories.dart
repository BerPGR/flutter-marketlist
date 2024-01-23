import 'package:listamercado/model/subcategories.dart';

class Categories {
  final String name;
  final List<Subcategories> subcategories;

  const Categories({required this.name, required this.subcategories});
}

Categories acougue =
    Categories(name: "Açougue", subcategories: [aves, bovinos]);

Categories bebidas = Categories(name: "Bebidas", subcategories: [
  aguas,
  cafes,
  chas,
  cervejas,
  refrigerantes,
  drinks,
  sucos,
  vinhos
]);

Categories frioEmbutidos =
    Categories(name: "Frios & Embutidos", subcategories: [embutidos, queijos]);

Categories hortifruti = Categories(
    name: "Hortifruti",
    subcategories: [frutas, verduras, legumes, temperos, ovos]);

Categories laticinios = Categories(
    name: "Laticínios",
    subcategories: [leites, mantemarga, cremRequeijao, iogurtes]);

Categories mercearia = Categories(name: "Mercearia", subcategories: [
  alimentosBasicos,
  biscSnacks,
  cereaisFarinha,
  conserEnla,
  docesGeleias,
  deterLimpeza
]);

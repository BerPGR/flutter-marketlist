class Subcategories {
  final String name;
  final List<String> products;

  const Subcategories({required this.name, required this.products});
}

Subcategories aguas = Subcategories(
    name: "Águas", products: ["Água de coco", "Água mineral", "Água tônica"]);

Subcategories cafes = Subcategories(name: "Cafés", products: [
  "Café em pó",
  "Café solúvel",
  "Café em cápsula",
  "Café em grãos"
]);

Subcategories chas =
    Subcategories(name: "Chás", products: ["Chá para infusão", "Chá pronto"]);

Subcategories sucos = Subcategories(name: "Sucos", products: [
  "Suco pronto",
  "Suco natural",
  "Suco integral",
  "Refresco",
  "Néctar"
]);

Subcategories cervejas = Subcategories(name: "Cervejas", products: [
  "Lager & Pilsen",
  "Ale",
  "Puro Malte",
  "Ipa",
  "Super Premium",
  "Outras"
]);

Subcategories refrigerantes =
    Subcategories(name: "Refrigerantes", products: ["Refrigerante", "Soda"]);

Subcategories drinks = Subcategories(name: "Destilados e Drinks", products: [
  "Xarope",
  "Conhaque, licor e rum",
  "Whisky",
  "Saquê",
  "Vodka",
  "Cachaça",
  "Gin"
]);

Subcategories vinhos = Subcategories(
    name: "Vinhos", products: ["Vinho Tinto", "Vinho Branco", "Vinho Rose"]);

Subcategories embutidos = Subcategories(
    name: "Embutidos",
    products: ["Salame", "Presunto", "Peito de Peru", "Salsicha", "Mortadela"]);

Subcategories queijos = Subcategories(
    name: "Queijos",
    products: ["Mussarela", "Parmesão", "Gorgonzola", "Queijo minas", "Outro"]);

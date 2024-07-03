class CategoriesModel{

  String slug;
  String name;
  String url;

  CategoriesModel({required this.slug, required this.name, required this.url});

  factory CategoriesModel.fromJSON(Map<String, dynamic> catJSON){

    return CategoriesModel(
      slug: catJSON['slug'],
      name: catJSON['name'],
      url: catJSON['url']
    );
  }


}
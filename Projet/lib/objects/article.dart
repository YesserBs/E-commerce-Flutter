class Article {
  String uid;
  String nom;
  List<String> image; // New field to store the images
  String marque;
  String type;
  String description;
  int prix;
  int added;

  Article({
    this.uid = '',
    this.nom = '',
    this.image = const [], // Initialize the image list as an empty list
    this.marque = '',
    this.type = '',
    this.description = '',
    this.prix = 0,
    this.added = 0,
  });
}

class Article {
  final String uid; // Unique identifier for the article document in Firestore
  final String nom;
  final String image;
  final String marque;
  final int prix;
  final int added;

  Article({
    required this.uid,
    required this.nom,
    required this.image,
    required this.marque,
    required this.prix,
    required this.added,
  });
}

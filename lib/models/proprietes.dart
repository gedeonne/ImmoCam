class Proprietes{
  final int? id;
  final String titre;
  final String description;
  final List<String> imgspath;
  final int proprietaireId;
  final double prix;

  Proprietes(this.id, {
    required this.titre,
    required this.description,
    required this.imgspath,
    required this.proprietaireId,
    required this.prix,
});
}
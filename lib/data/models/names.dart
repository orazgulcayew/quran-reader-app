class Name {
  final String id;
  final String arName;
  final String enName;
  final String meaning;
  final String explanation;
  final String benefit;

  Name.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        arName = json['arName'] as String,
        enName = json['enName'] as String,
        meaning = json['meaning'] as String,
        explanation = json['explanation'] as String,
        benefit = json['benefit'] as String;
}

class ActivityInfo {
  final String? date;
  final String? name;
  final String? category;
  final String? location;

  ActivityInfo({
    this.date,
    this.name,
    this.category,
    this.location,
  });

  factory ActivityInfo.fromJson(Map<String, dynamic> json) {
    return ActivityInfo(
      date: json['date'],
      name: json['name'],
      category: json['category'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': this.date,
      'name': this.name,
      'category': this.category,
      'location': this.location,
    };
  }
}

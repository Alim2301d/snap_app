class Wish{
  final String title;
  final bool isDone;

  Wish({required this.title, required this.isDone});

  Wish.fromJson(Map<dynamic,dynamic> json):
    title = json['title'] as String,
    isDone = json['isDone'] as bool;

  Map<dynamic,dynamic> toJson() => <dynamic,dynamic>{
    'title':title,
    'isDone':isDone,
  };  

  Map<String,dynamic> toMap() => <String,dynamic>{
    'title':title,
    'isDone':isDone,
  };

}
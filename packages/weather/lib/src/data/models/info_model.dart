import 'package:equatable/equatable.dart';

class Info extends Equatable {
  const Info({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      id: json['id'] as int,
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );
  }

  const Info.empty()
      : this(
          id: 0,
          main: '',
          description: '',
          icon: '',
        );

  final int id;
  final String main;
  final String description;
  final String icon;

  @override
  List<Object?> get props => [
        id,
        main,
        description,
        icon,
      ];
}

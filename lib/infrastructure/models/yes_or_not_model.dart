import 'package:yes_or_not_app/domain/entities/message.dart';

class YesOrNotModel {
  final String answer;
  final bool forced;
  final String image;

  YesOrNotModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesOrNotModel.fromJson(Map<String, dynamic> json) => YesOrNotModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'Si' : 'No', fromWho: FromWho.her, image: image);
}

import 'package:dio/dio.dart';
import 'package:yes_or_not_app/domain/entities/message.dart';
import 'package:yes_or_not_app/infrastructure/models/yes_or_not_model.dart';

class GetYesOrNotAnswer {
  final _dio = Dio(BaseOptions());

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesOrNotModel.fromJson(response.data);

    return yesNoModel.toMessageEntity();
  }
}

import 'package:app_mensajes/entities/message.dart';
import 'package:app_mensajes/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final responde = await _dio.get('https://yesno.wtf/api');

    final yesNomodel = YesNoModel.fromJsonMap(responde.data);

    return yesNomodel.toMessageEntity();
  }
}

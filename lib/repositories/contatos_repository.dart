import 'package:lista_contatos_dio/models/contatos_model.dart';
import 'package:lista_contatos_dio/repositories/custom_dio.dart';

class ContatosRepository{
  final _customDio = CustomDio();

  ContatosRepository();

  Future<ContatosModel> listarContatos() async {
    var url = "/contatos/";
    var result = await _customDio.dio.get(url);
    return ContatosModel.fromJson(result.data);
  }

  Future<ContatosModel> exibirContato(String id) async {
    var url = "/contatos/$id/";
    var result = await _customDio.dio.get(url);
    return ContatosModel.fromJsonUnico(result.data);
  }

  Future<void> adicionar(ContatoModel contatoModel) async {
    try {
      await _customDio.dio
          .post("/contatos/", data: contatoModel.toJsonEndpoint());
    } catch (e) {
      throw e;
    }
  }

  Future<void> atualizar(ContatoModel contatoModel) async {
    try {
      await _customDio.dio.put(
          "/contatos/${contatoModel.objectId}",
          data: contatoModel.toJsonEndpoint());
    } catch (e) {
      throw e;
    }
  }

  Future<void> remover(String objectId) async {
    try {
      await _customDio.dio.delete(
        "/contatos/$objectId",
      );
    } catch (e) {
      throw e;
    }
  }
}
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

  Future<void> adicionar(ContatoModel enderecoModel) async {
    try {
      await _customDio.dio
          .post("/contatos/", data: enderecoModel.toJsonEndpoint());
    } catch (e) {
      throw e;
    }
  }

  Future<void> atualizar(ContatoModel enderecoModel) async {
    try {
      await _customDio.dio.put(
          "/contatos/${enderecoModel.objectId}",
          data: enderecoModel.toJsonEndpoint());
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
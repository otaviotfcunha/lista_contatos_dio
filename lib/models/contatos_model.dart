class ContatosModel {
  List<ContatoModel> results = [];

  ContatosModel(this.results);

  ContatosModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <ContatoModel>[];
      json['results'].forEach((v) {
        results.add(ContatoModel.fromJson(v));
      });
    }
  }

  ContatosModel.fromJsonUnico(Map<String, dynamic> json) {
    results = <ContatoModel>[];
    results.add(ContatoModel.fromJson(json));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = results.map((v) => v.toJson()).toList();
      return data;
  }
}

class ContatoModel {
  String objectId = "";
  String nome = "";
  String telefone = "";
  String email = "";
  String foto = "";
  bool favorito = false;
  String createdAt = "";
  String updatedAt = "";

  ContatoModel(
      this.objectId,
      this.nome,
      this.telefone,
      this.email,
      this.foto,
      this.favorito,
      this.createdAt,
      this.updatedAt);

  ContatoModel.adicionar(this.nome, this.telefone, this.email, this.foto, this.favorito);
  ContatoModel.adicionaEAtualiza(this.objectId, this.nome, this.telefone, this.email, this.foto, this.favorito);

  ContatoModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    nome = json['nome'];
    telefone = json['telefone'];
    email = json['email'];
    foto = json['foto'];
    favorito = json['favorito'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['nome'] = this.nome;
    data['telefone'] = this.telefone;
    data['email'] = this.email;
    data['foto'] = this.foto;
    data['favorito'] = this.favorito;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }

  Map<String, dynamic> toJsonEndpoint() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = this.nome;
    data['telefone'] = this.telefone;
    data['email'] = this.email;
    data['foto'] = this.foto;
    data['favorito'] = this.favorito;
    return data;
  }
}

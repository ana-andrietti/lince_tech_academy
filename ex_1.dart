import 'dart:math' as math;

void main() {
  final meioDeComunicacao = aleatorio();
  meioDeComunicacao.fazerLigacao('(47) 99876-5432');
}

MeioDeComunicacao aleatorio() {
  final meiosDeComunicacao = <MeioDeComunicacao>[
    Telefone(),
    Celular(),
    Orelhao(),
  ];

  final random = math.Random();

  return meiosDeComunicacao[random.nextInt(
    meiosDeComunicacao.length,
  )];
}

MeioDeComunicacao Telefone() {
  return MeioDeComunicacao('TELEFONE');
}

MeioDeComunicacao Celular() {
  return MeioDeComunicacao('CELULAR');
}

MeioDeComunicacao Orelhao() {
  return MeioDeComunicacao('ORELHAO');
}

class MeioDeComunicacao {
  MeioDeComunicacao(this.name);
  
  String name;
  
  void fazerLigacao(String telefone){
    print('[$name] Ligando para $telefone');
  }
}

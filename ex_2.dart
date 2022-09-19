import 'dart:math';

void main() {
   final pessoa = Pessoa();
  final _random = Random();
  
  final fornecedores = <Fornecedor>[
    FornecedorDeBebidas(),
    FornecedorDeSanduiches(),
    FornecedorDeBolos(),
    FornecedorDePetiscos(),
    FornecedorDeSaladas(),
    FornecedorDeUltraCaloricos(),
  ];

   // Consumindo produtos fornecidos
   pessoa.refeicao(fornecedores[_random.nextInt(fornecedores.length)]);
   

   pessoa.informacoes();
  
   pessoa.status();
}

class Produto {
   Produto(this.nome, this.calorias);

   /// Nome deste produto
   final String nome;

   /// Total de calorias
   final int calorias;
}

abstract class Fornecedor {
  Produto fornecer();
}

class FornecedorDeBebidas extends Fornecedor {
   final _random = Random();
   final _bebidasDisponiveis = <Produto>[
      Produto('Agua', 0),
      Produto('Refrigerante', 200),
      Produto('Suco de fruta', 100),
      Produto('Energetico', 135),
      Produto('Café', 60),
      Produto('Cha', 35),
   ];

   /// Retorna um produto que pode ser consumido por um consumidor
   Produto fornecer() {
      return _bebidasDisponiveis[_random.nextInt(_bebidasDisponiveis.length)];
   }
}

class Pessoa {
   Pessoa() {
    _init();
   }
  
   void _init() {
     _caloriasConsumidas = 1000;
   }
  
   String _nivelCalorico = '';
   // Acumulador de calorias
   int _caloriasConsumidas = 0;
  
   int _refeicoes = 0;

   /// Imprime as informações desse consumidor
   void informacoes() {
      print('Calorias consumidas: $_caloriasConsumidas'
           '\nRefeições realizadas: $_refeicoes');
   }
  
  String formataStatus(Status status) {
    if(status == Status.deficitExtremo) {
      _nivelCalorico = 'Sim';
      return 'Deficit extremo de calorias';
    }
    
    if(status == Status.deficit) {
      _nivelCalorico = 'Sim';
      return 'Deficit de calorias';
    }
    
    if(status == Status.satisfeito) {
      _nivelCalorico = 'Não';
      return 'Pessoa está satisfeita';
    }
    
    if(status == Status.excessoCalorico) {
      _nivelCalorico = 'Não';
      return 'Excesso de calorias';
    }
    
    return '';
  }

   /// Consome um produto e aumenta o numero de calorias
   void refeicao(Fornecedor fornecedor) {
     _refeicoes += 1;
      final produto = fornecedor.fornecer();
      print('Consumindo ${produto.nome} (${produto.calorias} calorias)');

      _caloriasConsumidas += produto.calorias;
   }
  
  void status() {
      Status? status;
    
      if(_caloriasConsumidas <= 500) {
        status = Status.deficitExtremo;
      }
    
      if(_caloriasConsumidas > 500 && _caloriasConsumidas < 1800) {
        status = Status.deficit;
      }
    
      if(_caloriasConsumidas > 1800 && _caloriasConsumidas < 2500) {
        status = Status.satisfeito;
      }
    
      if(_caloriasConsumidas > 2500) {
        status = Status.excessoCalorico;
      }
    
      print('Status do nível de calorias: ${formataStatus(status!)}');
      print('Precisa de refeições? $_nivelCalorico');
  }
}

class FornecedorDeSanduiches extends Fornecedor {
   final _random = Random();
   final _sanduichesDisponiveis = <Produto>[
      Produto('Vegetariano', 0),
      Produto('Vegano', 200),
      Produto('Peito de peru', 100),
   ];

   /// Retorna um produto que pode ser consumido por um consumidor
   Produto fornecer() {
      return _sanduichesDisponiveis[_random.nextInt(_sanduichesDisponiveis.length)];
   }
}

class FornecedorDeBolos extends Fornecedor {
   final _random = Random();
   final _bolosDisponiveis = <Produto>[
      Produto('4 leites', 0),
      Produto('Morango', 200),
      Produto('Chocolate', 100),
      Produto('Prestígio', 135),
   ];

   /// Retorna um produto que pode ser consumido por um consumidor
   Produto fornecer() {
      return _bolosDisponiveis[_random.nextInt(_bolosDisponiveis.length)];
   }
}

class FornecedorDeSaladas extends Fornecedor {
   final _random = Random();
   final _saladasDisponiveis = <Produto>[
      Produto('Cesar Salad', 0),
      Produto('Natural', 200),
      Produto('Americana', 100),
   ];

   /// Retorna um produto que pode ser consumido por um consumidor
   Produto fornecer() {
      return _saladasDisponiveis[_random.nextInt(_saladasDisponiveis.length)];
   }
}

class FornecedorDePetiscos extends Fornecedor {
   final _random = Random();
   final _petiscosDisponiveis = <Produto>[
      Produto('Frios', 0),
      Produto('Ovo de codorna', 200),
      Produto('Pepino', 100),
      Produto('Ervilha', 135),
      Produto('Palmito', 60),
   ];

   /// Retorna um produto que pode ser consumido por um consumidor
   Produto fornecer() {
      return _petiscosDisponiveis[_random.nextInt(_petiscosDisponiveis.length)];
   }
}

class FornecedorDeUltraCaloricos extends Fornecedor {
   final _random = Random();
   final _ultraCaloricosDisponiveis = <Produto>[
      Produto('Hamburguer', 0),
      Produto('Pizza', 200),
      Produto('Sorvete', 100),
   ];

   /// Retorna um produto que pode ser consumido por um consumidor
   Produto fornecer() {
      return _ultraCaloricosDisponiveis[_random.nextInt(_ultraCaloricosDisponiveis.length)];
   }
}

enum Status {
  deficitExtremo,
  deficit,
  satisfeito,
  excessoCalorico,
}

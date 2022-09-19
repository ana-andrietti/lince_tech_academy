void main() {
  
  final biblioteca = Biblioteca();
  
  biblioteca.busca('Ana');
  
  final totalDuracao = biblioteca.calculaTotalDuracao();
  
  print('Músicas cadastradas: ${biblioteca.lista.toString()}'
       '\nTotal de músicas: ${biblioteca.lista.length}'
       '\nTempo total das músicas: $totalDuracao horas');
}

class Musica {
  Musica(this.titulo, this.artista, this.album, this.duracao);
  
  String titulo;
  String artista;
  String album;
  int duracao;
  
  @override
  toString() {
    return 'Título: $titulo, Artista: $artista, Álbum: $album';
  }
}

class Biblioteca {
  
  final lista = <Musica>[
    Musica('Abelha', 'Ana', 'Cerejeira', 2),
    Musica('Girassol', 'Felipe', 'Amora', 2),
    Musica('Rock', 'Lucas', 'Pêssego', 2),
  ];
  
  void busca(String? filtro) {
    Musica? musicaEncontrada;
    final result = lista.map((e) {
      if(filtro == e.titulo || filtro == e.artista || filtro == e.album) {
        return e;
      }
    });
    
    print('Música encontrada: ${result.toString()}');
  }
  
  String calculaTotalDuracao() {
    var duracaoTotal = 0;
    
    for(final it in lista) {
      duracaoTotal += it.duracao;
    }
    
    return duracaoTotal.toString();
  }
}

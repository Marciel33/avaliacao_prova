import 'package:tratamento_excecoes/models/console_Utils.dart';
import 'package:tratamento_excecoes/models/exeception/nome_invalido_exception.dart';
import 'models/Aluno.dart';

void excute() {
  print("Bem Vindo ao Sistema de Notas!");
  String nome = ConsoleUtils.lerStringComTexto("Digite o nome do aluno: ");

  if (nome.trim() == "") {
    throw NomeInvalidoException();
  }
  var aluno = Aluno(nome);
  double? nota;
  do {
    nota = ConsoleUtils.lerDoubleComTextoComSaida(
        "Digite a nota ou S para sair", "S");
    if (nota != null) {
      aluno.adicionarNota(nota);
    }
  } while (nota != null);
  print("As notas digitadas foram:${aluno.getNotas()}");
  print("A média do aluno foi:${aluno.retornaMedia()}");

  if (aluno.aprovado(7)) {
    print("O aluno ${aluno.getNome()} aprovado");
  } else {
    print("O aluno ${aluno.getNome()} reprovadooooo");
  }
}

// ignore_for_file: non_constant_identifier_names
library globals;

/*
  variables and lists that are often used in other files
  are easily accessible by importing global.dart and calling using global.
 */

var token;
var user;
var cod_solicitacao;
var etapa;

final nomeCompleto = user.nome;
final listaPalavras = nomeCompleto.split(' ');
final primeiroNome = listaPalavras[0];
final primeiroNomeFormatado =
    primeiroNome[0].toUpperCase() + primeiroNome.substring(1).toLowerCase();
final segundoNome = listaPalavras[1];
final nomeComSobrenome = primeiroNome[0].toUpperCase() +
    primeiroNome.substring(1).toLowerCase() +
    ' ' +
    segundoNome[0].toUpperCase() +
    segundoNome.substring(1).toLowerCase();


final List<Map<String, String>> batidasPonto = [
  {'title': 'Entrada', 'svg': 'assets/icons/clock.svg'}
];


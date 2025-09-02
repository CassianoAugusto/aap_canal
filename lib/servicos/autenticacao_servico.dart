// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoServico {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> cadastrarUsuario({
    required String email,
    required String senha,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      return "Cadastro realizado com sucesso";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return "O endereço de e-mail já está em uso";
      } else if (e.code == 'invalid-email') {
        return "O e-mail informado é inválido";
      } else if (e.code == 'weak-password') {
        return "A senha informada é muito fraca";
      } else {
        return "Erro ao cadastrar usuário: ${e.message}";
      }
    } catch (e) {
      return "Erro inesperado ao cadastrar usuário";
    }
  }

  Future<String> loginUsuario({
    required String email,
    required String senha,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      return "Login realizado com sucesso";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "Usuário não encontrado";
      } else if (e.code == 'wrong-password') {
        return "Senha incorreta";
      } else {
        return "Erro ao realizar login: ${e.message}";
      }
    } catch (e) {
      return "Erro inesperado ao realizar login";
    }
  }
}

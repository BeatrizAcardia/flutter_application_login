// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_login/usuario.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final img = SizedBox(
    height: 100,
    width: 100,
    child: Image.asset('assets/imgs/pagina-de-login.png'),
  );

  TextEditingController nomeControler = TextEditingController();
  TextEditingController senhaControler = TextEditingController();

  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();

  List<Usuario> listaUsuarios = [
    Usuario("roberto123", "rlindo1"),
    Usuario("bia90", "ahnes"),
    Usuario("felipolis", "barnabe")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            img,
            SizedBox(
              height: 30,
            ),
            Form(
              key: _formkey,
              child: Column(
              children: [
                TextFormField(
                    controller: nomeControler,
                    decoration: InputDecoration(
                        labelText: "Nome de usuário: ",
                        prefixIcon: Icon(Icons.perm_identity_sharp)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'O campo não pode ser vazio';
                      }
                    }),
                SizedBox(height: 20),
                TextFormField(
                    obscureText: true,
                    controller: senhaControler,
                    decoration: InputDecoration(
                        labelText: "Senha: ", prefixIcon: Icon(Icons.password)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'o campo não pode ser vazio';
                      } else {
                        if (senhaControler.text.length < 3) {
                          return 'A senha deve conter pelo menos 3 caracteres';
                        }
                      }
                      return null;
                    }),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        String nome = nomeControler.text;
                        String senha = senhaControler.text;
                        bool acesso = false;

                      for (Usuario u in listaUsuarios) {
                        if (u.getNome == nome && u.getSenha == senha) {
                        acesso = true;
                        break;
                      }
                    }

                  if (acesso) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Login com sucesso'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },),],);},);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Usuário ou senha incorretos')),
                    );
                  }}},child: Text("Logar"))
              ],
            )),
          ],
        ),
      ),
    );
  }
}

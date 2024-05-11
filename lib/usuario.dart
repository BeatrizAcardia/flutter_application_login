class Usuario {
  String nome = " ";
  String senha = " ";

  Usuario(this.nome, this.senha);

  get getNome => this.nome;
  set setNome(nome) => this.nome = nome;

  get getSenha => this.senha;
  set setSenha(senha) => this.senha = senha;
}

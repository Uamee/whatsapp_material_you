class Users {
  final String title;
  final String subtitle;
  final String assetImage;
  final String formatedLastStatusTime;

  const Users({
    required this.title,
    required this.assetImage,
    required this.subtitle,
    required this.formatedLastStatusTime,
  });
}

const allUsers = [
  Users(
      title: 'Matheus',
      assetImage: 'assets/Matheus.png',
      subtitle: 'Bora jogar aquele Genshin?',
      formatedLastStatusTime: 'há 49 min'),
  Users(
      title: 'Roberta',
      assetImage: 'assets/Roberta.png',
      subtitle: 'Baixa o kwai com o meu código, por favor!!!!!',
      formatedLastStatusTime: 'há 2h'),
  Users(
      title: 'Ângela',
      assetImage: 'assets/Angela.png',
      subtitle: 'Bora jogar aquele Genshin?',
      formatedLastStatusTime: 'há 1 min'),
  Users(
      title: 'Bruna',
      assetImage: 'assets/Bruna.png',
      subtitle: 'Bora jogar aquele Genshin?',
      formatedLastStatusTime: 'há 5h'),
  Users(
      title: 'Pedro',
      assetImage: 'assets/Pedro.png',
      subtitle: 'Bora jogar aquele Genshin?',
      formatedLastStatusTime: 'há 12 min'),
  Users(
      title: 'Maicon',
      assetImage: 'assets/Maicon.png',
      subtitle: 'Bora jogar aquele Genshin?',
      formatedLastStatusTime: 'há 3h'),
];

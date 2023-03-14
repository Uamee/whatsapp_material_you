import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import "package:cached_network_image/cached_network_image.dart";
import 'package:whatsapp_material_you/components/widgets/CustomMessageBar.dart';
//import 'package:audioplayer/audioplayer.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  AudioPlayer audioPlayer = new AudioPlayer();
  Duration duration = new Duration();
  Duration position = new Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).colorScheme.primary.withOpacity(0.10);
    Color onPrimary = Theme.of(context).colorScheme.onPrimary;
    Color secondary = Theme.of(context).colorScheme.secondary;
    final now = new DateTime.now();
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nathan",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Visto por último ás 08:33",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          Icon(Icons.phone),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                BubbleNormal(
                  delivered: true,
                  text:
                      'Esse é um exemplo de texto dentro de uma bolha de texto. :)',
                  isSender: false,
                  color: primary,
                  tail: true,
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                BubbleNormalAudio(
                  color: primary,
                  duration: duration.inSeconds.toDouble(),
                  position: position.inSeconds.toDouble(),
                  isPlaying: isPlaying,
                  isLoading: isLoading,
                  isPause: isPause,
                  onSeekChanged: _changeSeek,
                  onPlayPauseButtonClick: _playAudio,
                  sent: true,
                  delivered: true,
                ),
                DateChip(
                  date: now,
                ),
                BubbleNormalImage(
                  id: 'id001',
                  image: _image(),
                  color: primary,
                  tail: true,
                  delivered: true,
                ),
                BubbleNormal(
                  delivered: true,
                  text:
                      'Esse é um exemplo de texto dentro de uma bolha de texto. :)',
                  isSender: false,
                  color: primary,
                  tail: true,
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomMessageBar(
              messageBarColor: primary,
              sendButtonColor: secondary,
              onSend: (_) => print(_),
              actions: [
                InkWell(
                  child: Icon(
                    Icons.attach_file,
                    color: secondary,
                    size: 24,
                  ),
                  onTap: () {},
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: InkWell(
                    child: Icon(
                      Icons.emoji_emotions,
                      color: secondary,
                      size: 24,
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _image() {
    return Container(
      constraints: BoxConstraints(
        minHeight: 20.0,
        minWidth: 20.0,
      ),
      child: CachedNetworkImage(
        imageUrl:
            'https://adrenaline.com.br/uploads/2022/12/27/81310/Anime_NieR__Automata_Ver1_1a_estreia_no_dia_7_de_janeiro_(1).jpg',
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  void _changeSeek(double value) {
    setState(() {
      audioPlayer.seek(new Duration(seconds: value.toInt()));
    });
  }

  void _playAudio() async {
    final url =
        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3';
    if (isPause) {
      await audioPlayer.resume();
      setState(() {
        isPlaying = true;
        isPause = false;
      });
    } else if (isPlaying) {
      await audioPlayer.pause();
      setState(() {
        isPlaying = false;
        isPause = true;
      });
    } else {
      setState(() {
        isLoading = true;
      });
      await audioPlayer.play(UrlSource(url));
      setState(() {
        isPlaying = true;
      });
    }

    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
        isLoading = false;
      });
    });
    audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        position = p;
      });
    });
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        duration = new Duration();
        position = new Duration();
      });
    });
  }
}

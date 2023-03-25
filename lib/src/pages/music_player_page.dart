import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:music_player/src/helpers/helpers.dart';
import 'package:music_player/src/model/player_model.dart';
import 'package:music_player/src/widgets/custom_app_bar.dart';

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          Column(
            children: const [
              CustomAppBar(),
              _ImageDiscDuration(),
              _PlayTitle(),
              Expanded(child: _Lyrics())
            ],
          ),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    final screeSize = MediaQuery.of(context).size;
    return Container(
      width: screeSize.width,
      height: screeSize.height * .8,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
        ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.center,
          colors: [
            Color(0xff33333E),
            Color(0xff201E28),
          ],
        ),
      ),
    );
  }
}

class _Lyrics extends StatelessWidget {
  const _Lyrics();

  @override
  Widget build(BuildContext context) {
    final lyrics = getLyrics();
    return ListWheelScrollView(
      physics: const BouncingScrollPhysics(),
      itemExtent: 42,
      useMagnifier: true,
      magnification: 1.5,
      children: lyrics
          .map(
            (line) => Text(
              line,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _PlayTitle extends StatefulWidget {
  const _PlayTitle();

  @override
  State<_PlayTitle> createState() => _PlayTitleState();
}

class _PlayTitleState extends State<_PlayTitle>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  late AnimationController playController;
  bool firtTime = true;
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    playController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    playController.dispose();
    super.dispose();
  }

  void open() {
    final playerStatus = context.read<PlayerModel>();
    assetsAudioPlayer.open(Audio('assets/Breaking-Benjamin-Far-Away.mp3'));

    assetsAudioPlayer.currentPosition.listen((duration) {
      playerStatus.currentDuration = duration;
    });

    assetsAudioPlayer.current.listen((playingAudio) {
      final songDuration = playingAudio!.audio.duration;
      playerStatus.sonDuration = songDuration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Column(
            children: [
              Text('Far Away',
                  style: TextStyle(
                      fontSize: 30, color: Colors.white.withOpacity(0.8))),
              Text('-Braking Benjamin',
                  style: TextStyle(
                      fontSize: 15, color: Colors.white.withOpacity(0.8)))
            ],
          ),
          const Spacer(),
          FloatingActionButton(
            elevation: 0,
            highlightElevation: 0,
            backgroundColor: const Color(0xffF8CB51),
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: playController,
            ),
            onPressed: () {
              final managerMusic = context.read<PlayerModel>().controller;
              if (isPlaying) {
                playController.reverse();
                isPlaying = false;
                managerMusic.stop();
              } else {
                playController.forward();
                isPlaying = true;
                managerMusic.repeat();
              }
              if (firtTime) {
                open();
                firtTime = false;
              } else {
                assetsAudioPlayer.playOrPause();
              }
            },
          )
        ],
      ),
    );
  }
}

class _ImageDiscDuration extends StatelessWidget {
  const _ImageDiscDuration();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.only(top: 70),
      child: Row(
        children: const [
          _ImageDisc(),
          SizedBox(width: 40),
          _ProgressBar(),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar();

  @override
  Widget build(BuildContext context) {
    final playerStatus = context.watch<PlayerModel>();
    final percentage = playerStatus.percentage;
    return Column(
      children: [
        Text(playerStatus.sonTotalDuration,
            style: TextStyle(color: Colors.white.withOpacity(0.4))),
        const SizedBox(height: 10),
        Stack(
          children: [
            Container(
              width: 3,
              height: 230,
              color: Colors.white.withOpacity(0.1),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 3,
                height: 230 * percentage,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(playerStatus.currentTotalDuration,
            style: TextStyle(color: Colors.white.withOpacity(0.4))),
      ],
    );
  }
}

class _ImageDisc extends StatelessWidget {
  const _ImageDisc();

  @override
  Widget build(BuildContext context) {
    final playerStatus = context.read<PlayerModel>();
    return Container(
      width: 250,
      height: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff484750),
            Color(0xff1E1C24),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
              duration: const Duration(seconds: 10),
              infinite: true,
              animate: false,
              manualTrigger: true,
              controller: (controller) {
                playerStatus.controller = controller;
              },
              child: const Image(
                image: AssetImage('assets/aurora.jpg'),
              ),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: const Color(0xff1C1C25),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

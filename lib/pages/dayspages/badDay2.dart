import 'package:dawwen02/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:favorite_button/favorite_button.dart';

class BadDay2 extends StatefulWidget {
  const BadDay2({super.key});

  @override
  State<BadDay2> createState() => _BadDay2State();
}

class _BadDay2State extends State<BadDay2> {
  final vidURL1 = "https://www.youtube.com/watch?v=xRxT9cOKiM8&t=1s";
  final vidURL2 = "https://www.youtube.com/watch?v=149tYQEhqvY";
  final vidURL3 = "https://www.youtube.com/watch?v=kwPOT0tOENo";

  late YoutubePlayerController _controller1;
  late YoutubePlayerController _controller2;
  late YoutubePlayerController _controller3;

  @override
  void initState() {
    final vidID1 = YoutubePlayer.convertUrlToId(vidURL1);
    final vidID2 = YoutubePlayer.convertUrlToId(vidURL2);
    final vidID3 = YoutubePlayer.convertUrlToId(vidURL3);

    _controller1 = YoutubePlayerController(
      initialVideoId: vidID1!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );

    _controller2 = YoutubePlayerController(
      initialVideoId: vidID2!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );

    _controller3 = YoutubePlayerController(
      initialVideoId: vidID3!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 20),
        child: Center(
          /** Card Widget **/
          child: Column(
            children: [
              Card(
                elevation: 1,
                shadowColor: Colors.black,
                color: const Color.fromARGB(255, 222, 254, 239),
                child: SizedBox(
                  width: 300,
                  height: 1000,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            '... يبدو عليك انك مكتئب و حزين',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.green[900],
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            '..نقترح عليك بعض الحلول لمساعدتك على الاسترخاء',
                            style: TextStyle(
                              fontSize: 23,
                              color: Color.fromARGB(255, 82, 82, 82),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //video 1
                              YoutubePlayer(
                                controller: _controller1,
                                showVideoProgressIndicator: true,
                                onReady: () => debugPrint('Ready'),
                                bottomActions: [
                                  CurrentPosition(),
                                  ProgressBar(
                                    isExpanded: true,
                                    colors: const ProgressBarColors(
                                        playedColor: Colors.amber,
                                        handleColor: Colors.amberAccent),
                                  ),
                                  const PlaybackSpeedButton(),
                                ],
                              ),

                              //Favorite button
                              Row(
                                children: [
                                  FavoriteButton(
                                    isFavorite: true,
                                    valueChanged: (isFavorite) {
                                      print('Is Favorite : $isFavorite');
                                    },
                                  ),
                                  Text(
                                    ' دقائق من التأمل لتخفيف الاكتئاب',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.green[900],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 10,
                              ),

                              //video 2
                              YoutubePlayer(
                                controller: _controller2,
                                showVideoProgressIndicator: true,
                                onReady: () => debugPrint('Ready'),
                                bottomActions: [
                                  CurrentPosition(),
                                  ProgressBar(
                                    isExpanded: true,
                                    colors: const ProgressBarColors(
                                        playedColor: Colors.amber,
                                        handleColor: Colors.amberAccent),
                                  ),
                                  const PlaybackSpeedButton(),
                                ],
                              ),

                              //Favorite button
                              Row(
                                children: [
                                  FavoriteButton(
                                    isFavorite: true,
                                    valueChanged: (isFavorite) {
                                      print('Is Favorite : $isFavorite');
                                    },
                                  ),
                                  Text(
                                    ' دقائق من التأمل للتحكم بالعواطف',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.green[900],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 10,
                              ),

                              //video 3
                              YoutubePlayer(
                                controller: _controller3,
                                showVideoProgressIndicator: true,
                                onReady: () => debugPrint('Ready'),
                                bottomActions: [
                                  CurrentPosition(),
                                  ProgressBar(
                                    isExpanded: true,
                                    colors: const ProgressBarColors(
                                        playedColor: Colors.amber,
                                        handleColor: Colors.amberAccent),
                                  ),
                                  const PlaybackSpeedButton(),
                                ],
                              ),

                              //Favorite button
                              Row(
                                children: [
                                  FavoriteButton(
                                    isFavorite: true,
                                    valueChanged: (isFavorite) {
                                      print('Is Favorite : $isFavorite');
                                    },
                                  ),
                                  Text(
                                    ' دقائق من التأمل لتخفيف الحزن',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.green[900],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Home()),
                                );
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromARGB(
                                          255, 152, 196, 174))),
                              child: const Padding(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Icon(Icons.touch_app),
                                    Text('عودة')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

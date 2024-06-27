import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:sweat_smart/other/app_resource/AppDimen.dart';
import 'package:sweat_smart/ui/running_excercise/bloc/running_exercise_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../other/general_utils.dart';

class RunningExcerciseScreen extends StatefulWidget {
  int? millisecond;
  String? gif;

  RunningExcerciseScreen(
      {super.key, required this.millisecond, required this.gif});

  @override
  State<RunningExcerciseScreen> createState() => _RunningExcerciseScreenState();
}

class _RunningExcerciseScreenState extends State<RunningExcerciseScreen> {
  late final StopWatchTimer? _stopWatchTime; // Create instance.
  bool? _isStop = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stopWatchTime = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: widget.millisecond ?? 0, // millisecond => minute.
    );
    _stopWatchTime?.onStartTimer();
    _stopWatchTime?.secondTime.listen((value) => print('secondTime $value'));
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await _stopWatchTime?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RunningExerciseBloc, RunningExerciseState>(
      builder: (context, state) {
        return Scaffold(


          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
                vertical: AppDimen.mainScreenVerticalPadding,
                horizontal: AppDimen.mainScreenHorizontalPadding),
            child: Column(
              children: [
                Expanded(flex: 5, child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: widget.gif!,
            ),),

                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder<int>(
                        stream: _stopWatchTime?.secondTime,
                        initialData: 0,
                        builder: (context, snap) {
                          final value = snap.data;
                          print('Listen every second. $value');
                          return Column(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 4),
                                        child: Text(
                                          'Minute',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'Helvetica',
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Text(
                                          formattedTime(
                                              timeInSecond: value ?? 0),
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Helvetica',
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            iconSize: 50,
                              onPressed: () async {
                                _stopWatchTime?.onResetTimer();
                                _stopWatchTime?.onStartTimer();
                                setState(() {
                                  _isStop = false;
                                });
                              },
                              icon: Icon(Icons.refresh)),
                          SizedBox(width: 15,),
                          IconButton(
                              iconSize: 50,

                              onPressed: () {
                                if (_isStop == false) {
                                  _stopWatchTime?.onStopTimer();
                                } else {
                                  _stopWatchTime?.onStartTimer();
                                }
                                setState(() {
                                  _isStop = !_isStop!;
                                });
                              },
                              icon: _isStop == false
                                  ? Icon(Icons.stop_circle)
                                  : Icon(Icons.not_started_outlined)),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

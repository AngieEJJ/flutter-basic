import 'dart:async';
import 'package:flutter/material.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  //타이머: 지정된 시간마다 무언갈 수행하는 클래스

  Timer? _timer;
  //아무것도 없을 때 null 이기 때문에 물음표를 붙인다.
  bool _isRunning = false;
  int _time = 0;
  List<String> _laptimes = [];

  // <필요한 기능>: 타이머 기능, 시작, 플레이, 중지, 취소 (cancle이라는 기본 메서드 있음)
  // 1) 플레이: 플레이 버튼 실행시 타이머가 돌아가고, 다시 클릭시 꺼져야 한다.
  void _clickButton() {
    _isRunning = !_isRunning;

    if(_isRunning) {
      _start();
    }else {
      _pause();
    }
  }

  //2) 시작, 중지 (타이머 기능 생성)
  void _start() {
    _timer = Timer.periodic(Duration(milliseconds: 10 ), (timer) {
      //일정 시간이 지날 때마다 오른쪽 {} 함수가 실행된다. // 천분의 1인데 10이니까 100분의 1 //두자리가 나와야 하니까
      setState(() {
        _time++;
      });
    });
  }

  void _pause() {
    _timer?.cancel();
  }

void _reset() {
    _isRunning = false;
    _timer?.cancel();
    _laptimes.clear();
    _time = 0;
}

  //3) 화면이 종료될 떄 타이머 파괴 필요 -> 타이머가 살아있다면 캔슬한다.
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int sec = _time~/100;
    String hundredth = '${_time % 100}'.padLeft(2, '0');
    // 2자리로 표시, 2자리가 아니면 왼쪽에 0을 붙인다. //오른쪽으로 하면 20이 되버림
    //문자열을 특정 길이로 맞춰주는 메서드


    return Scaffold(
      appBar: AppBar(
        title: const Text('스톱워치', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 30),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$sec',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  '$hundredth'
                ),
              ],
            ),
            SizedBox(
              width: 100,
              height: 200,
              child: ListView(
                children: [
                  Text('111'),
                  Text('111'),
                  Text('111'),
                  Text('111'),
                  Text('111'),
                  Text('111'),
                  Text('111'),
                  Text('111'),
                  Text('111'),
                  Text('111'),
                  Text('111'),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _reset();
                    });
                  },
                  backgroundColor: Colors.orange,
                  child: const Icon(Icons.refresh),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _clickButton();
                    });
                  },
                  backgroundColor: Colors.blue,
                  child: _isRunning
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

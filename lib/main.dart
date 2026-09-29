import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 텍스트 위젯에 설정할 기본 문자열
  String mytext = '홍길동';
  /**
  TextField 위젯에 입력된 내용을 읽어오기 위해 필요한 객체로 아래에서 controller 속성에 추가한다. 
   */
  final ctlMyText1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //최초 실행시 '홍길동'이 표시된다.
            Text(mytext, style: const TextStyle(fontSize: 30.0)),
            // 텍스트필드의 가로 사이즈는 SizedBox를 통해 설정한다.
            // 앞에서 생성한 컨트롤러 인스턴스를 여기서 설정
            SizedBox(width: 280, child: TextField(controller: ctlMyText1)),
            ElevatedButton(
              child: const Text('입력내용으로변경', style: TextStyle(fontSize: 24.0)),
              onPressed: () {
                /**
                버튼을 누르면 사용자가 입력한 텍스트로 상태를 변경하여 리렌더링을 한다. 즉 Flutter에서 
                화면을 이렌더링 하려면 setState()를 호출해야 한다.
                 */
                setState(() {
                  mytext = ctlMyText1.text;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //플로팅 버튼을 누르면 초기상태로 변경된다.
        onPressed: () {
          setState(() {
            mytext = '홍길동';
          });
        },
        child: const Icon(Icons.reset_tv),
      ),
    );
  }
}

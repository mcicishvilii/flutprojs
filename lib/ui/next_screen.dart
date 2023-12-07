import 'package:flutprojs/data/remote/yes_no_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutprojs/data/remote/yes_no_service.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  late Future<YesNoDto> futureYesNo;

  @override
  void initState() {
    super.initState();
    futureYesNo = YesNoService().fetchYesOrNo();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<YesNoDto>(
            future: futureYesNo,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    Text(snapshot.data!.answer),
                    Image.network(snapshot.data!.image),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

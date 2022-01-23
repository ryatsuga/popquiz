import 'package:flutter/material.dart';
import 'package:popquiz/shared/themes/app_colors.dart';
import 'package:popquiz/shared/themes/app_text_styles.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({Key? key}) : super(key: key);

  @override
  _HistoricPageState createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Center(
            child: Container(
                child: Text('Histórico de quizzes',
                    style: TextStyles.titleListTile))),
      ),
      body: Container(
        color: AppColors.background,
        margin: EdgeInsets.only(left: 6, right: 6),
        child: ListView(scrollDirection: Axis.vertical, children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.notes),
              title: Text('Quiz: Minhas Preferências'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.notes),
              title: Text('Quiz: Minhas Preferências'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.notes),
              title: Text('Quiz: Minhas Preferências'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.notes),
              title: Text('Quiz: Minhas Preferências'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.notes),
              title: Text('Quiz: Minhas Preferências'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.notes),
              title: Text('Quiz: Minhas Preferências'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.notes),
              title: Text('Quiz: Minhas Preferências'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.notes),
              title: Text('Quiz: Minhas Preferências'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.notes),
              title: Text('Quiz: Minhas Preferências'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.notes),
              title: Text('Quiz: Minhas Preferências'),
            ),
          ),
        ]),
      ),
    );
  }
}

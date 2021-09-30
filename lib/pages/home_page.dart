import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:pepetes/entities/account.dart';
import 'package:pepetes/pages/account_page.dart';
import 'package:pepetes/services/backend-service.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late BackendService _backendService;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    this._animationController = AnimationController(vsync: this);
    this._backendService = GetIt.instance<BackendService>();
    this._textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    this._animationController.dispose();
    this._textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Center(
        child: Container(
          width: width * 0.75,
          child: TextField(
            controller: this._textEditingController,
            onSubmitted: (String value) async {
              Account? account = await this._backendService.getAccountById(value);
              if (account != null) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => AccountPage(account: account))
                );
              }
            }
          ),
        ),
      )
    );
  }
}


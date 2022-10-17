import 'package:artikool_client/artikool_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import 'app_colors.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://localhost:8080/')..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Serverpod Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<Article> _articles = [];

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _articles.length,
              itemBuilder: (context, index) {
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          deleteArticle(_articles[index].id!);
                        },
                        backgroundColor: AppColors.deleteColor,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          _showArticleDialog(article: _articles[index]);
                        },
                        backgroundColor: AppColors.editColor,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Edit',
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(_articles[index].title),
                    subtitle: Text(_articles[index].content),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showArticleDialog,
        child: const Icon(Icons.add_comment),
      ),
    );
  }

  fetchArticles() async {
    try {
      _articles = await client.artikool.getArticles();
      setState(() {});
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  addArticle(Article article) async {
    try {
      var result = await client.artikool.addArticle(article);
      debugPrint('Add article status : $result');

      Navigator.of(context).pop();
      fetchArticles();
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  updateArticle(Article article) async {
    try {
      var result = await client.artikool.updateArticle(article);
      debugPrint('Update article status : $result');

      Navigator.of(context).pop();
      fetchArticles();
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  deleteArticle(int id) async {
    try {
      var result = await client.artikool.deleteArticle(id);
      debugPrint('Delete article status : $result');

      fetchArticles();
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  _showArticleDialog({Article? article}) {
    var titleController = TextEditingController();
    var contentController = TextEditingController();

    if (article != null) {
      titleController.text = article.title;
      contentController.text = article.content;
    }
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Enter title',
                  ),
                ),
                TextField(
                  controller: contentController,
                  decoration: const InputDecoration(
                    hintText: 'Enter description',
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    if (article != null) {
                      article.title = titleController.text;
                      article.content = contentController.text;
                      updateArticle(article);
                    } else {
                      var newArticle = Article(
                        title: titleController.text,
                        content: contentController.text,
                        publishedOn: DateTime.now(),
                        isPrime: true,
                      );
                      addArticle(newArticle);
                    }
                  },
                  child: const Text('Add Article'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

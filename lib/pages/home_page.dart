import 'package:flutter/material.dart';
import 'package:new_rest_api_app/models/NewsApiModel.dart';
import 'package:new_rest_api_app/pages/news_details.dart';
import 'package:new_rest_api_app/services/api_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //

  List<NewsApiModel>? newsList;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getNews().then((value) {
      setState(() {
        if (value.isNotEmpty) {
          newsList = value;
          isLoading = false;
        } else {
          print("List is Empty");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Container(
                  height: size.height / 12,
                  width: size.width / 1.1,
                  child: Row(children: [
                    Icon(Icons.menu),
                    SizedBox(width: size.width / 3.5),
                    Text('News List',
                        style: GoogleFonts.aBeeZee(fontSize: 22.0)),
                  ])),
              isLoading
                  ? Container(
                      height: size.height / 20,
                      width: size.height / 20,
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: Container(
                      child: ListView.builder(
                        itemCount: newsList!.length,
                        itemBuilder: (context, index) {
                          return newsCard(newsList![index]);
                        },
                      ),
                    ))
            ],
          )),
    );
  }

  Widget newsCard(NewsApiModel model) {
    //
    final NewsApiModel news = model;

    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReadingNews(model: model),
              ));
        },
        child: Container(
          padding: EdgeInsets.only(bottom: 40),
          width: size.width / 1.15,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
          ),
          child: Column(
            children: [
              Container(
                height: size.height / 4,
                width: size.width / 1.05,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
                child: model.imageUrl != ""
                    ? Image.network(
                        model.imageUrl,
                        fit: BoxFit.cover,
                      )
                    : Text("Cant Load image"),
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, top: 10.0),
                child: Text(
                  news.title,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: size.width / 1.1,
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  news.descripton,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

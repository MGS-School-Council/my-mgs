import 'package:flutter/material.dart';
import 'package:mymgs/widgets/hero/hero_appbar.dart';

class ImageScaffold extends StatefulWidget {
  final List<Widget> children;
  final String appBarLabel;
  final ImageProvider image;
  final String title;
  final String heroKey;

  const ImageScaffold({
    @required this.children,
    @required this.title,
    @required this.appBarLabel,
    @required this.image,
    this.heroKey,
  });
  _ImageScaffoldState createState() => _ImageScaffoldState();
}

class _ImageScaffoldState extends State<ImageScaffold> {
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: HeroAppBar(
        controller: _controller,
        title: widget.appBarLabel,
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            Hero(
              tag: widget.heroKey ?? '',
              child: Material(
                elevation: 3,
                child: Container(
                  height: 300,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Image(
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image: widget.image,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color(0x60000000),
                              Colors.transparent,
                              Color(0x80000000),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ).copyWith(bottom: 15),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            ...widget.children,
          ],
        ),
      ),
    );
  }
}
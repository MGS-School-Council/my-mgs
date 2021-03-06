import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymgs/data/magazines.dart';
import 'package:mymgs/data_classes/protobuf/magazines.pb.dart';
import 'package:mymgs/helpers/contact_sheet.dart';
import 'package:mymgs/helpers/responsive.dart';
import 'package:mymgs/widgets/magazines/node_renderer.dart';
import 'package:mymgs/widgets/page_layouts/image_scaffold.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;
  final PublicationTheme theme;

  const ArticleScreen({
    required this.article,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final padding = Responsive(context).horizontalReaderPadding;

    return ImageScaffold(
      title: article.title,
      appBarLabel: "Article",
      image: CachedNetworkImageProvider(article.image.url),
      titleStyle: parsePbTextStyle(theme.headingStyle).copyWith(
        fontSize: 28,
      ),
      children: [
        const SizedBox(height: 20),

        for (final author in article.authors)
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: padding),
            title: Text(author.name),
            subtitle: const Text("Author"),
            onTap: () {
              showContactSheet(context, author.name, author.email);
            },
          ),

        const SizedBox(height: 10),
        for (final node in article.contents)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding, vertical: 10),
            child: ArticleNodeRenderer(theme: theme, node: node),
          ),
        const SizedBox(height: 30),
      ],
    );
  }
}

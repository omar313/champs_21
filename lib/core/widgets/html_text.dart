import 'package:flutter/material.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';

class HtmlText extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  const HtmlText(this.text, {Key key, this.backgroundColor = Colors.white})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            color: backgroundColor,
            padding: EdgeInsets.all(8),
            child: MarkdownBody(
              data: getHtmlText(text),
              styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context),)
                  .copyWith(
                      p: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: 20.0, fontFamily: 'BanglaSagar', ), textAlign: WrapAlignment.spaceBetween),
            ))
      ],
    );
  }

  String getHtmlText(String html) {
    var text = """<!DOCTYPE html>
    <html>
      <head><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
        <div>
         $html
        </div>
      </body>
    </html>""";
    return html2md.convert(text);
  }
}

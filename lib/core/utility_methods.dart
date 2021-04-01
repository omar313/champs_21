String removeAllHtmlTags(String htmlText) {
   htmlText = htmlText.replaceAll('\n', '');
    RegExp exp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: true
    );

    return htmlText.replaceAll(exp, '');
  }
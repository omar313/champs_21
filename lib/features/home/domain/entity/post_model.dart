class Post {
  int id;
  String date;
  String dateGmt;
  Guid guid;
  String modified;
  String modifiedGmt;
  String slug;
  String status;
  String type;
  String link;
  String title;
  String content;
  Content excerpt;
  dynamic author;
  int featuredMedia;
  String commentStatus;
  String pingStatus;
  bool sticky;
  String template;
  String format;
  List<String> meta;
  List<int> categories;
  List<int> tags;
  String featureImage;
  // Links lLinks;

  Post({
    this.id,
    this.date,
    this.dateGmt,
    this.guid,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.content,
    this.excerpt,
    this.author,
    this.featuredMedia,
    this.commentStatus,
    this.pingStatus,
    this.sticky,
    this.template,
    this.format,
    this.meta,
    this.categories,
    this.tags,
    // this.lLinks
  });

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = json['guid'] != null ? new Guid.fromJson(json['guid']) : null;
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    slug = json['slug'];
    status = json['status'];
    type = json['type'];
    link = json['link'];
    if (json['feature_image'] != null) {
      featureImage = json['feature_image'];
    } else if (json['featured_image'] != null) {
      featureImage = json['featured_image'];
    }else{
      featureImage = '';
    }

    if (json['title'] != null) {
      if (json['title'] is String) {
        title = json['title'];
      } else {
        title = Guid.fromJson(json['title']).rendered;
      }
    } else {
      title = '';
    }

    if (json['content'] != null) {
      if (json['content'] is String) {
        content = json['content'];
      } else {
        content = Content.fromJson(json['content']).rendered;
      }
    } else {
      content = '';
    }

    excerpt =
        json['excerpt'] != null ? new Content.fromJson(json['excerpt']) : null;
    author = json['author'];
    featuredMedia = json['featured_media'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    sticky = json['sticky'];
    template = json['template'];
    format = json['format'];
    // if (json['meta'] != null) {
    //   meta = new List<String>();
    //   json['meta'].forEach((v) {
    //     meta.add(new String.fromJson(v));
    //   });
    // }
    // categories = json['categories'].cast<int>();
    // tags = json['tags'].cast<int>();
    // lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['date_gmt'] = this.dateGmt;
    if (this.guid != null) {
      data['guid'] = this.guid.toJson();
    }
    data['modified'] = this.modified;
    data['featured_image'] = this.featureImage;
    data['modified_gmt'] = this.modifiedGmt;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['type'] = this.type;
    data['link'] = this.link;
    data['title'] = this.title;
    data['content'] = this.content;

    if (this.excerpt != null) {
      data['excerpt'] = this.excerpt.toJson();
    }
    data['author'] = this.author;
    data['featured_media'] = this.featuredMedia;
    data['comment_status'] = this.commentStatus;
    data['ping_status'] = this.pingStatus;
    data['sticky'] = this.sticky;
    data['template'] = this.template;
    data['format'] = this.format;
    // if (this.meta != null) {
    //   data['meta'] = this.meta.map((v) => v.toJson()).toList();
    // }
    data['categories'] = this.categories;
    data['tags'] = this.tags;
    // if (this.lLinks != null) {
    //   data['_links'] = this.lLinks.toJson();
    // }
    return data;
  }
}

class Guid {
  String rendered;

  Guid({this.rendered});

  Guid.fromJson(Map<String, dynamic> json) {
    if (json['rendered'] != null)
      rendered = json['rendered'];
    else {
      // rendered = json.keys;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this.rendered;
    return data;
  }
}

class Content {
  String rendered;
  bool protected;

  Content({this.rendered, this.protected});

  Content.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
    protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this.rendered;
    data['protected'] = this.protected;
    return data;
  }
}

// class Links {
//   List<Self> self;
//   List<Collection> collection;
//   List<About> about;
//   List<Author> author;
//   List<Replies> replies;
//   List<VersionHistory> versionHistory;
//   List<PredecessorVersion> predecessorVersion;
//   List<WpFeaturedmedia> wpFeaturedmedia;
//   List<WpAttachment> wpAttachment;
//   List<WpTerm> wpTerm;
//   List<Curies> curies;

//   Links(
//       {this.self,
//       this.collection,
//       this.about,
//       this.author,
//       this.replies,
//       this.versionHistory,
//       this.predecessorVersion,
//       this.wpFeaturedmedia,
//       this.wpAttachment,
//       this.wpTerm,
//       this.curies});

//   Links.fromJson(Map<String, dynamic> json) {
//     if (json['self'] != null) {
//       self = new List<Self>();
//       json['self'].forEach((v) {
//         self.add(new Self.fromJson(v));
//       });
//     }
//     if (json['collection'] != null) {
//       collection = new List<Collection>();
//       json['collection'].forEach((v) {
//         collection.add(new Collection.fromJson(v));
//       });
//     }
//     if (json['about'] != null) {
//       about = new List<About>();
//       json['about'].forEach((v) {
//         about.add(new About.fromJson(v));
//       });
//     }
//     if (json['author'] != null) {
//       author = new List<Author>();
//       json['author'].forEach((v) {
//         author.add(new Author.fromJson(v));
//       });
//     }
//     if (json['replies'] != null) {
//       replies = new List<Replies>();
//       json['replies'].forEach((v) {
//         replies.add(new Replies.fromJson(v));
//       });
//     }
//     if (json['version-history'] != null) {
//       versionHistory = new List<VersionHistory>();
//       json['version-history'].forEach((v) {
//         versionHistory.add(new VersionHistory.fromJson(v));
//       });
//     }
//     if (json['predecessor-version'] != null) {
//       predecessorVersion = new List<PredecessorVersion>();
//       json['predecessor-version'].forEach((v) {
//         predecessorVersion.add(new PredecessorVersion.fromJson(v));
//       });
//     }
//     if (json['wp:featuredmedia'] != null) {
//       wpFeaturedmedia = new List<WpFeaturedmedia>();
//       json['wp:featuredmedia'].forEach((v) {
//         wpFeaturedmedia.add(new WpFeaturedmedia.fromJson(v));
//       });
//     }
//     if (json['wp:attachment'] != null) {
//       wpAttachment = new List<WpAttachment>();
//       json['wp:attachment'].forEach((v) {
//         wpAttachment.add(new WpAttachment.fromJson(v));
//       });
//     }
//     if (json['wp:term'] != null) {
//       wpTerm = new List<WpTerm>();
//       json['wp:term'].forEach((v) {
//         wpTerm.add(new WpTerm.fromJson(v));
//       });
//     }
//     if (json['curies'] != null) {
//       curies = new List<Curies>();
//       json['curies'].forEach((v) {
//         curies.add(new Curies.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.self != null) {
//       data['self'] = this.self.map((v) => v.toJson()).toList();
//     }
//     if (this.collection != null) {
//       data['collection'] = this.collection.map((v) => v.toJson()).toList();
//     }
//     if (this.about != null) {
//       data['about'] = this.about.map((v) => v.toJson()).toList();
//     }
//     if (this.author != null) {
//       data['author'] = this.author.map((v) => v.toJson()).toList();
//     }
//     if (this.replies != null) {
//       data['replies'] = this.replies.map((v) => v.toJson()).toList();
//     }
//     if (this.versionHistory != null) {
//       data['version-history'] =
//           this.versionHistory.map((v) => v.toJson()).toList();
//     }
//     if (this.predecessorVersion != null) {
//       data['predecessor-version'] =
//           this.predecessorVersion.map((v) => v.toJson()).toList();
//     }
//     if (this.wpFeaturedmedia != null) {
//       data['wp:featuredmedia'] =
//           this.wpFeaturedmedia.map((v) => v.toJson()).toList();
//     }
//     if (this.wpAttachment != null) {
//       data['wp:attachment'] = this.wpAttachment.map((v) => v.toJson()).toList();
//     }
//     if (this.wpTerm != null) {
//       data['wp:term'] = this.wpTerm.map((v) => v.toJson()).toList();
//     }
//     if (this.curies != null) {
//       data['curies'] = this.curies.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class Self {
  String href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Author {
  bool embeddable;
  String href;

  Author({this.embeddable, this.href});

  Author.fromJson(Map<String, dynamic> json) {
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['embeddable'] = this.embeddable;
    data['href'] = this.href;
    return data;
  }
}

class VersionHistory {
  int count;
  String href;

  VersionHistory({this.count, this.href});

  VersionHistory.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['href'] = this.href;
    return data;
  }
}

class PredecessorVersion {
  int id;
  String href;

  PredecessorVersion({this.id, this.href});

  PredecessorVersion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['href'] = this.href;
    return data;
  }
}

class WpTerm {
  String taxonomy;
  bool embeddable;
  String href;

  WpTerm({this.taxonomy, this.embeddable, this.href});

  WpTerm.fromJson(Map<String, dynamic> json) {
    taxonomy = json['taxonomy'];
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taxonomy'] = this.taxonomy;
    data['embeddable'] = this.embeddable;
    data['href'] = this.href;
    return data;
  }
}

class Curies {
  String name;
  String href;
  bool templated;

  Curies({this.name, this.href, this.templated});

  Curies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    href = json['href'];
    templated = json['templated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['href'] = this.href;
    data['templated'] = this.templated;
    return data;
  }
}

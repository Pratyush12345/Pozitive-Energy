class QuoteNote {
  String accountId;
  int quoteid;
  String notesText;
  List<Notes> notes;

  QuoteNote({this.accountId, this.quoteid, this.notesText, this.notes});

  QuoteNote.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    quoteid = json['Quoteid'];
    notesText = json['NotesText'];
    if (json['Notes'] != null) {
      notes = <Notes>[];
      json['Notes'].forEach((v) {
        notes.add(new Notes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['Quoteid'] = this.quoteid;
    data['NotesText'] = this.notesText;
    if (this.notes != null) {
      data['Notes'] = this.notes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notes {
  String strNote;
  String noteCreator;

  Notes({this.strNote, this.noteCreator});

  Notes.fromJson(Map<String, dynamic> json) {
    strNote = json['strNote'];
    noteCreator = json['NoteCreator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strNote'] = this.strNote;
    data['NoteCreator'] = this.noteCreator;
    return data;
  }
}

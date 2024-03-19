import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        secondaryHeaderColor: Colors.blueAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text Editor'),
        ),
        body: TextEditor(),
      ),
    );
  }
}

class TextEditor extends StatefulWidget {
  @override
  _TextEditorState createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  TextEditingController? _controller;
  bool _isBold = false;
  bool _isUnderlined = false;
  bool _isItalic = false;
  double _fontSize = 16.0;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void _toggleBold() {
    setState(() {
      _isBold = !_isBold;
    });
  }

  void _toggleUnderline() {
    setState(() {
      _isUnderlined = !_isUnderlined;
    });
  }

  void _toggleItalic() {
    setState(() {
      _isItalic = !_isItalic;
    });
  }

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2.0;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      if (_fontSize > 6.0) _fontSize -= 2.0;
    });
  }

  void _redo() {
    // Implement redo functionality
  }

  void _undo() {
    // Implement undo functionality
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.format_bold),
                onPressed: _toggleBold,
                color: _isBold ? Colors.blueAccent : null,
              ),
              IconButton(
                icon: Icon(Icons.format_italic),
                onPressed: _toggleItalic,
                color: _isItalic ? Colors.blueAccent : null,
              ),
              IconButton(
                icon: Icon(Icons.format_underlined),
                onPressed: _toggleUnderline,
                color: _isUnderlined ? Colors.blueAccent : null,
              ),
              IconButton(
                icon: Icon(Icons.format_size),
                onPressed: _increaseFontSize,
                color: Colors.blueAccent,
              ),
              IconButton(
                icon: Icon(Icons.format_size),
                onPressed: _decreaseFontSize,
                color: Colors.blueAccent,
              ),
              IconButton(
                icon: Icon(Icons.redo),
                onPressed: _redo,
                color: Colors.blueAccent,
              ),
              IconButton(
                icon: Icon(Icons.undo),
                onPressed: _undo,
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              style: TextStyle(
                fontSize: _fontSize,
                fontWeight: _isBold ? FontWeight.bold : null,
                fontStyle: _isItalic ? FontStyle.italic : null,
                decoration:
                    _isUnderlined ? TextDecoration.underline : null,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type something...',
              ),
              maxLines: null,
            ),
          ),
        ),
      ],
    );
  }
}

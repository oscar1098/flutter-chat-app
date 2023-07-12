import 'package:flutter/material.dart';

import '../widgets/chat_message.dart';

class ChatPage  extends StatefulWidget {
  const ChatPage ({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {

  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  List<ChatMessage> _messages = [];

  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              child: Text('Te', style: TextStyle(fontSize: 12)),
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
            ),
            SizedBox( height: 3),
            Text('Oscar Ardila', style: TextStyle(color: Colors.black87, fontSize: 12),)
          ],
        ),
      ),

      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: ( _ , int i ) => _messages[i],
                reverse: true, 
              ),
            ),

            Divider( height: 1 ),

            //TODO: caja de texto
            Container(
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      ),

    );
  }

  Widget _inputChat() {


    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric( horizontal: 8.0 ),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: ( String texto ) {
                  setState(() {
                    if ( texto.trim().length > 0 ) {
                      _estaEscribiendo = true;
                    } else {
                      _estaEscribiendo = false;
                    }
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar mensaje'
                ),
                focusNode: _focusNode,
              )
            ),

            //Boton de enviar
            Container(
              margin: EdgeInsets.symmetric( horizontal: 4.0 ),
              child: IconTheme(
                data: IconThemeData( color: Colors.blue[400] ),
                child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: Icon( Icons.send),
                  onPressed: _estaEscribiendo
                    ? () => _handleSubmit( _textController.text.trim() )
                    : null 
                ),
              ),
            )


          ],
        ),
      )
    );
  }


  _handleSubmit( String text ){

    _focusNode.requestFocus();

    if ( text.isEmpty ) return;

    _textController.clear();

    final newMessage = ChatMessage(
      uid: '123',
      texto: text, 
      animationController: AnimationController(vsync: this, duration: Duration( milliseconds: 200 )),
    );

    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() {
    // TODO : off del socket

    for( ChatMessage message in _messages ){
      message.animationController.dispose();
    }

    super.dispose();
  }



}
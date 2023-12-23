

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String email;
  final String userId;

  const ChatPage({super.key, required this.email, required this.userId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final firestore = FirebaseFirestore.instance;

  TextEditingController _messageController = TextEditingController();

  final _scrollController = ScrollController();

  Stream<QuerySnapshot<Map<String, dynamic>>>  getStreamMessages(){
    return firestore.collection('chat').orderBy('date', descending: false).snapshots();
  }

  Future<QuerySnapshot<Map<String, dynamic>>>  getFutureMessages(){
    return firestore.collection('chat').get();
  }

  Future<void> sendMessage(String userId, String email) async{
    firestore.collection('chat').add({
      "message": _messageController.text,
      "userId": userId,
      "name": email,
      'date': DateTime.now(),
    });
    _messageController.clear();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        title: Text('Chatting'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
                    stream: getStreamMessages(),
                    builder: (context, snapshot) {
                      
                      var docs = snapshot.data?.docs;
          
                      if(docs != null){
                        
                        return ListView.builder(
                          controller: _scrollController,
                          shrinkWrap: true,
                          itemCount: docs.length,
                          itemBuilder: (context, index){
                            final data = docs[index].data();
          
                            bool isMe = data['userId'] == widget.userId;
                            if (isMe){  
                              return Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                  margin: EdgeInsets.only(right: 12, top: 8),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 128, 155, 189),
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Text(
                                    '${data['message']}',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18,
                                      
                                    ),
                                  ),
                                ),
                              ); 
                            } else {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                  margin: EdgeInsets.only(right: 12, top: 8),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 128, 155, 189),
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Text(
                                    '${data['message']}',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18,
                                      
                                    ),
                                  ),
                                ),
                              ); 
                             }
                          
                        }
                      );
                      }
          
                      
                    return SizedBox();
          
                    } ),
                 
                  
                  
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,0,10,10),
                    child: TextField(
                      focusNode: FocusNode(),
                      controller: _messageController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 1,
                      decoration: InputDecoration(
                        hintText: '    Message...',
                        border: OutlineInputBorder(
                          
                          borderRadius: BorderRadius.all(Radius.circular(40))
                        ),
                        suffixIcon: InkWell(
                          onTap: ()async{
                            await sendMessage(widget.userId, widget.email);
                          },
                          child: Icon(
                            Icons.send
                          )
                        ),
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
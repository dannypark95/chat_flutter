import 'package:flutter/material.dart';
import 'package:chat_flutter/services/chat/chat_service.dart';
import 'package:chat_flutter/services/auth/auth_service.dart';
import 'package:chat_flutter/components/chat_input_field.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

  ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  // text controller
  final TextEditingController _messageController = TextEditingController();

  // chat & auth services
  final _chatService = ChatService();
  final _authService = AuthService();

  // send message
  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(receiverID, _messageController.text);

      // clear the text field
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          // display all messages
          Expanded(child: _buildMessageList()),
          // user input field
          _buildUserInput(),
        ],
      ),
    );
  }

  // build message list
  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(senderID, receiverID),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No messages yet.'));
        }

        // return list view
        return ListView(
          children:
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  // build message item
  Widget _buildMessageItem(doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // check if the sender is the current user
    bool isCurrentUser = data["senderID"] == _authService.getCurrentUser()!.uid;

    // set alignment based on sender
    Alignment alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    CrossAxisAlignment crossAxisAlignment =
        isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;

    return Container(
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:
                  isCurrentUser
                      ? const Color(0xFF5865F2)
                      : const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(18),
                topRight: const Radius.circular(18),
                bottomLeft:
                    isCurrentUser ? const Radius.circular(18) : Radius.zero,
                bottomRight:
                    isCurrentUser ? Radius.zero : const Radius.circular(18),
              ),
            ),
            child: Text(
              data["message"],
              style: TextStyle(
                color: isCurrentUser ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // build message input
  Widget _buildUserInput() {
    return SafeArea(
      minimum: const EdgeInsets.only(bottom: 8), // Adjust as needed
      child: ChatInputField(
        controller: _messageController,
        onSend: sendMessage,
      ),
    );
  }
}

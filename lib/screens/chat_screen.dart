/*import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  List<Map<String, String>> messages = [];

  void sendMessage() {
    String text = _messageController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        messages.add({"user": text});
        messages.add({"bot": "I'm just a simple bot. You said: '$text' 😊"});
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var message = messages[index];
                bool isUser = message.containsKey("user");
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blueAccent : Colors.grey[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      isUser ? message["user"]! : message["bot"]!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          _buildChatInput(),
        ],
      ),
    );
  }

  Widget _buildChatInput() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: "Type a message...",
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blueAccent),
            onPressed: sendMessage,
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:uuid/uuid.dart';



class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<types.Message> _messages = [];
  final types.User _user = types.User(id: '1'); // Your ID
  final types.User _bot = types.User(id: '2'); // Bot or Other User
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  // Load stored messages
  Future<void> _loadMessages() async {
    _prefs = await SharedPreferences.getInstance();
    final storedMessages = _prefs.getStringList('chat_messages') ?? [];
    setState(() {
      _messages = storedMessages.map((msg) {
        return types.TextMessage.fromJson(jsonDecode(msg));
      }).toList();
    });
  }

  // Save messages
  Future<void> _saveMessages() async {
    final messageList =
    _messages.map((msg) => jsonEncode(msg.toJson())).toList();
    await _prefs.setStringList('chat_messages', messageList);
  }

  // Handle sending messages
  void _handleSend(types.PartialText message) {
    final newMessage = types.TextMessage(
      id: const Uuid().v4(),
      author: _user,
      text: message.text,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    setState(() {
      _messages.insert(0, newMessage);
    });

    _saveMessages();
    _autoReply(message.text); // Optional AI bot reply
  }

  // Simple AI reply (Optional)
  void _autoReply(String userMessage) {
    String botReply;
    if (userMessage.toLowerCase().contains("hello")) {
      botReply = "Hi there! How can I assist you today? 😊";
    } else if (userMessage.toLowerCase().contains("balance")) {
      botReply = "Your current balance is \$10,000.";
    } else {
      botReply = "I'm here to help! 😊";
    }

    final botMessage = types.TextMessage(
      id: const Uuid().v4(),
      author: _bot,
      text: botReply,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _messages.insert(0, botMessage);
      });
      _saveMessages();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat Support")),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSend,
        user: _user,
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:uuid/uuid.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<types.Message> _messages = [];
  final types.User _user = types.User(id: '1'); // User
  final types.User _bot = types.User(id: '2'); // Chatbot
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  // Load stored messages from SharedPreferences
  Future<void> _loadMessages() async {
    _prefs = await SharedPreferences.getInstance();
    final storedMessages = _prefs.getStringList('chat_messages') ?? [];
    setState(() {
      _messages = storedMessages.map((msg) {
        return types.TextMessage.fromJson(jsonDecode(msg));
      }).toList();
    });
  }

  // Save messages to SharedPreferences
  Future<void> _saveMessages() async {
    final messageList = _messages.map((msg) => jsonEncode(msg.toJson())).toList();
    await _prefs.setStringList('chat_messages', messageList);
  }

  // Handle sending messages
  void _handleSend(types.PartialText message) {
    final newMessage = types.TextMessage(
      id: const Uuid().v4(),
      author: _user,
      text: message.text,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    setState(() {
      _messages.insert(0, newMessage);
    });

    _saveMessages();
    _autoReply(message.text); // AI-based reply
  }

  // Predefined AI Responses based on Commands
  void _autoReply(String userMessage) {
    String botReply = "I'm here to help! 😊"; // Default response

    // Convert user message to lowercase to match commands
    String lowerMessage = userMessage.toLowerCase();

    // Predefined command responses
    Map<String, String> commandResponses = {
      "hello": "Hello! How can I assist you today? 😊",
      "hi": "Hi there! Need any help?",
      "balance": "Your current balance is \$10,000.",
      "loan": "You have an outstanding loan of \$1,200 due in 15 days.",
      "transactions": "Recent transactions: \n1. \$200 Grocery \n2. \$500 Rent \n3. \$100 Entertainment",
      "support": "For support, please contact: support@trustguard.com 📧",
      "security": "Your account is secured with multi-factor authentication (MFA).",
      "bye": "Goodbye! Have a great day! 👋",
      "fraud": "We monitor all transactions for fraud detection. Let us know if you suspect anything suspicious!",
    };

    // Check if user message matches any predefined command
    if (commandResponses.containsKey(lowerMessage)) {
      botReply = commandResponses[lowerMessage]!;
    }

    final botMessage = types.TextMessage(
      id: const Uuid().v4(),
      author: _bot,
      text: botReply,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _messages.insert(0, botMessage);
      });
      _saveMessages();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat Support")),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSend,
        user: _user,
      ),
    );
  }
}



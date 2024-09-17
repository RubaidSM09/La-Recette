import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';
import 'package:t_store/common/styles/shadow_styles.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class AiChatBot extends StatefulWidget {
  const AiChatBot({super.key});
  @override
  State<AiChatBot> createState() => AiChatBotState();
}

class AiChatBotState extends State<AiChatBot> {
  TextEditingController userInput = TextEditingController();
  static const apiKey = "AIzaSyB-G2Zrp9sIJh-B_zi5gNaqHE6Pii6RIkU";
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
  final List<Message> _messages = [];

  List<String> suggestions = [
    "Simple Recipe with Readily Available Ingredients",
    "Healthy but Tasty Meals!!",
    "Nutritious Weekly Meal Planner"
  ];

  Future<void> sendMessage() async {
    String message = userInput.text; // Use String instead of final

    userInput.text = '';
    setState(() {
      _messages.add(Message(isUser: true, message: message, date: DateTime.now()));
    });

    message = message + " Set the answer in Bangladeshi Context. Do not use Bangladeshi Context in reply. Do not use Bangla language if it is not requested at the upper part of my message.";

    final content = [Content.text(message)];
    final response = await model.generateContent(content);

    setState(() {
      _messages.add(Message(isUser: false, message: response.text ?? "", date: DateTime.now()));
    });
  }

  void onSuggestionTap(String suggestion) {
    setState(() {
      userInput.text = suggestion;
      suggestions.clear(); // Clear the suggestions once one is selected
    });
    sendMessage(); // Automatically send the selected suggestion as a message
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
                image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/la-recette-35bc0.appspot.com/o/ChatBot%20Bg.jpg?alt=media&token=98cae95f-065c-46aa-bfa4-9620e1fcc679'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _messages.isEmpty
                ? Container(
              height: 200, // Fixed height for the grid
              margin: const EdgeInsets.only(top: 250),
              padding: EdgeInsets.all(10),
              child: GridView.builder(
                scrollDirection: Axis.horizontal, // Horizontal scrolling
                itemCount: suggestions.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // Number of items vertically
                  mainAxisExtent: 200, // Fixed width of each item
                  mainAxisSpacing: 10, // Vertical spacing between items
                  crossAxisSpacing: 10, // Horizontal spacing between items
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => onSuggestionTap(suggestions[index]), // Handle tap
                    child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 200,
                      margin: const EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        boxShadow: [TShadowStyle.verticalProductShadow],
                        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
                        color: dark ? TColors.dark : const Color(0xFFE85A4F),
                      ),
                      child: Text(suggestions[index], style: TextStyle(fontSize: 15)),
                    ),
                  );
                },
              ),
            )
                : Expanded(
                child: ListView.builder(
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      return Messages(
                          isUser: message.isUser, message: message.message, date: DateFormat('HH:mm').format(message.date));
                    })),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 15,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: userInput,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          label: Text('Enter Your Message')),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      padding: EdgeInsets.all(12),
                      iconSize: 30,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.black),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(CircleBorder())),
                      onPressed: () {
                        sendMessage();
                      },
                      icon: Icon(Icons.send))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Message {
  final bool isUser;
  final String message;
  final DateTime date;
  Message({required this.isUser, required this.message, required this.date});
}

class Messages extends StatelessWidget {
  final bool isUser;
  final String message;
  final String date;
  const Messages({super.key, required this.isUser, required this.message, required this.date});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 15).copyWith(left: isUser ? 100 : 10, right: isUser ? 10 : 100),
      decoration: BoxDecoration(
          color: isUser ? Colors.blueAccent : Colors.grey.shade400,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: isUser ? Radius.circular(10) : Radius.zero,
              topRight: Radius.circular(10),
              bottomRight: isUser ? Radius.zero : Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(fontSize: 16, color: isUser ? Colors.white : Colors.black),
          ),
          Text(
            date,
            style: TextStyle(fontSize: 10, color: isUser ? Colors.white : Colors.black),
          )
        ],
      ),
    );
  }
}

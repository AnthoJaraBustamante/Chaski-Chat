import 'package:chat_take_home_test/app/models/chat_messages.dart';
import 'package:chat_take_home_test/app/ui/global_widgets/textfield.dart';
import 'package:chat_take_home_test/app/ui/pages/chat_page/local_widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  final List<ChatMessages> messages = [
    ChatMessages(
      text: 'Hello, how are you?',
      uid: '1',
    ),
    ChatMessages(
      text: 'I\'m fine, thank you!',
      uid: '2',
    ),
    ChatMessages(
      text: 'And you?',
      uid: '1',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '2',
    ),
    ChatMessages(
      text: 'And you?',
      uid: '2',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '1',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '2',
    ),
    ChatMessages(
      text: 'And you?',
      uid: '2',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '1',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '2',
    ),
    ChatMessages(
      text: 'And you?',
      uid: '2',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '1',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '2',
    ),
    ChatMessages(
      text: 'And you?',
      uid: '2',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '1',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '2',
    ),
    ChatMessages(
      text: 'And you?',
      uid: '2',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '1',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '2',
    ),
    ChatMessages(
      text: 'And you?',
      uid: '2',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '1',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '2',
    ),
    ChatMessages(
      text: 'And you?',
      uid: '2',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '1',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '2',
    ),
    ChatMessages(
      text: 'And you?',
      uid: '2',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '1',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '2',
    ),
    ChatMessages(
      text: 'And you?',
      uid: '2',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '1',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '2',
    ),
    ChatMessages(
      text: 'And you?',
      uid: '2',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '1',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '2',
    ),
    ChatMessages(
      text: 'And you?',
      uid: '2',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '1',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '2',
    ),
    ChatMessages(
      text: 'And you?',
      uid: '2',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '1',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '2',
    ),
    ChatMessages(
      text: 'And you?',
      uid: '2',
    ),
    ChatMessages(
      text: 'I\'m fine too, thanks!',
      uid: '1',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        leadingWidth: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CircleAvatar(child: Text('Ch'), radius: 15),
            SizedBox(width: 40),
            Text('Chat'),
          ],
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: messages.length,
              // reverse: true,
              itemBuilder: (BuildContext context, int index) {
                return ChatBubble(
                  text: messages[index].text,
                  isMe: messages[index].uid == '2',
                );
              },
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(height: 1),
          const SizedBox(
            height: 5,
          ),
          SafeArea(
            child: RegularTextField(
              controller: controller,
              focusNode: focusNode,
              onEditingComplete: () {
                _onEditingComplete();
              },

              labelText: 'Start writing here...',
              margin: const EdgeInsets.symmetric(horizontal: 20),
              onPressedSuffixIcon: _onEditingComplete,
              suffixIcon: Icons.send,
              suffixIconTooltip: 'Send',
              // keyboardType: TextInputType.multiline,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  Future<void> _onEditingComplete() async {
    if (controller.text.isEmpty) return;
    focusNode.requestFocus();
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    setState(() {
      messages.add(
        ChatMessages(
          text: controller.text,
          uid: '2',
        ),
      );
    });
    await Future.delayed(const Duration(milliseconds: 300));
    scrollController.jumpTo(
      scrollController.position.maxScrollExtent,
    );
    controller.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    focusNode.dispose();
    scrollController.dispose();
  }
}

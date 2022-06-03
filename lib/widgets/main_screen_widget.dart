import 'package:flutter/material.dart';

class MainScrennWidget extends StatelessWidget {
  const MainScrennWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 52),
        const TopBarWidget(),
        const SizedBox(height: 21),
        ArticlesListWidget(),
        const SizedBox(height: 32),
        const Text('Онлайн-консультация',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text(
            'Выберите, в какой сфере Вам нужна помощь \nнаших специалистов',
            style: TextStyle(fontSize: 13)),
        const SizedBox(height: 8),
        const UsualTextButtonWidget(
          text: 'Экономическая безопасность\nи противодействие коррупции',
        ),
        const UsualTextButtonWidget(
            text:
                'Налоговые преступления/\nправонарушения\n(в том числе вопросы,\nсвязанные с проверками ФНС)'),
        const UsualTextButtonWidget(
          text: 'Уголовные дела\n(любой сложности)',
        ),
        const UsualTextButtonWidget(
          text: 'Незаконный оборот\nнаркотических средств',
        ),
        const UsualTextButtonWidget(
          text: 'По делам несовершеннолетних',
        ),
        const UsualTextButtonWidget(
          text: 'Уголовный розыск',
        ),
        const UsualTextButtonWidget(
            text:
                'Административные\nправонарушения\n(в том числе в сфере\nпотребительского рынка)'),
        const UsualTextButtonWidget(
          text: 'Безопасность дорожного\nдвижения',
        ),
        Container(
            height: 80,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 213, 58, 1),
              Color.fromARGB(255, 200, 124, 65),
            ])),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, elevation: 0),
              child: Row(
                children: [
                  const Text(
                    'Не знаю, какой раздел\nмне нужен',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Expanded(child: SizedBox()),
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    height: 47,
                    width: 47,
                    child: const Icon(
                      Icons.question_mark,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}

class UsualTextButtonWidget extends StatelessWidget {
  final String text;
  const UsualTextButtonWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 244, 240, 240)),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: () {},
        child: Padding(
          padding:
              const EdgeInsets.only(right: 8, top: 16, bottom: 16, left: 29),
          child: Row(
            children: [
              Text(text,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(36, 38, 40, 1))),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticlesListWidget extends StatelessWidget {
  ArticlesListWidget({Key? key}) : super(key: key);

  final List<String> images = ['images/first.jpg', 'images/conference.jpg'];
  final List<String> texts = [
    'Произошло что-то очень интересное. Рубль стал дороже долара',
    'Чуть менее интересное'
  ];
  final List<AlignmentGeometry> align = [
    Alignment.bottomRight,
    Alignment.topLeft
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: ((context, index) {
          return ArticleWidget(
            backImage: images[index],
            atricledText: texts[index],
            alignm: align[index],
          );
        }),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class ArticleWidget extends StatelessWidget {
  final alignm;
  final atricledText;
  final String backImage;
  const ArticleWidget(
      {Key? key,
      required this.backImage,
      required this.atricledText,
      required this.alignm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        width: 255,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
                image: ExactAssetImage(backImage), fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: alignm,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(107, 1, 170, 173),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.zero)),
              child: Text(
                this.atricledText,
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopBarWidget extends StatefulWidget {
  const TopBarWidget({Key? key}) : super(key: key);

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      child: Row(
        children: [
          Container(
            height: 8,
            width: 8,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 52, 199, 89),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            "158 юристов онлайн",
            style: TextStyle(fontSize: 12),
          ),
          const Expanded(child: SizedBox()),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
              color: const Color.fromARGB(255, 108, 53, 1)),
        ],
      ),
    );
  }
}

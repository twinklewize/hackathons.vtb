import 'package:flutter/material.dart';
import 'package:vtb_hackathon/consts/vtb_colors.dart';

class FeedView extends StatelessWidget {
  const FeedView({Key? key}) : super(key: key);

  Widget newsWWidget(
    BuildContext context,
    String title,
    String description,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
      child: Container(
        decoration: const BoxDecoration(
            color: VTBColors.color5,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              // Черточка
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Заголовок
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 27,
            left: 15,
            right: 15,
            bottom: 20,
          ),
          child: Row(
            children: const [
              Text(
                'Лента',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: VTBColors.color5,
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              135,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              newsWWidget(
                  context,
                  'Британцев разозлили угрозы России по поводу “Северного потока 2',
                  'Акции Российских компаний на мировом рынке могут упасть в ближайшие 2 месяца'),
              newsWWidget(
                  context,
                  'Новости мира: десятки человек пострадали при землетрясении в Японии',
                  'Акции компаний, обеспечивающих безопасность помещений, могут вырасти в цене на 12%'),
              newsWWidget(
                  context,
                  'В Минфине допустили категорическое падение спроса на нефть в мире',
                  'По подсчетам специалистов, нефть продолжит терять в цене по 3.5% в месяц'),
              newsWWidget(
                  context,
                  'Сборная Хорватии разгромила киприотов в отборочном матче чемпионата мира',
                  'Удивительно, но спрос на кубинские сигары начал расти. Спешите приобрести акции'),
              newsWWidget(
                  context,
                  'Российские шахматистки вышли в финал чемпионата мира',
                  'Согласно нашим данным, спрос на шахматные доски растет, а люди все больше интересуются феминизмом'),
              newsWWidget(
                  context,
                  'В США задержали ученика, открывшего огонь в техасской школе',
                  'Ой-ой, родители больше не покупают детям винтовки, спрос на оружие резко уменьшился'),
              newsWWidget(
                  context,
                  'Студентка из КРыма стала чемпионкой мира по гребле',
                  'Странное следствие, но акции Voogle начали расти. Ибо все в нашем мире связано'),
              newsWWidget(
                  context,
                  'В мире кончаются бумага и автомобили: что происходит?',
                  'Да ничего необычного. Кризис, глобальное потепление, человеческое вмешательство - все как всегда. Но вот акции автомобильных компаний скоро начнут расти, не упустите момент'),
              newsWWidget(
                context,
                'В мире - мир! Но мир миру рознь. Так говорят...',
                'В общем, отношения между США и Китаем натянутые, но не критичные. Стоимость акций этих стран растет',
              ),
              newsWWidget(
                  context,
                  'Почтальоны отмечают профессиональный праздник!',
                  'Повысился спрос на велосипеды. Скоро упадет, не тяните с покупкой'),
              newsWWidget(
                  context,
                  'Новости мира: в Тунисе столкнулись пассажирские поезда',
                  'Акции Туниса падают. Но на этом тоже можно сыграть'),
            ],
          ),
        )
      ],
    );
  }
}

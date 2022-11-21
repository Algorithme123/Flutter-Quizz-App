import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/widgets/custom_text.dart';

class PageQuizz extends StatefulWidget {
  const PageQuizz({Key? key}) : super(key: key);

  @override
  State<PageQuizz> createState() => _PageQuizzState();
}

class _PageQuizzState extends State<PageQuizz> {
  Question question = Question("", false, "", "");

  List<Question> listeQuestions = [
    Question('La devise du TOGO est Travail-liberté-Patrie', true, '',
        'togo.webp'),
    Question('La lune va finir par tomber sur terre à cause de la gravité',
        false, 'Au contraire la lune s\'éloigne', 'lune.jpg'),
    Question('La Russie est plus grande en superficie que Pluton', true, '',
        'russie.jpg'),
    Question('Nyctalope est une race naine d\'antilope', false,
        'C’est une aptitude à voir dans le noir', 'nyctalope.jpg'),
    Question('Le Commodore 64 est l\’oridnateur de bureau le plus vendu', true,
        '', 'commodore.jpg'),
    Question('Le nom du drapeau des pirates es black skull', false,
        'Il est appelé Jolly Roger', 'pirate.png'),
    Question('Haddock est le nom du chien Tintin', false, 'C\'est Milou',
        'tintin.jpg'),
    Question('La barbe des pharaons était fausse', true,
        'A l\'époque déjà ils utilisaient des postiches', 'pharaon.jpg'),
    Question('Au Québec tire toi une bûche veut dire viens viens t\'asseoir',
        true, 'La bûche, fameuse chaise de bucheron', 'buche.jpg'),
    Question('Le module lunaire Eagle de possédait de 4Ko de Ram', true,
        'Dire que je me plains avec mes 8GO de ram sur mon mac', 'eagle.jpg'),
    Question('Tu connais GOGO k. Daniel', true,
        "C'est lui qui a developper cet Application", 'danielGOGO.jpg'),
  ];
  int index = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    question = listeQuestions[index];
  }

  Widget build(BuildContext context) {
    double taille = MediaQuery.of(context).size.width * 0.75;
    return Scaffold(
      appBar: AppBar(
        title: CustomText("Le Quizz"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomText(
              "Question numéro${index + 1}",
              color: Colors.grey[900],
            ),
            CustomText(
              "Score : ${score}/ ${index} ",
              color: Colors.grey[900],
            ),
            Card(
              elevation: 10.0,
              child: Container(
                height: taille,
                width: taille,
                child: Image.asset("quizz assets/${question.imagePath}",
                    fit: BoxFit.cover),
              ),
            ),
            CustomText(
              question.question,
              color: Colors.grey[900],
              factor: 1.3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                boutonBool(true),
                boutonBool(false),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextButton boutonBool(bool b) {
    return TextButton(
        onPressed: (() => dialogue(b)),
        style: TextButton.styleFrom(elevation: 10.0,backgroundColor: Colors.blue),
        child: CustomText((b) ? "Vrai " : "Faux",factor: 1.25,),);
  }

  Future<Null> dialogue(bool b) async {
    bool bonneReponse = (b == question.reponse);
    String vrai = "images assets/vrai.webp";
    String faux = "images assets/faux.webp";
    if(bonneReponse){
      score++;
    }
    return showDialog(context: context,barrierDismissible: false, builder: (BuilderContext){

  return SimpleDialog(
    title: CustomText((bonneReponse)? "C'est gagné ! " : "desolé vous avez perdu",factor: 1.4,color: (bonneReponse)? Colors.green : Colors.red,),
    contentPadding: EdgeInsets.all(20.0),
    children: [
      Image.asset((bonneReponse)? vrai: faux, fit: BoxFit.cover,),
      Container(height: 25.0,),
      CustomText(question.explication, factor: 1.25, color: Colors.grey[900],),
      Container(height: 25.0,),
      TextButton(onPressed: (){
        Navigator.pop(context);
        questionSuivante();
      }, child: CustomText('Au Suivant',factor: 1.25,color : Colors.blue),
      )
    ],
  );
    }
    );
  }


  Future <Null> alerte() async{
    return showDialog(context: context,

        barrierDismissible : false,
        builder: (BuildContext buildeContext){
      return  AlertDialog(
        title: CustomText("C'est fini", color:  Colors.blue, factor: 1.25,),
        contentPadding: EdgeInsets.all(10.0),
        content: CustomText("Votre score : $score / $index",color: Colors.black,),
        actions: [
          TextButton(onPressed: (()=>{
            Navigator.pop(buildeContext),
            Navigator.pop(context)
          }), child: CustomText(
            "OKAY",
            factor: 1.25,
              color: Colors.blue,
          ))

        ],
      );
        });
  }
  void questionSuivante(){
    if(index<listeQuestions.length -1){
      index++;
     setState(() {
       question = listeQuestions[index];
     });
    }else
      {
          alerte();
      }

  }
}

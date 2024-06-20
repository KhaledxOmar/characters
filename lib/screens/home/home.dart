import 'package:characters_app/models/character.dart';
import 'package:characters_app/screens/create/create.dart';
import 'package:characters_app/screens/home/character_card.dart';
import 'package:characters_app/shared/styled_button.dart';
import 'package:characters_app/shared/styled_text.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const StyledTitle("Your characters"),
        centerTitle: true,
      ),

      body: Container( 
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            //expanded to make it constrained to the screen. whatever space that is left it. 
            Expanded( 
              child: ListView.builder(
                itemCount: characters.length,
                itemBuilder: (_,index){
                  return CharacterCard(characters[index]);
                },
              ),
            ),
            
            StyledButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (ctx) => const Create()
                  ));
                }, 
                child: const StyledHeading("create new"),
                ),

            
          ]
        )
      ),
    );
  }
}
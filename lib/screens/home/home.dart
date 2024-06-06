import 'package:characters_app/shared/styled_button.dart';
import 'package:characters_app/shared/styled_text.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List chatacters = ['khaled', 'tameem', 'aljowharah', 'yasser', 'Ahlam', 'LULU'];
  

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
                itemCount: chatacters.length,
                itemBuilder: (_,index){
                  return Container(
                    color: Colors.grey[800],
                    padding: const EdgeInsets.all(40),
                    margin: const EdgeInsets.only(bottom: 40),
                    child: Text(chatacters[index]),
                  );
                },
              ),
            ),

            StyledButton(
                onPressed: (){}, 
                child: const StyledHeading("create new"),
                ),

            
          ]
        )
      ),
    );
  }
}
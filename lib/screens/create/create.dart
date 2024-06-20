import 'package:characters_app/models/character.dart';
import 'package:characters_app/models/vocation.dart';
import 'package:characters_app/screens/create/vocation_card.dart';
import 'package:characters_app/screens/home/home.dart';
import 'package:characters_app/shared/styled_button.dart';
import 'package:characters_app/shared/styled_text.dart';
import 'package:characters_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {

  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  //Disposed whenever its not needed, ex: when the create screen widget is removed from tree
  @override
  void dispose() {

    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();

  }

  //submit handler, handle the submission of the form
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      
      showDialog(context: context, builder: (ctx) {
        return  AlertDialog(
          title: const StyledHeading('Missing Name'),
          content: const StyledText('Every character has a great name!'),

          actions: [
            StyledButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
               child: const StyledHeading('close')
            )
          ],
          actionsAlignment: MainAxisAlignment.center,


        );
      });
      return;
    }

    if (_sloganController.text.trim().isEmpty) {

      showDialog(context: context, builder: (ctx){

        return AlertDialog(
          title: const StyledHeading('Missing slogan'),
          content: const StyledText('remember to add a catchy slogan'),

          actions: [
            StyledButton(
              onPressed: () {
                Navigator.pop(ctx);
              }, 
              child: const StyledText('Close')
            )
          ],

          actionsAlignment: MainAxisAlignment.center,
        );

      });
      
      return;
    }

    characters.add(Character(
      name: _nameController.text.trim(),
      slogan: _sloganController.text.trim(),
      vocation: selectedVocation,
      id: uuid.v4(),
      ));

      Navigator.push(context, MaterialPageRoute(
        builder: (ctx) => const Home()
        ));
    
  }

  // handling vocation selection
  Vocation selectedVocation = Vocation.junkie;

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Character Creation'),
        centerTitle: true,
      ),

      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
          
              Center(
                child: Icon(Icons.code, color: AppColors.primaryColor),
              ),
              const Center(
                child: StyledHeading('Welcome, new player.'),
              ),
              const Center(
                child: StyledText('Create a name & slogan for your character'),
              ),
              const SizedBox(height: 30),
          
          
              // Input the name and Slogan
              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit( //This style makes the written input styled with this style
                  textStyle: Theme.of(context).textTheme.bodyMedium
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText('Character name'),
                ),
              ),
          
              const SizedBox(height: 20),
          
              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit( 
                  textStyle: Theme.of(context).textTheme.bodyMedium
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText('Character slogan'),
                ),
              ),
          
              const SizedBox(height: 30),
          
          
              // select vocation title
              Center(
                child: Icon(Icons.code, color: AppColors.primaryColor),
              ),
              const Center(
                child: StyledHeading('Choose a vocation.'),
              ),
              const Center(
                child: StyledText('This determine your available skills'),
              ),
              const SizedBox(height: 30),
          
          
              //vocation card
              VocationCard(
                selected: selectedVocation == Vocation.junkie,
                onTap: updateVocation,
                vocation: Vocation.junkie
              ),
              VocationCard(
                selected: selectedVocation == Vocation.ninja,
                onTap: updateVocation,
                vocation: Vocation.ninja
              ),
              VocationCard(
                selected: selectedVocation == Vocation.raider,
                onTap: updateVocation,
                vocation: Vocation.raider
              ),
              VocationCard(
                selected: selectedVocation == Vocation.wizard,
                onTap: updateVocation,
                vocation: Vocation.wizard
              ),



              // good luck message
              Center(
                child: Icon(Icons.code, color: AppColors.primaryColor),
              ),
              const Center(
                child: StyledHeading('Good luck.'),
              ),
              const Center(
                child: StyledText('And enjoy the jorney'),
              ),
              const SizedBox(height: 30),
          
          
          
          
          
              Center(
                child: StyledButton(
                  onPressed: handleSubmit,
                   child: const StyledHeading('Create Character')
                ),
              ),
          
            ],
          
          ),
        ),

      ),
    );
  }
}
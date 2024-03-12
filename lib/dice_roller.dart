import 'package:flutter/material.dart';
import 'package:first_app_2/styled_text.dart';

import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceIndex = 1;

  void rollDice() async {
    // GENERO E STAMPO IL MAX_COUNT
    final maxCount = randomizer.nextInt(11) + 15;
    print("MAX_COUNT: $maxCount");

    // CICLO DA 1 AL MAX_COUNT
    int counter = 1;
    while (counter <= maxCount) {
      // SALVO IL DICE_INDEX PRECEDENTE
      int previousDiceIndex = activeDiceIndex;
      // GENERO IL PROSSIMO DICE_INDEX
      int nextDiceIndex = randomizer.nextInt(6) + 1;
      // CONTROLLO SE CE UN DOPPIONE
      if (nextDiceIndex != previousDiceIndex) {
        // ATTIVO UN DELAY
        await Future.delayed(Duration(milliseconds: 100 + (counter * 50)));
        // AGGIORNO L'ACTIVE_DICE_INDEX
        setState(() {
          activeDiceIndex = nextDiceIndex;
        });
        // STAMPO IL COUNTER ATTUALE
        print("COUNTER: $counter, DICE_INDEX: $activeDiceIndex");
        // INCREMENTO IL COUNTER
        counter++;
      } else {
        // TROVATO UN DOPPIONE
        print("Trovato un doppione");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$activeDiceIndex.png',
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: rollDice,
          child: const StyledText("Roll Dice"),
        )
      ],
    );
  }
}

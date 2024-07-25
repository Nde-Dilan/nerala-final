import 'package:flutter/material.dart';
import 'package:flutter_flashcards/configs/palette.dart';
import 'package:flutter_flashcards/databases/database_manager.dart';
import 'package:flutter_flashcards/notifiers/flashcards_notifier.dart';
import 'package:flutter_flashcards/pages/flashcards_page.dart';
import 'package:flutter_flashcards/utils/methods.dart';
import 'package:provider/provider.dart';
import '../../pages/home_page.dart';

class ResultsBox extends StatefulWidget {
  const ResultsBox({super.key});

  @override
  State<ResultsBox> createState() => _ResultsBoxState();
}

class _ResultsBoxState extends State<ResultsBox> {
  bool _haveSavedCards = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardsNotifier>(
      builder: (_, notifier, __) => SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: FittedBox(
          child: AlertDialog(
            actionsPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            title: Text(
              notifier.isSessionCompleted
                  ? 'Session Completed!'
                  : 'Round Completed!🚀',
              textAlign: TextAlign.center,
            ),
            actions: [
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(1),
                },
                children: [
                  buildTableRow(
                      title: 'Total Rounds',
                      stat: notifier.roundTally.toString()),
                  buildTableRow(
                      title: 'No. Cards', stat: notifier.cardTally.toString()),
                  buildTableRow(
                      title: 'No. Correct',
                      stat: notifier.correctTally.toString()),
                  buildTableRow(
                      title: 'No. Incorrect',
                      stat: notifier.incorrectTally.toString()),
                  buildTableRow(
                      title: 'Correct Percentage',
                      stat: '${notifier.correctPercentage.toString()}%'),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      notifier.isSessionCompleted
                          ? const SizedBox()
                          : ElevatedButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Palette().green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side:
                                        BorderSide(color: Palette().trueWhite),
                                  )),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const FlashcardsPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'Retest Incorrect Cards',
                                style: TextStyle(
                                    color: Palette().trueWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                      notifier.isSessionCompleted
                          ? const SizedBox()
                          : ElevatedButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Palette().black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  )),
                              onPressed: _haveSavedCards
                                  ? null
                                  : () async {
                                      for (int i = 0;
                                          i < notifier.incorrectCards.length;
                                          i++) {
                                        await DatabaseManager().insertWord(
                                            word: notifier.incorrectCards[i]);
                                      }
                                      _haveSavedCards = true;
                                      if (!context.mounted) return;
                                      runQuickBox(
                                          context: context,
                                          text: 'Incorrect Cards Saved!');
                                      Future.delayed(
                                          const Duration(milliseconds: 1000),
                                          () {
                                        if (!mounted) return;
                                        Navigator.maybePop(context);
                                      });
                                      setState(() {});
                                    },
                              child: Text(
                                'Save Incorrect Cards',
                                style: TextStyle(
                                    color: Palette().trueWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Palette().red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )),
                          onPressed: () {
                            notifier.reset();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                                (route) => false);
                          },
                          child: Text('Home',
                              style: TextStyle(
                                  color: Palette().trueWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TableRow buildTableRow({required String title, required String stat}) {
    return TableRow(children: [
      TableCell(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title),
      )),
      TableCell(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          stat,
          textAlign: TextAlign.right,
        ),
      )),
    ]);
  }
}

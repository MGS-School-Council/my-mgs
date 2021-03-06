import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mymgs/data_classes/sportsday/score.dart';
import 'package:mymgs/helpers/responsive.dart';
import 'package:mymgs/helpers/sportsday.dart';
import 'package:mymgs/screens/sportsday/event_group.dart';
import 'package:mymgs/widgets/sportsday/rank_highlight_row.dart';

class FormScoreTile extends StatelessWidget {
  final ScoreNode scoreNode;
  const FormScoreTile({
    required this.scoreNode,
  });

  @override
  Widget build(BuildContext context) {
    final event = scoreNode.event!;
    final subEventLabel = subEventToString(event.subEvent);
    final absoluteScore = scoreNode.absolute;

    return ListTile(
      tileColor: getRankColor(context, scoreNode.position),
      title: Text(
        event.eventGroup!.name + ' (Race $subEventLabel)',
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: Responsive(context).horizontalPadding),
      subtitle: Row(
        children: [
          if (absoluteScore?.isNewRecord ?? false) Text(
            'New record! • ',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            Jiffy(scoreNode.createdAt.toDate()).fromNow(),
          ),
        ],
      ),
      leading: Text(
        scoreNode.position.toString(),
        style: TextStyle(
          fontSize: 30,
        ),
      ),
      trailing: Text(
        '+' + (scoreNode.calculatedPoints ?? 0).toString(),
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      onTap: () {
        Navigator.of(context).push(platformPageRoute(
          context: context,
          builder: (_) => SportsDayEvent(
            eventGroup: event.eventGroup!,
            initialYearGroup: event.yearGroup,
          ),
        ));
      },
    );
  }
}
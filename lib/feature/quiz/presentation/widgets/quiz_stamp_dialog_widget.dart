import 'package:digital_stamp_quiz/common/constants/quiz_color.dart';
import 'package:digital_stamp_quiz/common/hive/models/digital_stamp.dart';
import 'package:digital_stamp_quiz/common/widgets/quiz_custom_button.dart';
import 'package:digital_stamp_quiz/feature/quiz/presentation/view_models/quiz_stamps_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuizStampDialog extends StatelessWidget {
  const QuizStampDialog({super.key, required this.digitalStamp});

  final DigitalStamp digitalStamp;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      child: QuizStamps(digitalStamp: digitalStamp),
    );
  }
}

class QuizStamps extends HookConsumerWidget {
  const QuizStamps({
    super.key,
    required this.digitalStamp,
  });

  final DigitalStamp digitalStamp;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stampsProvider = ref.watch(quizStampsNotifierProvider);
    final stampsNotifier = ref.read(quizStampsNotifierProvider.notifier);

    useEffect(() {
      Future.delayed(Duration.zero, () async {
        await stampsNotifier.getQuizStampsPerCategory(digitalStamp.name);
      });

      return null;
    }, []);

    return Stack(
      children: <Widget>[
        Positioned(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SvgPicture.asset(
                  width: double.infinity,
                  height: 200,
                  'assets/svgs/champion.svg',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Stamps Collected',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 8),
                stampsProvider.when(
                  data: (data) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        data.items.length,
                        (index) => Stack(
                          children: [
                            Icon(
                              Icons.emoji_events,
                              color: data.items[index].isSigned
                                  ? Colors.yellow
                                  : Colors.grey,
                              size: 40,
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      '${index + 1}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  error: (_, __) => const SizedBox.shrink(),
                  loading: () => const CircularProgressIndicator.adaptive(),
                ),
                const SizedBox(height: 16),
                QuizCustomButton(
                  label: 'Reset',
                  onPressed: () async {
                    final goRouter = GoRouter.of(context);
                    await stampsNotifier
                        .resetQuizStampsPerCategory(digitalStamp.name);

                    goRouter.pop();
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: IconButton(
            icon: const Icon(
              Icons.close,
              color: QuizColor.secondary,
            ),
            iconSize: 24.0,
            onPressed: context.pop,
          ),
        )
      ],
    );
  }
}

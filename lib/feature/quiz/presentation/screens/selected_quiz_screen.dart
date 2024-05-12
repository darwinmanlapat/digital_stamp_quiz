import 'package:digital_stamp_quiz/common/constants/quiz_color.dart';
import 'package:digital_stamp_quiz/common/router/app_route.dart';
import 'package:digital_stamp_quiz/feature/quiz/domain/entities/quiz_answer_entity.dart';
import 'package:digital_stamp_quiz/feature/quiz/domain/entities/quiz_entity.dart';
import 'package:digital_stamp_quiz/feature/quiz/presentation/view_models/quiz_category_view_model.dart';
import 'package:digital_stamp_quiz/feature/quiz/presentation/view_models/quiz_page_controller_provider.dart';
import 'package:digital_stamp_quiz/feature/quiz/presentation/view_models/quiz_score_provder.dart';
import 'package:digital_stamp_quiz/feature/quiz/presentation/view_models/quiz_stamps_view_model.dart';
import 'package:digital_stamp_quiz/feature/quiz/presentation/widgets/quiz_score_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectedQuizScreen extends HookConsumerWidget {
  const SelectedQuizScreen({
    super.key,
    required this.quizzes,
    required this.categoryIndex,
  });

  final List<Quiz> quizzes;
  final int categoryIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<double> progress = useState(0.0);
    final quizPageController =
        ref.read(quizPageControllerStateNotifierProvider);
    final categoryStateProvider = ref.read(quizCategoryNotifierProvider);
    final quizScoreProvider = ref.watch(quizScoreStateNotifier);

    void updateProgress() {
      progress.value = quizPageController.page! / (quizzes.length - 1);
    }

    useEffect(() {
      quizPageController.addListener(updateProgress);

      return () => quizPageController.removeListener(updateProgress);
    }, []);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text(
          '${categoryStateProvider.asData?.value[categoryIndex].name}',
          style: const TextStyle(
            fontFamily: 'MS Sans',
            fontSize: 24.0,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: QuizColor.secondary,
            ),
            iconSize: 32.0,
            onPressed: () => context.goNamed(AppRoute.quizDashboard.name),
          ),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: progress.value,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(QuizColor.primary),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: quizzes.length + 1,
              controller: quizPageController,
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling
              itemBuilder: (context, index) {
                if (index == quizzes.length) {
                  Center(
                    child: Text('$quizScoreProvider/${quizzes.length}'),
                  );

                  return ScoreWidget(
                    quizScore: quizScoreProvider,
                    totalQuizzes: quizzes.length,
                  );
                }

                return _QuizQuestionPage(
                  quiz: quizzes[index],
                  quizLength: quizzes.length,
                  questionIndex: index,
                  categoryName:
                      categoryStateProvider.asData?.value[categoryIndex].name ??
                          'Space and Astronomy',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _QuizQuestionPage extends StatelessWidget {
  const _QuizQuestionPage({
    required this.quiz,
    required this.quizLength,
    required this.questionIndex,
    required this.categoryName,
  });

  final Quiz quiz;
  final int quizLength;
  final int questionIndex;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF001F3F), Color(0xFF005F81)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text(
              'Question ${questionIndex + 1}/$quizLength',
              style: const TextStyle(
                fontSize: 16,
                color: QuizColor.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              quiz.question,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: QuizColor.white,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: _QuizAnswersWidget(
                quizAnswers: quiz.answers,
                questionIndex: questionIndex,
                categoryName: categoryName,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuizAnswersWidget extends HookConsumerWidget {
  const _QuizAnswersWidget({
    required this.quizAnswers,
    required this.questionIndex,
    required this.categoryName,
  });

  final List<QuizAnswer> quizAnswers;
  final int questionIndex;
  final String categoryName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizPageController =
        ref.read(quizPageControllerStateNotifierProvider);
    final quizScoreNotifier = ref.read(quizScoreStateNotifier.notifier);
    final quizStampsNotifier = ref.read(quizStampsNotifierProvider.notifier);
    ValueNotifier<bool> hasSelected = useState(false);
    ValueNotifier<int?> selectedIndex = useState(null);

    useEffect(() => null, [hasSelected.value]);

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: quizAnswers.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: !hasSelected.value
                    ? () {
                        selectedIndex.value = index;

                        if (quizAnswers[index].isCorrect) {
                          quizStampsNotifier.updateQuizStampsPerCategory(
                            categoryName,
                            questionIndex,
                          );

                          quizScoreNotifier.incrementScore();
                        }

                        Future.delayed(const Duration(seconds: 1), () {
                          if (quizPageController.page! == questionIndex) {
                            quizPageController.animateToPage(
                              quizPageController.page!.round() + 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          }
                        });

                        hasSelected.value = true;
                      }
                    : null,
                child: SizedBox(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                        width: 1,
                      ),
                      color: hasSelected.value && selectedIndex.value == index
                          ? quizAnswers[index].isCorrect
                              ? Colors.green.shade300
                              : Colors.red.shade300
                          : QuizColor.primary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              quizAnswers[index].selection,
                              style: const TextStyle(
                                fontSize: 16,
                                color: QuizColor.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                              width:
                                  10), // Add spacing between text and checkbox if needed
                          if (hasSelected.value && selectedIndex.value == index)
                            Icon(
                              quizAnswers[index].isCorrect
                                  ? Icons.check
                                  : Icons.close,
                              color: Colors.white,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

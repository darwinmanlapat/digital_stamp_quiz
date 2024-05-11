import 'package:digital_stamp_quiz/common/constants/quiz_color.dart';
import 'package:digital_stamp_quiz/common/router/app_route.dart';
import 'package:digital_stamp_quiz/feature/quiz/presentation/view_models/quiz_category_view_model.dart';
import 'package:digital_stamp_quiz/feature/quiz/presentation/widgets/quiz_stamp_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuizCategoriesListWidget extends HookConsumerWidget {
  const QuizCategoriesListWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizCategoryNotifier =
        ref.read(quizCategoryNotifierProvider.notifier);
    final quizCategoryProvider = ref.watch(quizCategoryNotifierProvider);

    useEffect(() {
      Future.delayed(Duration.zero, () async {
        await quizCategoryNotifier.getQuizCategories();
      });

      return null;
    }, []);

    return quizCategoryProvider.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  height: 200,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(data[index].image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        data[index].name,
                        style: const TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 24.0,
                          color: QuizColor.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      contentPadding: const EdgeInsets.only(
                        left: 12.0,
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.emoji_events,
                          color: QuizColor.primary,
                        ),
                        iconSize: 40.0,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return QuizStampDialog(
                                digitalStamp: data[index].digitalStamp,
                              ); // Pass the actual highest score here
                            },
                          );
                        },
                      ),
                      onTap: () {
                        context.goNamed(
                          AppRoute.selectedQuiz.name,
                          pathParameters: {
                            'id': data[index].id.toString(),
                          },
                          extra: {
                            'quizzes': data[index].quizzes,
                            'index': index,
                          },
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
        error: (_, __) => const Center(
              child: Text('Something went wrong'),
            ),
        loading: () => const CircularProgressIndicator());
  }
}

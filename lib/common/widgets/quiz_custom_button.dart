import 'package:digital_stamp_quiz/common/constants/quiz_color.dart';
import 'package:digital_stamp_quiz/common/widgets/quiz_loading_indicator.dart';
import 'package:flutter/material.dart';

class QuizCustomButton extends StatelessWidget {
  const QuizCustomButton({
    super.key,
    required this.label,
    this.onPressed,
    this.width,
    this.height,
    this.isLoading,
  }) : _type = _ButtonType.contained;

  const QuizCustomButton.outlined({
    super.key,
    required this.label,
    this.onPressed,
    this.width,
    this.height,
    this.isLoading,
  }) : _type = _ButtonType.outlined;

  const QuizCustomButton.text({
    super.key,
    required this.label,
    this.onPressed,
    this.width,
    this.height,
    this.isLoading,
  }) : _type = _ButtonType.text;

  final String label;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final _ButtonType _type;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case _ButtonType.contained:
        return InkWell(
          onTap: isLoading ?? false ? null : onPressed,
          child: SizedBox(
            width: width,
            height: height ?? 48,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: QuizColor.primary,
              ),
              child: Align(
                child: isLoading ?? false
                    ? const SizedBox(
                        height: 14,
                        width: 14,
                        child: QuizLoadingIndicator(),
                      )
                    : Text(
                        label,
                        style: const TextStyle(
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: QuizColor.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
              ),
            ),
          ),
        );
      case _ButtonType.outlined:
        return InkWell(
          onTap: onPressed,
          child: SizedBox(
            width: width,
            height: height ?? 48,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: QuizColor.white,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                  color: QuizColor.primary,
                  width: 2,
                ),
              ),
              child: Align(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: QuizColor.primary,
                  ),
                ),
              ),
            ),
          ),
        );
      case _ButtonType.text:
        return InkWell(
          onTap: onPressed,
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: QuizColor.primary,
            ),
          ),
        );
    }
  }
}

enum _ButtonType {
  contained,
  outlined,
  text,
}

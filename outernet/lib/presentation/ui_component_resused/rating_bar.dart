import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:outernet/presentation/themes.dart';

class RatingBar extends StatefulWidget {
  final int maxRating;
  final double initialRating;
  final ValueChanged<double> onRatingChanged;
  final Color filledColor;
  final Color unfilledColor;
  final double size;
  final bool isInteractive;

  const RatingBar({
    super.key,
    this.maxRating = 5,
    this.initialRating = 0.0,
    required this.onRatingChanged,
    this.filledColor = AppColors.primary,
    this.unfilledColor = Colors.grey,
    this.size = 24.0,
    this.isInteractive = true,
  });

  @override
  _RatingBarState createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  late double _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  void _updateRating(double rating) {
    setState(() {
      _currentRating = rating;
    });
    widget.onRatingChanged(_currentRating);
  }

  Widget _buildStar(int index) {
    IconData icon;
    Color color;

    if (index >= _currentRating) {
      icon = Iconsax.star;
      color = widget.unfilledColor;
    } else if (index > _currentRating - 1 && index < _currentRating) {
      icon = Iconsax.star;
      color = widget.unfilledColor;
    } else {
      icon = Iconsax.star;
      color = widget.filledColor;
    }

    return GestureDetector(
      onTap: widget.isInteractive
          ? () {
              _updateRating(index + 1.0);
            }
          : null,
      onHorizontalDragUpdate: widget.isInteractive
          ? (details) {
              RenderBox box = context.findRenderObject() as RenderBox;
              Offset localPosition = box.globalToLocal(details.globalPosition);
              double newRating = localPosition.dx / widget.size;
              if (newRating > widget.maxRating) {
                newRating = widget.maxRating.toDouble();
              } else if (newRating < 0) {
                newRating = 0.0;
              }
              _updateRating(newRating);
            }
          : null,
      child: Icon(
        icon,
        color: color,
        size: widget.size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.maxRating, (index) => _buildStar(index)),
    );
  }
}
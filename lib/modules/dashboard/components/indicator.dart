import 'package:flutter/material.dart';

class Indicator extends StatefulWidget {
  Indicator({
    this.controller,
    this.itemCount: 0,
  }) : assert(controller != null);

  /// PageView Controller
  final PageController controller;

  /// Number of indicators
  final int itemCount;

  @override
  _IndicatorState createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  /// Ordinary colours
  final Color normalColor = Colors.blue;

  /// Selected color
  final Color selectedColor = Colors.red;

  /// Size of points
  final double size = 8.0;

  /// Spacing of points
  final double spacing = 4.0;

  /// Point Widget
  Widget _buildIndicator(
      int index, int pageCount, double dotSize, double spacing) {
    // Is the current page selected?
    // print(controller.page);
    final _index = (widget.controller != null && widget.controller.page != null)
        ? widget.controller.page.round() % pageCount
        : 0;
    bool isCurrentPageSelected = (index == _index);

    return Container(
      height: size,
      width: size + (2 * spacing),
      child: Center(
        child: Material(
          color: isCurrentPageSelected ? selectedColor : normalColor,
          type: MaterialType.circle,
          child: Container(
            width: dotSize,
            height: dotSize,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(widget.itemCount, (int index) {
        return _buildIndicator(index, widget.itemCount, size, spacing);
      }),
    );
  }
}

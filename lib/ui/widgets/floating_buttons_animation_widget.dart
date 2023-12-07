import 'package:flutter/material.dart';

class FloatingButtonsAnimationWidget extends StatefulWidget {
  FloatingButtonsAnimationWidget({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FloatingButtonsAnimationWidget>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          if (_isExpanded) {
            _toggleExpanded();
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            IgnorePointer(
              ignoring: !_isExpanded,
              child: FadeTransition(
                opacity: _animation,
                child: GestureDetector(
                  onTap: _toggleExpanded,
                  child: Container(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildFloatingActionButton(1, Icons.mail),
          SizedBox(height: 16.0),
          _buildFloatingActionButton(2, Icons.chat),
          SizedBox(height: 16.0),
          _buildFloatingActionButton(3, Icons.call),
          SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: _toggleExpanded,
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animationController,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildFloatingActionButton(int index, IconData icon) {
    final double buttonSize = 56.0;
    final double expandedButtonSize = 64.0;
    // final double buttonSpacing = 16.0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: _isExpanded ? expandedButtonSize : buttonSize,
      height: _isExpanded ? expandedButtonSize : buttonSize,
      child: FloatingActionButton(
        onPressed: () {
          // Обработка нажатия на кнопку
        },
        child: Icon(icon),
      ),
    );
  }
}

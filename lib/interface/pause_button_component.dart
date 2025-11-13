import 'package:bonfire/bonfire.dart';
import 'package:darkness_dungeon/util/dialogs.dart';
import 'package:flutter/material.dart';

class PauseButtonComponent extends InterfaceComponent {
  bool _isPaused = false;
  
  PauseButtonComponent()
      : super(
          id: 2,
          position: Vector2(0, 20), // Se calculará en onMount
          size: Vector2(40, 40),
        );
  
  @override
  void onMount() {
    // Posicionar en la esquina superior derecha
    position = Vector2(
      gameRef.size.x - width - 20, // 20px desde la derecha
      20, // 20px desde arriba
    );
    super.onMount();
  }

  @override
  void render(Canvas canvas) {
    // Dibujar fondo del botón
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill;
    
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, width, height),
        Radius.circular(8),
      ),
      paint,
    );
    
    // Dibujar icono de pausa (dos barras verticales)
    final iconPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    
    // Barra izquierda
    canvas.drawRect(
      Rect.fromLTWH(12, 10, 6, 20),
      iconPaint,
    );
    
    // Barra derecha
    canvas.drawRect(
      Rect.fromLTWH(22, 10, 6, 20),
      iconPaint,
    );
    
    super.render(canvas);
  }

  @override
  bool onTapDown(GestureEvent event) {
    if (!_isPaused) {
      _isPaused = true;
      _showPauseMenu();
      return true;
    }
    return false;
  }

  void _showPauseMenu() {
    Dialogs.showPauseMenu(
      gameRef.context,
      onResume: () {
        _isPaused = false;
      },
      onRestart: () {
        _isPaused = false;
      },
      onMainMenu: () {
        _isPaused = false;
      },
    );
  }
}


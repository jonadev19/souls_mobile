# 🧪 Sistema de Pociones

## ¿Cómo Usar las Pociones?

Las pociones ahora se pueden usar fácilmente durante el juego con un **sistema inteligente** que selecciona automáticamente la mejor poción disponible según tu vida actual.

## 🎮 Controles

### Teclado
Presiona la tecla **C** para usar una poción

### Joystick en Pantalla
Presiona el **botón inferior derecho** (botón 3)

## 🎯 Ubicación de los Botones

```
Joystick (Derecha de la pantalla):

    [🛡️]  [🧪]  ← Botones superiores
                   (Escudo y Poción)
    
    [🔥]  [⚔️]  ← Botones inferiores
                   (Distancia y Cuerpo a cuerpo)
```

## 🧠 Sistema Inteligente de Selección

El juego **automáticamente elige la mejor poción** para no desperdiciar recursos:

### Lógica de Selección

| Vida Faltante | Poción Usada | Razón |
|---------------|--------------|-------|
| ≤ 50 HP | 🧪 Poción Pequeña | Suficiente para recuperarte |
| 51-100 HP | 🧪 Poción Mediana | Óptima para esa cantidad |
| > 100 HP | 🧪 Poción Grande | Necesitas mucha curación |

**Si no tienes la poción óptima:**
- El juego usa la siguiente mejor opción disponible
- Si solo tienes pociones grandes pero necesitas 30 HP, las usará (no se desperdicia completamente)

### Ejemplos Prácticos

**Ejemplo 1: Vida 150/200 (falta 50 HP)**
1. Presionas **C**
2. El juego usa **Poción Pequeña** (+50 HP)
3. Quedas con 200/200 HP ✅

**Ejemplo 2: Vida 50/200 (falta 150 HP)**
1. Presionas **C**
2. El juego usa **Poción Grande** (+200 HP)
3. Quedas con 200/200 HP (el exceso no se pierde) ✅

**Ejemplo 3: Vida 120/200 (falta 80 HP, no tienes Poción Mediana)**
1. Presionas **C**
2. El juego usa **Poción Grande** (la siguiente disponible)
3. Quedas con 200/200 HP ✅

## 🛡️ Protección Automática

- ✅ **No puedes usar poción si tu vida está llena** (ahorra pociones)
- ✅ **No pasa nada si no tienes pociones** (no genera error)
- ✅ **Efecto visual** de curación al usar poción

## 📦 Tipos de Pociones

| Poción | Curación | Precio | Cuándo Comprar |
|--------|----------|--------|----------------|
| 🧪 **Pequeña** | +50 HP | 20 monedas | Para curaciones menores frecuentes |
| 🧪 **Mediana** | +100 HP | 40 monedas | Balance entre precio y efecto |
| 🧪 **Grande** | +200 HP | 70 monedas | Para emergencias o jefes |

## 💡 Consejos Estratégicos

### Compra Inteligente
- **Compra variedad**: Tener de los 3 tipos optimiza el uso
- **Prioriza pequeñas y medianas**: Son más versátiles
- **Pociones grandes para jefes**: Guárdalas para batallas difíciles

### Uso en Combate
- ✅ **Usa frecuentemente**: No acumules pociones, úsalas cuando sea necesario
- ✅ **No esperes estar casi muerto**: Usa cuando bajes del 60% de vida
- ✅ **Combina con escudo**: Usa escudo primero, luego poción si es necesario
- ✅ **En combate intenso**: Aléjate un momento, usa poción, vuelve al ataque

### Estrategia Económica
1. **Batalla normal**: Poción pequeña (20 monedas)
2. **Situación complicada**: Poción mediana (40 monedas)
3. **Casi muerto vs jefe**: Poción grande (70 monedas)

## 🎯 Resumen de Controles del Juego

| Acción | Teclado | Joystick |
|--------|---------|----------|
| Movimiento | ↑↓←→ | Stick Analógico |
| Ataque Cuerpo a Cuerpo | ESPACIO | Botón grande (abajo derecha) |
| Ataque a Distancia | Z | Botón pequeño (medio izquierda) |
| 🛡️ **Activar Escudo** | **X** | **Botón pequeño (arriba izquierda)** |
| 🧪 **Usar Poción** | **C** | **Botón pequeño (arriba derecha)** ⭐ |

## ✨ Efecto Visual

Cuando uses una poción verás:
- ✨ **Animación de curación** sobre el personaje
- ❤️ **Barra de vida** aumentando inmediatamente
- 🎵 **Sonido de curación** (si está implementado)

## 🎒 Ver Tu Inventario

Para ver cuántas pociones tienes:
1. Presiona el **botón de inventario** 🎒 (esquina superior derecha)
2. Verás la sección **CONSUMIBLES**
3. Aparecerán las cantidades: `x0`, `x5`, etc.

---

¡Ahora tienes control total sobre tu supervivencia! 🧪✨


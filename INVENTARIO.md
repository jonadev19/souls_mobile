# 🎒 Sistema de Inventario

## ¿Qué es el Inventario?

El **inventario** es donde puedes ver todos los ítems que has comprado en la tienda, incluyendo consumibles y mejoras permanentes. Ahora puedes revisar en cualquier momento qué tienes disponible.

## 🎮 Cómo Acceder al Inventario

### Ubicación del Botón
En la **esquina superior derecha** de la pantalla verás:
- **Botón de Pausa** ⏸️ (arriba)
- **Botón de Inventario** 🎒 (debajo) ← **NUEVO**

### Abrir el Inventario
1. Durante el juego, presiona el **botón amarillo de la mochila** 🎒
2. Se abrirá un panel mostrando todo tu inventario
3. Presiona **Cerrar** o toca fuera del panel para cerrarlo

## 📦 Qué Muestra el Inventario

### Sección 1: CONSUMIBLES

Muestra la cantidad de cada ítem que puedes usar:

| Ítem | Descripción | Uso |
|------|-------------|-----|
| 🛡️ **Escudo Mágico** | 30s de invencibilidad | Presiona **X** (teclado) o **botón superior izq.** (joystick) |
| 🧪 **Poción Pequeña** | Restaura 50 HP | Presiona **C** (teclado) o **botón superior der.** (joystick) |
| 🧪 **Poción Mediana** | Restaura 100 HP | Presiona **C** (teclado) o **botón superior der.** (joystick) |
| 🧪 **Poción Grande** | Restaura 200 HP | Presiona **C** (teclado) o **botón superior der.** (joystick) |
| 🔑 **Llaves** | Abre puertas | Automático al tocar puerta |

**Indicadores de cantidad:**
- `x0` - No tienes (gris)
- `x1`, `x2`, etc. - Cantidad disponible (color brillante)

### Sección 2: MEJORAS PERMANENTES

Muestra qué mejoras has comprado (activas para siempre):

| Mejora | Efecto | Estado |
|--------|--------|--------|
| ⚔️ **Espada Mejorada** | +10 ataque | ✅ / ❌ |
| ⚔️ **Espada Legendaria** | +20 ataque | ✅ / ❌ |
| 👟 **Botas de Velocidad** | +30% velocidad | ✅ / ❌ |
| 💎 **Amuleto de Stamina** | +50 stamina max | ✅ / ❌ |
| 💎 **Amuleto Supremo** | +100 stamina max | ✅ / ❌ |
| ❤️ **Corazón de Vida** | +50 vida max | ✅ / ❌ |
| ❤️ **Corazón Legendario** | +100 vida max | ✅ / ❌ |

**Indicadores:**
- ✅ Verde = Ya lo tienes (activo permanentemente)
- ❌ Gris = No lo tienes aún

## 🎨 Diseño Visual

```
┌─────────────────────────────┐
│  🎒 INVENTARIO          ✕   │
├─────────────────────────────┤
│                             │
│  CONSUMIBLES                │
│  ┌─────────────────────┐   │
│  │ 🛡️ Escudo Mágico x2 │   │
│  │ 🧪 Poción Pequeña x5│   │
│  │ 🧪 Poción Mediana x3│   │
│  │ 🧪 Poción Grande x1 │   │
│  │ 🔑 Llaves x4        │   │
│  └─────────────────────┘   │
│                             │
│  MEJORAS PERMANENTES        │
│  ┌─────────────────────┐   │
│  │ ⚔️ Espada Mejorada ✅│   │
│  │ ⚔️ Espada Legend.  ❌│   │
│  │ 👟 Botas Velocidad ✅│   │
│  │ 💎 Amuleto Stamina ✅│   │
│  │ 💎 Amuleto Supremo ❌│   │
│  │ ❤️ Corazón Vida    ✅│   │
│  │ ❤️ Corazón Legend. ❌│   │
│  └─────────────────────┘   │
│                             │
│     [ CERRAR ]              │
└─────────────────────────────┘
```

## 💡 Consejos de Uso

### Antes de Batalla
- **Revisa tu inventario** antes de enfrentarte a jefes
- **Asegúrate de tener** escudos y pociones suficientes
- **Compra ítems** en la tienda si te estás quedando sin recursos

### Durante el Juego
- **Abre rápido** el inventario para verificar cantidades
- **Planifica** cuándo usar tus consumibles
- **No te quedes sin pociones** en áreas peligrosas

### Estrategia
- **Escudos**: Úsalos en peleas difíciles (1-2 por jefe)
- **Pociones grandes**: Guárdalas para emergencias
- **Pociones pequeñas**: Úsalas frecuentemente
- **Llaves**: Necesarias para abrir puertas especiales

## 🔄 Sincronización con Tienda

El inventario se actualiza automáticamente cuando:
- ✅ Compras ítems en la tienda
- ✅ Usas consumibles en el juego
- ✅ Recoges ítems en el mapa
- ✅ Compras mejoras permanentes

## 🎯 Atajos de Teclado

| Acción | Teclado |
|--------|---------|
| Abrir Inventario | *(Clic en botón 🎒)* |
| Usar Escudo | **X** |
| Usar Poción | **C** ⭐ |

## 🛠️ Características Técnicas

- **Actualización en tiempo real**: Las cantidades se actualizan al instante
- **Persistencia**: Tu inventario se guarda automáticamente
- **Interfaz visual**: Diseño claro y fácil de leer
- **Colores intuitivos**: 
  - 🟢 Verde = Activo/Disponible
  - 🟡 Amarillo = Destacado
  - ⚪ Gris = No disponible

---

¡Ahora puedes gestionar mejor tus recursos y planificar tus estrategias! 🎒✨


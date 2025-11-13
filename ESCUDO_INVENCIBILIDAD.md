# 🛡️ Escudo Mágico - Sistema de Invencibilidad

## ¿Qué es el Escudo Mágico?

El **Escudo Mágico** es un ítem consumible especial que otorga **30 segundos de invencibilidad total** al jugador. Durante este tiempo, el jugador no recibirá daño de ningún enemigo.

## 📦 Cómo Comprar el Escudo

1. Abre la **Tienda** desde el menú principal
2. Ve a la sección de **ítems consumibles**
3. Busca el **🛡️ Escudo Mágico**
   - **Precio:** 100 monedas
   - **Efecto:** 30 segundos de invencibilidad
4. Compra el escudo (se guardará en tu inventario)

## 🎮 Cómo Usar el Escudo

Una vez comprado, puedes activar el escudo durante el juego:

### Teclado
- Presiona la tecla **X** para activar el escudo

### Joystick en Pantalla (Móvil/Tablet)
- Verás **3 botones** a la derecha de la pantalla:
  - **Botón grande (abajo)**: Ataque cuerpo a cuerpo
  - **Botón pequeño (izquierda)**: Ataque a distancia
  - **Botón pequeño (arriba)**: 🛡️ **ESCUDO** ← Este es el nuevo botón

### Ubicación del Botón del Escudo
```
    [🛡️]  ← Botón del Escudo (arriba)
    
    [🔥]  ← Ataque a distancia
    
         [⚔️] ← Ataque cuerpo a cuerpo (grande)
```

### Notas Importantes
- ⚠️ Solo puedes usar el escudo si lo tienes en tu inventario
- ⚠️ No puedes activar otro escudo mientras uno ya está activo
- ⚠️ El escudo se consume al usarlo (necesitarás comprar más)
- ℹ️ El botón aparecerá en la parte superior izquierda de los controles

## ✨ Efectos Visuales

Cuando el escudo está activo verás múltiples indicadores:

### 1. Indicador en la Parte Superior (Nuevo! ⭐)
En el **centro superior de la pantalla** aparecerá un panel con:
- 🛡️ Texto **"ESCUDO ACTIVO"** en color cyan
- ⏱️ **Contador de tiempo** mostrando los segundos restantes
- 📊 **Barra de progreso** que cambia de color:
  - **Cyan**: Más de 15 segundos restantes
  - **Amarillo**: Entre 7-15 segundos
  - **Naranja**: Menos de 7 segundos (¡cuidado!)

### 2. Efecto Alrededor del Jugador
- **Círculo brillante cyan** alrededor del personaje
- **Efecto pulsante**: El círculo aumenta y disminuye de tamaño
- **Parpadeo suave**: Se desvanece y aparece continuamente
- **Grosor incrementado**: Borde más grueso y visible

### 3. Indicador de Daño
- **Daño mostrado como "0"** en color cyan cuando los enemigos te atacan
- Confirma que estás protegido completamente

### 4. Desactivación Automática
- **El efecto desaparece** automáticamente después de 30 segundos
- El panel superior y el círculo se desvanecen al terminar

## 📺 Cómo Interpretar los Indicadores

### Panel Superior
```
┌─────────────────────────────┐
│  🛡️ ESCUDO ACTIVO           │
│      23s                    │
│  ████████████░░░░░          │ ← Barra de progreso
└─────────────────────────────┘
```

- **Verde/Cyan**: Tiempo de sobra, sigue atacando
- **Amarillo**: Quedan pocos segundos, prepárate
- **Naranja**: ¡Casi se acaba! Busca un lugar seguro

### Visual del Jugador
El círculo pulsante te permite:
- ✅ Saber que estás protegido sin mirar arriba
- ✅ Calcular la distancia de seguridad de los enemigos
- ✅ Ver el efecto incluso en combate intenso

## 💡 Consejos Estratégicos

- **Guarda el escudo** para situaciones difíciles (muchos enemigos, jefes)
- **Úsalo en combos** con tus ataques más poderosos para ser agresivo sin riesgo
- **Observa el contador**: Cuando llegue a 5 segundos, empieza a alejarte de los enemigos
- **Planifica bien** cuándo usarlo, ya que es un ítem consumible costoso (100 monedas)
- **Compra varios** antes de enfrentarte a jefes importantes
- **No desperdicies**: Si te quedan más de 15 segundos, ¡sigue atacando!
- **Combínalo con pociones**: Usa el escudo primero y luego la poción si necesitas vida

## 🛠️ Implementación Técnica

El sistema de invencibilidad:

- Se almacena en el inventario como ítem consumible
- Se activa mediante el método `useInvincibilityShield()`
- Modifica el comportamiento de `onReceiveDamage()` para ignorar todo el daño
- Incluye un temporizador de 30 segundos
- Muestra efectos visuales animados

## 🎯 Resumen de Controles del Juego

| Acción | Teclado | Joystick en Pantalla |
|--------|---------|----------------------|
| Movimiento | Flechas ↑↓←→ | Stick Analógico (izquierda) |
| Atacar Cuerpo a Cuerpo | ESPACIO | Botón grande (abajo derecha) |
| Ataque a Distancia | Z | Botón pequeño (medio) |
| **🛡️ Activar Escudo** | **X** | **Botón pequeño (arriba)** ⭐ |

---

¡Ahora tu escudo mágico funciona perfectamente! 🎉


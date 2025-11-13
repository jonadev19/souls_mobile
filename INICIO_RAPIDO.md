# 🚀 Inicio Rápido - Sistema de Tienda

## ⚡ Prueba Rápida (5 minutos)

### 1. Instalar Dependencias
```bash
cd /Users/jonadev/Desktop/dev/darkness_dungeon
flutter pub get
```

### 2. Ejecutar el Juego
```bash
flutter run
```

### 3. Agregar Monedas de Prueba

**Opción A: Desde el código (recomendado para testing)**

Edita `lib/main.dart` y agrega al inicio de la función `main()`:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 🧪 TESTING: Agregar monedas de prueba
  // Descomenta estas líneas para agregar monedas:
  // import 'package:darkness_dungeon/util/debug_helpers.dart';
  // await DebugHelpers.giveStarterPack(); // 1000 monedas + items
  
  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }
  // ... resto del código
}
```

**Opción B: Comprar con dinero simulado**

1. Abre el juego
2. Presiona el botón dorado "Tienda"
3. Ve a la pestaña "Monedas"
4. Compra cualquier paquete (está en modo simulación)
5. ¡Listo! Las monedas se agregan automáticamente

### 4. Probar la Tienda

1. **Abrir la tienda:**
   - Menú principal → Botón dorado "Tienda"

2. **Comprar items con monedas:**
   - Pestaña "Items" → Selecciona cualquier item
   - Confirma la compra

3. **Ver tus monedas:**
   - En la tienda: barra superior
   - En el juego: esquina superior derecha

4. **Verificar mejoras:**
   - Compra una mejora permanente (ej: Espada Mejorada)
   - Inicia una partida
   - El ataque del jugador habrá aumentado

---

## 🎮 Comandos de Debug Útiles

### Agregar Monedas
```dart
import 'package:darkness_dungeon/util/debug_helpers.dart';

// Agregar 500 monedas
await DebugHelpers.addTestCoins(500);
```

### Desbloquear Todo
```dart
// Desbloquear todas las mejoras
await DebugHelpers.unlockAllUpgrades();

// Agregar items consumibles
await DebugHelpers.addTestConsumables();
```

### Ver Estado del Inventario
```dart
// Mostrar todo el inventario en consola
await DebugHelpers.printInventoryStatus();
```

### Resetear Todo
```dart
// Borrar todo el inventario
await DebugHelpers.resetInventory();
```

---

## 📱 Prueba en Dispositivo Real

### Android
```bash
flutter run -d <device-id>
```

### iOS
```bash
flutter run -d <device-id>
```

### Web (sin Mercado Pago)
```bash
flutter run -d chrome
```

---

## 🔧 Configuración de Mercado Pago (Producción)

### Paso 1: Obtener Token
1. Ve a https://www.mercadopago.com.mx/developers
2. Crea una aplicación
3. Copia tu Access Token

### Paso 2: Configurar
Edita `lib/shop/mercadopago_service.dart`:

```dart
static const String _accessToken = 'TU_TOKEN_AQUI';
```

### Paso 3: Activar Pagos Reales
Ver instrucciones completas en `MERCADOPAGO_SETUP.md`

---

## 🎯 Items para Probar

### Mejoras Permanentes (Efectos Visibles)
- ✅ **Espada Mejorada** (150 monedas) → +10 ataque
- ✅ **Botas de Velocidad** (200 monedas) → +30% velocidad
- ✅ **Amuleto de Stamina** (180 monedas) → +50 stamina máxima

### Consumibles
- ✅ **Poción Mediana** (40 monedas) → Restaura 100 vida
- ✅ **Llave de Plata** (50 monedas) → Abre puertas

### Paquetes de Monedas (Simulados)
- ✅ **100 Monedas** ($20 MXN simulados)
- ✅ **Pack Iniciante** ($40 MXN simulados) → 200 monedas + extras

---

## 📊 Verificar que Todo Funciona

### ✅ Checklist de Prueba

1. **Menú Principal**
   - [ ] Se ve el botón dorado "Tienda"
   - [ ] Al presionarlo abre la pantalla de tienda

2. **Pantalla de Tienda**
   - [ ] Se ven dos pestañas: "Monedas" y "Items"
   - [ ] Se muestra el contador de monedas arriba
   - [ ] Los items se muestran en grid con imágenes

3. **Compras con Dinero Simulado**
   - [ ] Pestaña "Monedas" → Comprar paquete
   - [ ] Aparece diálogo de confirmación
   - [ ] Después de confirmar, las monedas aumentan
   - [ ] Aparece mensaje de éxito

4. **Compras con Monedas**
   - [ ] Pestaña "Items" → Comprar item
   - [ ] Las monedas se descuentan correctamente
   - [ ] Items permanentes muestran "✓ COMPRADO"
   - [ ] No se pueden comprar dos veces

5. **En el Juego**
   - [ ] Se ve el contador de monedas (esquina superior derecha)
   - [ ] Las mejoras se aplican al jugador
   - [ ] Los stats aumentan correctamente

6. **Persistencia**
   - [ ] Cerrar y reabrir el juego
   - [ ] Las monedas y compras se mantienen
   - [ ] Las mejoras siguen aplicadas

---

## 🐛 Solución Rápida de Problemas

### No se ven las monedas en el juego
```dart
// Verifica que el inventario se esté cargando
await DebugHelpers.printInventoryStatus();
```

### Las mejoras no se aplican
```dart
// Verifica que el Knight esté cargando el inventario
// Revisa la consola para ver si hay errores
```

### Error al compilar
```bash
# Limpia el proyecto
flutter clean
flutter pub get
flutter run
```

### No aparecen las imágenes de items
- Las imágenes usan los assets existentes del juego
- Si faltan, se muestra un icono de placeholder

---

## 📞 Ayuda Adicional

- **Documentación completa:** `MERCADOPAGO_SETUP.md`
- **Resumen del sistema:** `TIENDA_RESUMEN.md`
- **Código fuente:** Todos los archivos están comentados

---

## 🎉 ¡Listo para Probar!

El sistema está completamente funcional. Solo necesitas:

1. ✅ `flutter pub get`
2. ✅ `flutter run`
3. ✅ Presionar el botón "Tienda"
4. ✅ ¡Disfrutar!

Para producción, configura Mercado Pago siguiendo `MERCADOPAGO_SETUP.md`

---

**¡Buena suerte! 🚀🎮**


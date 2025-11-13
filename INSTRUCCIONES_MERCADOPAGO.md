# 🚀 Instrucciones para Integrar MercadoPago

## ✅ ¿Qué se ha hecho?

He actualizado tu sistema de tienda para que esté listo para integrarse con MercadoPago. Los cambios incluyen:

1. **Flujo real de pagos**: Ahora la app redirige a MercadoPago para procesar pagos reales
2. **Sistema de compras pendientes**: Guarda referencias de compras para verificarlas después
3. **Diálogos informativos**: Informa al usuario cuando se redirige a pagar

## 📋 Pasos para Completar la Integración

### **Paso 1: Obtener tu Access Token de MercadoPago** ⭐ OBLIGATORIO

1. Ve a [MercadoPago Developers Panel](https://www.mercadopago.com.mx/developers/panel)
2. Crea una cuenta o inicia sesión
3. Haz clic en "Tus integraciones" → "Crear aplicación"
4. Dale un nombre a tu aplicación (ej: "Darkness Dungeon Shop")
5. Ve a la sección "Credenciales"
6. Copia el **Access Token de Prueba** (para desarrollo)

### **Paso 2: Configurar el Token en tu App** ⭐ OBLIGATORIO

Abre el archivo `lib/shop/mercadopago_service.dart` y busca la línea 7:

```dart
static const String _accessToken = 'TU_ACCESS_TOKEN_AQUI';
```

Reemplázalo con tu token real:

```dart
static const String _accessToken = 'APP_USR-1234567890abcdef...'; // Tu token aquí
```

⚠️ **MUY IMPORTANTE:**
- Para desarrollo usa el **Access Token de Prueba**
- Para producción usa el **Access Token de Producción**
- **NUNCA** subas tu token a GitHub o repositorios públicos
- Considera usar variables de entorno en producción

### **Paso 3: Probar con Modo Simulación (Opcional)**

Si quieres probar sin configurar MercadoPago aún, puedes usar el modo simulación:

En `lib/shop/shop_screen.dart` (alrededor de línea 881-894), descomenta el bloque de código de simulación:

```dart
// MODO PRUEBA: Simular compra (descomenta esto para pruebas sin MercadoPago)
final success = await mpService.simulatePurchase(
  itemId: item.id,
  amount: item.priceInMoney,
);

if (success) {
  await _processSuccessfulPurchase(item);
  _showSuccessDialog('¡Compra exitosa!', 'Has comprado ${item.name}');
} else {
  _showErrorDialog('Error en la compra', 'Por favor intenta de nuevo');
}
```

Y comenta el bloque de "MODO REAL" que está debajo.

### **Paso 4: Configurar Deep Links (Avanzado - Opcional)**

Para que la app reciba confirmaciones de pago automáticamente:

#### Android (`android/app/src/main/AndroidManifest.xml`)

Dentro de la etiqueta `<activity>` principal, agrega:

```xml
<intent-filter>
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="darknessdungeon" />
</intent-filter>
```

#### iOS (`ios/Runner/Info.plist`)

Agrega antes del cierre `</dict>`:

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>darknessdungeon</string>
        </array>
    </dict>
</array>
```

### **Paso 5: Probar en Dispositivo Real**

1. Compila la app en tu dispositivo:
   ```bash
   flutter run
   ```

2. Ve al menú principal y presiona el botón **"Tienda"** (dorado)

3. Selecciona la pestaña **"DINERO REAL"**

4. Intenta comprar un paquete de monedas

5. La app te redirigirá a MercadoPago

6. Completa el pago de prueba con las credenciales de prueba de MercadoPago

## 🔐 Tarjetas de Prueba de MercadoPago

Para probar pagos, usa estas tarjetas de prueba de MercadoPago:

### **Tarjeta Aprobada**
- **Número:** 5031 7557 3453 0604
- **CVV:** 123
- **Fecha:** 11/25 (o cualquier fecha futura)
- **Nombre:** APRO

### **Tarjeta Rechazada**
- **Número:** 5031 7557 3453 0604
- **CVV:** 123
- **Fecha:** 11/25
- **Nombre:** OXXO

[Ver más tarjetas de prueba](https://www.mercadopago.com.mx/developers/es/docs/checkout-api/testing)

## 🎮 Cómo Funciona Ahora

### Flujo de Compra con Dinero Real:

1. Usuario selecciona un producto en la tienda
2. Confirma la compra
3. La app crea una preferencia de pago en MercadoPago
4. Se abre el navegador con la página de pago de MercadoPago
5. Usuario completa el pago
6. MercadoPago procesa el pago
7. La compra se guarda como "pendiente" en la app
8. (Próximo paso: Implementar webhooks para confirmar automáticamente)

### Flujo de Compra con Monedas del Juego:

1. Usuario selecciona un producto
2. Verifica que tenga suficientes monedas
3. Confirma la compra
4. Se deducen las monedas
5. Se agregan los items al inventario
6. ¡Listo! ✅

## 🔄 Próximos Pasos (Avanzado)

### **1. Implementar Webhooks de MercadoPago**

Para confirmar pagos automáticamente, necesitas:

1. Un servidor backend (Node.js, Python, etc.)
2. Configurar webhooks en MercadoPago
3. Verificar pagos en el servidor
4. Sincronizar con la app

### **2. Verificación de Pagos Manual**

Por ahora, la app guarda compras pendientes. Puedes implementar un botón para verificar manualmente:

```dart
// En shop_screen.dart, agregar método:
Future<void> _verifyPendingPayment() async {
  final prefs = await SharedPreferences.getInstance();
  final preferenceId = prefs.getString('pending_purchase_preference');
  
  if (preferenceId != null) {
    // Llamar a la API de MercadoPago para verificar el estado
    final status = await mpService.getPaymentStatus(preferenceId);
    if (status != null && status['status'] == 'approved') {
      final itemId = prefs.getString('pending_purchase_item');
      final item = ShopData.getItemById(itemId!);
      if (item != null) {
        await _processSuccessfulPurchase(item);
        _showSuccessDialog('¡Pago confirmado!', 'Tu compra ha sido procesada');
        // Limpiar compra pendiente
        await prefs.remove('pending_purchase_item');
        await prefs.remove('pending_purchase_preference');
        await prefs.remove('pending_purchase_timestamp');
      }
    }
  }
}
```

### **3. Agregar Botón de "Verificar Compras Pendientes"**

Puedes agregar un botón en la tienda para que los usuarios verifiquen manualmente sus compras pendientes.

## 📊 Productos Disponibles

### **Paquetes de Monedas (MXN)**
- 💰 100 Monedas: $20 MXN
- 💰 500 Monedas: $80 MXN (20% descuento)
- 💰 1000 Monedas: $140 MXN (30% descuento)
- 💰 2500 Monedas: $300 MXN (40% descuento)

### **Packs Especiales (MXN)**
- 📦 Pack Iniciante: $40 MXN (200 monedas + items)
- 📦 Pack Guerrero: $100 MXN (500 monedas + mejoras)
- 📦 Pack Legendario: $200 MXN (1500 monedas + todas las mejoras)

### **Items con Monedas del Juego**
- 🧪 Pociones (20-70 monedas)
- ⚔️ Espadas mejoradas (150-300 monedas)
- 👟 Botas de velocidad (200 monedas)
- 💎 Amuletos de stamina (180-350 monedas)
- ❤️ Corazones de vida (200-400 monedas)
- 🔑 Llaves (50-120 monedas)
- 🛡️ Escudos mágicos (100 monedas)

## 🐛 Solución de Problemas Comunes

### **Error: "Access Token inválido"**
✅ Verifica que hayas copiado el token completo
✅ Asegúrate de usar el token de prueba (no el público)
✅ Revisa que no haya espacios extra

### **Error: "No se pudo abrir el link de pago"**
✅ Verifica que `url_launcher` esté instalado: `flutter pub get`
✅ En iOS, verifica los permisos en Info.plist

### **Las compras no se guardan**
✅ Verifica que SharedPreferences esté funcionando
✅ Revisa los logs de la consola
✅ Asegúrate de que el inventario se cargue correctamente

### **El pago se completó pero no recibí los items**
🔄 Por ahora, esto es esperado. Necesitas implementar webhooks o verificación manual
🔄 La app guarda la compra como pendiente por 24 horas

## 📚 Recursos Útiles

- [Documentación MercadoPago México](https://www.mercadopago.com.mx/developers/es/docs)
- [API Reference](https://www.mercadopago.com.mx/developers/es/reference)
- [Tarjetas de Prueba](https://www.mercadopago.com.mx/developers/es/docs/checkout-api/testing)
- [Webhooks](https://www.mercadopago.com.mx/developers/es/docs/your-integrations/notifications/webhooks)

## ✨ ¡Listo!

Ahora tu app está lista para recibir pagos con MercadoPago. Solo necesitas:

1. ⭐ Configurar tu Access Token (Paso 1 y 2)
2. 🧪 Probar en un dispositivo real
3. 🎉 ¡Empezar a vender!

Si tienes dudas o problemas, revisa la documentación de MercadoPago o los logs de tu consola.

---

**¡Buena suerte con tu tienda!** 🎮💰


# 💳 Configuración de PayPal para Darkness Dungeon

## ✅ ¿Qué se ha hecho?

Se ha integrado PayPal como sistema de pagos, reemplazando MercadoPago. Esto incluye:

1. ✅ **Paquete instalado**: `flutter_paypal_payment`
2. ✅ **Servicio de PayPal**: `lib/shop/paypal_service.dart`
3. ✅ **Tienda actualizada**: Ahora usa PayPal en lugar de MercadoPago
4. ✅ **Conversión automática**: Los precios en MXN se convierten a USD
5. ✅ **Interfaz integrada**: El checkout de PayPal se abre dentro de la app

---

## 🚀 Pasos para Configurar PayPal

### **Paso 1: Crear cuenta de PayPal Developer** (5 minutos)

1. Ve a: https://developer.paypal.com/
2. Haz clic en **"Log In"** o **"Sign Up"**
3. Usa tu cuenta de PayPal personal (o crea una)
4. Acepta los términos de desarrollador

### **Paso 2: Crear una App en PayPal** (3 minutos)

1. Ve a: https://developer.paypal.com/dashboard/applications
2. Haz clic en **"Create App"**
3. Nombre: `Darkness Dungeon Shop` (o el que prefieras)
4. Selecciona **"Merchant"** como tipo de cuenta
5. Haz clic en **"Create App"**

### **Paso 3: Obtener Credenciales de SANDBOX** (2 minutos)

Una vez creada la app, verás dos tabs:

#### **Credenciales de Sandbox (Pruebas):**
```
Sandbox:
- Client ID: AOvYJ8QXXXXXXXXXXXXXXXXXXx...
- Secret: EPyJ7XXXXXXXXXXXXXXXXXXXXXXXX...
```

Copia ambos valores.

### **Paso 4: Configurar en tu App** ⭐ OBLIGATORIO

Abre el archivo: `lib/shop/paypal_service.dart`

Busca las líneas 9-10 y reemplaza con tus credenciales:

```dart
// Para SANDBOX (Pruebas):
static const String _clientIdSandbox = 'TU_CLIENT_ID_AQUI';
static const String _secretKeySandbox = 'TU_SECRET_KEY_AQUI';
```

Por ejemplo:

```dart
// Para SANDBOX (Pruebas):
static const String _clientIdSandbox = 'AOvYJ8Qpj8pNXXXXXXXXXXXXXXXXXX';
static const String _secretKeySandbox = 'EPyJ7WWlxxxxxxxxxxxxxxxxxxxxxx';
```

**¡Eso es todo para empezar a probar!** 🎉

---

## 🧪 Cómo Probar

### **Paso 1: Ejecutar la app**

```bash
flutter run
```

### **Paso 2: Ir a la tienda**

1. Abre el menú principal
2. Presiona el botón dorado **"Tienda"**
3. Ve a la pestaña **"DINERO REAL"**

### **Paso 3: Intentar comprar**

1. Selecciona un paquete (ej: 100 Monedas - $1.18 USD)
2. Confirma la compra
3. Se abrirá la pantalla de PayPal

### **Paso 4: Login con cuenta de prueba**

PayPal automáticamente crea cuentas de prueba para ti. Para ver las credenciales:

1. Ve a: https://developer.paypal.com/dashboard/accounts
2. Verás cuentas de prueba como:
   - `sb-xxxxx@business.example.com` (Vendedor)
   - `sb-xxxxx@personal.example.com` (Comprador)
3. Haz clic en una cuenta **Personal** (comprador)
4. Verás el email y contraseña

### **Paso 5: Completar el pago**

1. En la app, ingresa las credenciales de la cuenta de prueba Personal
2. Confirma el pago
3. ¡Listo! Las monedas/items se agregarán automáticamente ✅

---

## 💰 Conversión de Precios

Los precios están en MXN pero PayPal usa USD. La conversión está en `paypal_service.dart`:

```dart
// Tasa actual: 1 USD = 17 MXN (aproximado)
static double convertMxnToUsd(double mxn) {
  return mxn / 17.0;
}
```

### **Precios actuales:**

| Paquete | Precio MXN | Precio USD |
|---------|-----------|-----------|
| 100 Monedas | $20 MXN | ~$1.18 USD |
| 500 Monedas | $80 MXN | ~$4.71 USD |
| 1000 Monedas | $140 MXN | ~$8.24 USD |
| 2500 Monedas | $300 MXN | ~$17.65 USD |
| Pack Iniciante | $40 MXN | ~$2.35 USD |
| Pack Guerrero | $100 MXN | ~$5.88 USD |
| Pack Legendario | $200 MXN | ~$11.76 USD |

**Puedes ajustar la tasa de cambio** en `paypal_service.dart` según prefieras.

---

## 🎮 Ventajas de PayPal vs MercadoPago

| Característica | PayPal | MercadoPago |
|----------------|--------|-------------|
| **Facilidad de prueba** | ✅ Muy fácil | ❌ Complicado |
| **Cuentas de prueba** | ✅ Automáticas | ❌ Manual |
| **Verificación email** | ✅ No necesaria | ❌ Obligatoria |
| **Checkout integrado** | ✅ Dentro de la app | ❌ Navegador externo |
| **Confirmación inmediata** | ✅ Instantánea | ❌ Necesita webhooks |
| **Aceptación global** | ✅ Mundial | ⚠️ Latinoamérica |
| **Tarjetas de prueba** | ✅ Cuenta completa | ⚠️ Solo números |

---

## 🔄 Modo Simulación (Opcional)

Si quieres probar SIN configurar PayPal aún, puedes usar el modo simulación:

En `lib/shop/shop_screen.dart`, línea ~883, **descomenta** el bloque:

```dart
// MODO PRUEBA: Simular compra (descomenta esto para pruebas sin PayPal)
final success = await PayPalService.simulatePurchase(
  itemId: item.id,
  amount: item.priceInMoney,
);

if (success) {
  await _processSuccessfulPurchase(item);
  _showSuccessDialog('¡Compra exitosa!', 'Has comprado ${item.name}');
} else {
  _showErrorDialog('Error en la compra', 'Por favor intenta de nuevo');
}
setState(() => _isLoading = false);
```

Y **comenta** el bloque de "MODO REAL" que está debajo.

---

## 🏭 Pasar a Producción

Cuando quieras recibir pagos REALES:

### **Paso 1: Obtener credenciales de producción**

En tu app de PayPal Dashboard, cambia a la pestaña **"Live"**:

```
Live:
- Client ID: AeXXXXXXXXXXXXXXXXXXXXXXXX...
- Secret: ELXXXXXXXXXXXXXXXXXXXXXXXX...
```

### **Paso 2: Configurar en la app**

En `lib/shop/paypal_service.dart`:

1. Pega tus credenciales de producción:
   ```dart
   static const String _clientIdProduction = 'TU_CLIENT_ID_LIVE_AQUI';
   static const String _secretKeyProduction = 'TU_SECRET_KEY_LIVE_AQUI';
   ```

2. Cambia a modo producción:
   ```dart
   static const bool isProduction = true; // Cambia a true
   ```

3. ¡Listo! Ahora cobrarás dinero real 💰

---

## 💳 Cuentas de Prueba de PayPal

PayPal crea automáticamente cuentas de prueba. Para verlas:

1. Ve a: https://developer.paypal.com/dashboard/accounts
2. Verás 2 cuentas:
   - **Business** (para recibir pagos - la tuya)
   - **Personal** (para hacer pagos - tus clientes de prueba)

3. Haz clic en una cuenta **Personal**
4. Verás:
   - Email: `sb-xxxxx@personal.example.com`
   - Password: `(se muestra ahí)`
   - Balance: $9,999.88 USD (para pruebas)

Usa estas credenciales para hacer compras de prueba en tu app.

---

## 🐛 Solución de Problemas

### **Error: "Invalid Client ID or Secret"**
✅ Verifica que hayas copiado correctamente ambas credenciales
✅ Asegúrate de usar las de SANDBOX (no Live)
✅ No debe haber espacios extra

### **Error: "No se pudo abrir PayPal"**
✅ Verifica tu conexión a internet
✅ Asegúrate de que el paquete esté instalado: `flutter pub get`

### **El pago no se procesa**
✅ Verifica que estés usando una cuenta Personal de prueba
✅ Revisa los logs de la consola para ver errores

### **Las monedas no se agregan**
✅ Verifica que el callback `onSuccess` se esté ejecutando
✅ Revisa los logs: debe decir "PayPal: Pago exitoso"

---

## 📊 Estadísticas de Pagos

Para ver los pagos de prueba:

1. Ve a: https://developer.paypal.com/dashboard/
2. Haz clic en **"Sandbox"**
3. Verás todas las transacciones de prueba

Para pagos reales (producción):

1. Ve a: https://www.paypal.com/
2. Inicia sesión con tu cuenta de PayPal real
3. Ve a **"Actividad"** para ver tus ventas

---

## 🔐 Seguridad

### **Buenas prácticas:**

1. ✅ **NUNCA** subas tus credenciales de producción a GitHub
2. ✅ Usa variables de entorno en producción
3. ✅ Mantén las credenciales de Sandbox para desarrollo
4. ✅ Cambia a producción solo cuando estés listo para publicar

### **Estructura recomendada:**

```dart
class PayPalService {
  // Modo desarrollo
  static const String _clientIdSandbox = 'SANDBOX_ID_AQUI';
  static const String _secretKeySandbox = 'SANDBOX_SECRET_AQUI';
  
  // Modo producción (NO subir a GitHub)
  static const String _clientIdProduction = String.fromEnvironment('PAYPAL_CLIENT_ID');
  static const String _secretKeyProduction = String.fromEnvironment('PAYPAL_SECRET');
  
  static const bool isProduction = bool.fromEnvironment('PRODUCTION');
}
```

---

## 📚 Recursos Útiles

- [PayPal Developer Dashboard](https://developer.paypal.com/dashboard/)
- [Documentación de PayPal](https://developer.paypal.com/docs/)
- [Cuentas de Prueba](https://developer.paypal.com/dashboard/accounts)
- [flutter_paypal_payment Docs](https://pub.dev/packages/flutter_paypal_payment)

---

## ✨ ¡Listo!

Tu tienda ahora usa PayPal y está lista para:

1. ✅ Probar compras en modo Sandbox
2. ✅ Recibir pagos REALMENTE cuando cambies a producción
3. ✅ Funcionar sin verificaciones de email complicadas
4. ✅ Procesar pagos de forma instantánea

**Solo necesitas:**
1. ⭐ Configurar tus credenciales de Sandbox (Paso 1-4)
2. 🧪 Probar en tu dispositivo
3. 🎉 ¡Empezar a vender!

---

**¿Tienes dudas?** Revisa la sección de [Solución de Problemas](#-solución-de-problemas) 😊


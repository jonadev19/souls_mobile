# ⚡ Setup Rápido PayPal - 3 Pasos

## 🎯 Paso 1: Crear App en PayPal (5 minutos)

1. Ve a: https://developer.paypal.com/dashboard/applications
2. **Log In** con tu cuenta de PayPal
3. Click **"Create App"**
4. Nombre: `Darkness Dungeon`
5. Tipo: **Merchant**
6. Click **"Create App"**

---

## 🔑 Paso 2: Copiar Credenciales (1 minuto)

En la pestaña **"Sandbox"**, copia:

- **Client ID**: `AOvYJ8QXxxxxxxxxxxxxxxx...`
- **Secret**: `EPyJ7WWlxxxxxxxxxxxxxx...`

---

## 🔧 Paso 3: Pegar en tu App (1 minuto)

Abre: `lib/shop/paypal_service.dart`

Líneas 9-10, reemplaza:

```dart
static const String _clientIdSandbox = 'TU_CLIENT_ID_SANDBOX_AQUI';
static const String _secretKeySandbox = 'TU_SECRET_KEY_SANDBOX_AQUI';
```

Por:

```dart
static const String _clientIdSandbox = 'AOvYJ8Qpj8pNXXXXXXXXXXXXX';
static const String _secretKeySandbox = 'EPyJ7WWlxxxxxxxxxxx';
```

---

## 🚀 ¡Prueba!

```bash
flutter run
```

1. Menú → **"Tienda"**
2. Pestaña **"DINERO REAL"**
3. Compra algo
4. Aparecerá pantalla de PayPal

---

## 💳 Cuentas de Prueba

Para hacer compras de prueba:

1. Ve a: https://developer.paypal.com/dashboard/accounts
2. Click en cuenta **"Personal"** (comprador)
3. Verás email y password
4. Usa esas credenciales en la app

**Balance de prueba:** $9,999.88 USD ✅

---

## 💰 Precios (Auto-convertidos MXN → USD)

| Item | MXN | USD |
|------|-----|-----|
| 100 Monedas | $20 | ~$1.18 |
| 500 Monedas | $80 | ~$4.71 |
| 1000 Monedas | $140 | ~$8.24 |
| Pack Legendario | $200 | ~$11.76 |

---

## ✅ Ventajas vs MercadoPago

✅ **NO necesita verificación por email**
✅ **Checkout dentro de la app**
✅ **Cuentas de prueba automáticas**
✅ **Confirmación inmediata**
✅ **Más fácil de probar**

---

## 🎮 ¿Sin credenciales aún?

Usa **modo simulación** mientras tanto:

En `lib/shop/shop_screen.dart` línea ~883, descomenta:

```dart
final success = await PayPalService.simulatePurchase(
  itemId: item.id,
  amount: item.priceInMoney,
);
```

Y comenta el bloque de "MODO REAL".

---

## 🏭 Para Producción (Después)

1. En PayPal Dashboard, cambia a tab **"Live"**
2. Copia Client ID y Secret de producción
3. En `paypal_service.dart`:
   - Pega credenciales de producción
   - Cambia `isProduction = true`
4. ¡Listo para cobrar dinero real! 💰

---

**¿Dudas?** Lee la guía completa: `PAYPAL_SETUP.md`

**¡Ya está todo configurado!** 🎉


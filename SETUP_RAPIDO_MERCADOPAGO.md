# ⚡ Setup Rápido MercadoPago - 3 Pasos

## 🎯 Paso 1: Obtén tu Token (5 minutos)

1. Abre: https://www.mercadopago.com.mx/developers/panel
2. Inicia sesión o crea cuenta
3. Crea una aplicación
4. Ve a "Credenciales"
5. Copia el **"Access Token de Prueba"**

## 🔧 Paso 2: Pégalo en tu App (1 minuto)

Abre: `lib/shop/mercadopago_service.dart`

Línea 7, reemplaza:
```dart
static const String _accessToken = 'TU_ACCESS_TOKEN_AQUI';
```

Por:
```dart
static const String _accessToken = 'APP_USR-tu-token-aqui-completo';
```

## 🚀 Paso 3: ¡Prueba!

```bash
flutter run
```

1. Ve al menú
2. Presiona "Tienda" (botón dorado)
3. Pestaña "DINERO REAL"
4. Intenta comprar algo
5. Te redirigirá a MercadoPago

---

## 💳 Tarjeta de Prueba

**Para aprobar el pago:**
- Número: `5031 7557 3453 0604`
- CVV: `123`
- Fecha: `11/25`
- Nombre: `APRO`

---

## ⚠️ IMPORTANTE

- ❌ NO uses el "Public Key" (solo el Access Token)
- ❌ NO subas el token a GitHub
- ✅ Para producción, cambia al "Access Token de Producción"

---

## 🎮 Ya funciona con:

✅ Compras con monedas del juego (100% funcional)
✅ Interfaz de tienda completa
✅ Sistema de inventario
✅ Guardado de progreso
✅ Integración con el personaje

## 💰 Todavía por hacer (opcional):

⏳ Confirmación automática de pagos (requiere backend)
⏳ Deep links para recibir respuestas
⏳ Webhooks de MercadoPago

---

**¿Tienes dudas?** Lee: `INSTRUCCIONES_MERCADOPAGO.md` (más detallado)


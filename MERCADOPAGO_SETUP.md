# 🛒 Configuración de Mercado Pago para Darkness Dungeon

## 📋 Resumen del Sistema de Tienda

Se ha implementado un sistema completo de tienda con las siguientes características:

### ✅ Funcionalidades Implementadas

1. **Sistema de Inventario del Jugador** (`lib/util/player_inventory.dart`)
   - Gestión de monedas del juego
   - Items consumibles (pociones, llaves, bombas)
   - Mejoras permanentes (armas, velocidad, stamina, vida)
   - Persistencia con SharedPreferences

2. **Catálogo de Items** (`lib/shop/shop_data.dart`)
   - Paquetes de monedas (compra con dinero real - MXN)
   - Consumibles (pociones, llaves)
   - Mejoras permanentes (armas, velocidad, stamina, vida)
   - Packs especiales

3. **Interfaz de Tienda** (`lib/shop/shop_screen.dart`)
   - Dos pestañas: "Monedas" (dinero real) y "Items" (monedas del juego)
   - Visualización de items con precios
   - Sistema de confirmación de compras
   - Indicadores de items ya comprados

4. **Integración con el Jugador** (`lib/player/knight.dart`)
   - Aplicación automática de mejoras permanentes
   - Sistema para usar pociones y llaves del inventario
   - Stats mejorados basados en compras

5. **UI del Juego**
   - Botón de tienda en el menú principal (dorado/amber)
   - Contador de monedas en la interfaz del juego
   - Contador de monedas en la tienda

---

## 💰 Precios en Pesos Mexicanos (MXN)

### Paquetes de Monedas
- 100 Monedas: $20 MXN
- 500 Monedas: $80 MXN (20% descuento)
- 1000 Monedas: $140 MXN (30% descuento)
- 2500 Monedas: $300 MXN (40% descuento)

### Packs Especiales
- Pack Iniciante: $40 MXN (200 monedas + items)
- Pack Guerrero: $100 MXN (500 monedas + mejoras)
- Pack Legendario: $200 MXN (1500 monedas + todas las mejoras)

---

## 🔧 Configuración de Mercado Pago

### Paso 1: Crear Cuenta de Mercado Pago

1. Ve a [Mercado Pago México](https://www.mercadopago.com.mx/)
2. Crea una cuenta o inicia sesión
3. Ve al [Panel de Desarrolladores](https://www.mercadopago.com.mx/developers/panel)

### Paso 2: Obtener Credenciales

1. En el panel de desarrolladores, ve a "Tus integraciones"
2. Crea una nueva aplicación o selecciona una existente
3. Ve a "Credenciales"
4. Copia tu **Access Token** (usa el de prueba para desarrollo)

### Paso 3: Configurar el Access Token

Edita el archivo `lib/shop/mercadopago_service.dart`:

```dart
// Línea 6-7
static const String _accessToken = 'TU_ACCESS_TOKEN_AQUI';
```

Reemplaza `'TU_ACCESS_TOKEN_AQUI'` con tu Access Token real.

**⚠️ IMPORTANTE:** 
- Para desarrollo, usa el **Access Token de Prueba**
- Para producción, usa el **Access Token de Producción**
- **NUNCA** subas tu Access Token a repositorios públicos

### Paso 4: Configurar URLs de Retorno

Las URLs de retorno ya están configuradas en el código:

```dart
'back_urls': {
  'success': 'darknessdungeon://payment/success',
  'failure': 'darknessdungeon://payment/failure',
  'pending': 'darknessdungeon://payment/pending',
}
```

Necesitarás configurar deep links en tu app para manejar estas URLs.

---

## 🧪 Modo de Prueba

Actualmente, el sistema usa `simulatePurchase()` que simula compras exitosas sin procesar pagos reales. Esto es útil para desarrollo.

Para activar el flujo real de Mercado Pago:

1. Configura tu Access Token (ver Paso 3)
2. En `shop_screen.dart`, reemplaza:

```dart
// Línea ~300 (aproximadamente)
final success = await mpService.simulatePurchase(
  itemId: item.id,
  amount: item.priceInMoney,
);
```

Por:

```dart
final preference = await mpService.createPaymentPreference(
  title: item.name,
  amount: item.priceInMoney,
  itemId: item.id,
  quantity: 1,
);

if (preference != null && preference['init_point'] != null) {
  final uri = Uri.parse(preference['init_point']);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
    // Aquí necesitarás implementar la lógica para verificar el pago
  }
}
```

---

## 📱 Configuración de Deep Links

### Android (`android/app/src/main/AndroidManifest.xml`)

Agrega dentro de `<activity>`:

```xml
<intent-filter>
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="darknessdungeon" />
</intent-filter>
```

### iOS (`ios/Runner/Info.plist`)

Agrega:

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

---

## 🎮 Cómo Usar la Tienda

### Para Jugadores

1. **Acceder a la Tienda:**
   - Desde el menú principal, presiona el botón dorado "Tienda"

2. **Comprar con Dinero Real:**
   - Ve a la pestaña "Monedas"
   - Selecciona un paquete de monedas o pack especial
   - Confirma la compra
   - Serás redirigido a Mercado Pago para completar el pago

3. **Comprar con Monedas del Juego:**
   - Ve a la pestaña "Items"
   - Selecciona el item que deseas
   - Confirma la compra (se deducirán las monedas)

4. **Ver tus Monedas:**
   - En el juego: esquina superior derecha
   - En la tienda: barra superior

### Items Disponibles

**Consumibles:**
- Pociones (pequeña, mediana, grande)
- Llaves de plata
- Escudo mágico (invencibilidad temporal)

**Mejoras Permanentes:**
- Espadas (aumentan ataque)
- Botas de velocidad
- Amuletos de stamina
- Corazones de vida

---

## 🔒 Seguridad

### Recomendaciones:

1. **Nunca expongas tu Access Token:**
   - Usa variables de entorno
   - Considera usar un backend para manejar pagos

2. **Valida los pagos en el servidor:**
   - No confíes solo en el cliente
   - Implementa webhooks de Mercado Pago

3. **Usa HTTPS:**
   - Todas las comunicaciones deben ser seguras

4. **Implementa verificación de recibos:**
   - Verifica que los pagos sean legítimos
   - Guarda registros de transacciones

---

## 🐛 Solución de Problemas

### Error: "Access Token inválido"
- Verifica que hayas copiado correctamente el Access Token
- Asegúrate de usar el token correcto (prueba vs producción)

### Error: "No se puede crear la preferencia de pago"
- Revisa tu conexión a internet
- Verifica que el Access Token tenga los permisos correctos

### Las compras no se guardan
- Verifica que SharedPreferences esté funcionando
- Revisa los logs de la consola

### Las mejoras no se aplican
- Asegúrate de que el Knight cargue el inventario
- Verifica que los IDs de los items coincidan

---

## 📚 Recursos Adicionales

- [Documentación de Mercado Pago](https://www.mercadopago.com.mx/developers/es/docs)
- [API Reference](https://www.mercadopago.com.mx/developers/es/reference)
- [SDKs y Librerías](https://www.mercadopago.com.mx/developers/es/docs/sdks-library/landing)
- [Webhooks](https://www.mercadopago.com.mx/developers/es/docs/your-integrations/notifications/webhooks)

---

## 🎯 Próximos Pasos

1. **Implementar Backend:**
   - Crear servidor para validar pagos
   - Implementar webhooks de Mercado Pago

2. **Sistema de Recompensas:**
   - Monedas por derrotar enemigos
   - Misiones diarias

3. **Más Items:**
   - Skins para el personaje
   - Mascotas
   - Efectos especiales

4. **Analytics:**
   - Rastrear compras
   - Optimizar precios

---

## ✅ Checklist de Implementación

- [x] Sistema de inventario
- [x] Catálogo de items
- [x] Interfaz de tienda
- [x] Integración con el jugador
- [x] UI de monedas
- [x] Botón de tienda en menú
- [ ] Configurar Access Token de Mercado Pago
- [ ] Implementar deep links
- [ ] Configurar webhooks
- [ ] Testing en dispositivos reales
- [ ] Publicar en producción

---

¡Buena suerte con tu tienda! 🚀


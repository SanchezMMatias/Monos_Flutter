# monos
# 📱 Tiendita Monos TCG — Mobile App

> De e-commerce web a su versión móvil en Flutter.

---

## 🧩 Contexto del proyecto

Hace un tiempo desarrollé **Tiendita Monos TCG**, un e-commerce de cartas TCG construido con **Django + HTML/CSS/JS** que hoy corre en producción.

🌐 [Ver sitio web](https://lnkd.in/dCRF79Zj)

Ahora estoy llevando esa misma idea al mundo móvil, construyendo una app nativa con **Flutter** en el frontend y **Django REST Framework** en el backend.

---

## 🚀 Estado actual — Autenticación

Esta primera etapa cubre el flujo completo de **registro e inicio de sesión** de usuarios.

![Demo Login & Register](./demo_auth.gif)

### ✅ Lo que ya está funcionando

- Pantalla de **registro** con validación de campos
- Pantalla de **inicio de sesión**
- Navegación fluida entre ambas pantallas
- Conexión con el backend Django vía API REST

---

## 🏗️ Arquitectura

El proyecto está estructurado desde el inicio pensando en escalabilidad y mantenibilidad:

- **Patrón:** MVVM (Model - View - ViewModel)
- **Arquitectura:** Clean Architecture
- **Gestión de estado:** *(provider / riverpod / bloc — según tu elección)*

---

## 🛠️ Tech Stack

| Capa | Tecnología |
|---|---|
| Mobile | Flutter (Dart) |
| Backend | Django + Django REST Framework |
| Auth | JWT Tokens |

---

## 📌 Roadmap

- [x] Pantallas de Login y Registro
- [ ] Home con catálogo de cartas
- [ ] Detalle de producto
- [ ] Carrito de compras
- [ ] Checkout y pagos
- [ ] Perfil de usuario

---

## 💬 Notas

Más que una app, este proyecto es una forma de **exigirme, mantener constancia y seguir creciendo profesionalmente** a través de proyectos reales. Esto es solo el comienzo. 🚀

![Móvil Monos](https://github.com/user-attachments/assets/b6851c1f-f579-4e6c-bf48-6702e3811fbf)

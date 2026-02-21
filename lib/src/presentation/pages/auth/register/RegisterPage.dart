// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monos/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:monos/src/presentation/widgets/DefaultTextField.dart';

// ─── Paleta TCG ───────────────────────────────────────────────────────────────
class _C {
  static const bg     = Color(0xFF0D0D0D);
  static const card   = Color(0xFF1A1A1A);
  static const field  = Color(0xFF242424);
  static const red    = Color(0xFFCC0000);
  static const yellow = Color(0xFFFFCB05);
  static const white  = Color(0xFFF5F5F5);
  static const gray   = Color(0xFF888888);
  static const border = Color(0xFF333333);
  static const success = Color(0xFF2ECC71);
}

// ─── Datos de Chile ────────────────────────────────────────────────────────────
class _ChileData {
  static const Map<String, List<String>> ciudadesPorRegion = {
    'Región de Arica y Parinacota': ['Arica', 'Putre', 'General Lagos', 'Camarones'],
    'Región de Tarapacá': ['Iquique', 'Alto Hospicio', 'Pozo Almonte', 'Camiña', 'Colchane', 'Huara', 'Pica'],
    'Región de Antofagasta': ['Antofagasta', 'Calama', 'Tocopilla', 'Mejillones', 'Sierra Gorda', 'Taltal', 'Ollagüe', 'San Pedro de Atacama', 'María Elena'],
    'Región de Atacama': ['Copiapó', 'Vallenar', 'Chañaral', 'Caldera', 'Tierra Amarilla', 'Alto del Carmen', 'Freirina', 'Huasco', 'Diego de Almagro'],
    'Región de Coquimbo': ['La Serena', 'Coquimbo', 'Ovalle', 'Illapel', 'Andacollo', 'La Higuera', 'Paiguano', 'Vicuña', 'Combarbalá', 'Monte Patria', 'Punitaqui', 'Río Hurtado', 'Canela', 'Los Vilos', 'Salamanca'],
    'Región de Valparaíso': ['Valparaíso', 'Viña del Mar', 'Concón', 'Quintero', 'Puchuncaví', 'San Antonio', 'Algarrobo', 'Cartagena', 'El Quisco', 'El Tabo', 'Santo Domingo', 'Quillota', 'Calera', 'Hijuelas', 'La Cruz', 'La Ligua', 'Nogales', 'Los Andes', 'Calle Larga', 'Rinconada', 'San Esteban', 'San Felipe', 'Catemu', 'Llaillay', 'Panquehue', 'Putaendo', 'Santa María', 'Isla de Pascua'],
    'Región Metropolitana de Santiago': ['Santiago', 'Cerrillos', 'Cerro Navia', 'Conchalí', 'El Bosque', 'Estación Central', 'Huechuraba', 'Independencia', 'La Cisterna', 'La Florida', 'La Granja', 'La Pintana', 'La Reina', 'Las Condes', 'Lo Barnechea', 'Lo Espejo', 'Lo Prado', 'Macul', 'Maipú', 'Ñuñoa', 'Pedro Aguirre Cerda', 'Peñalolén', 'Providencia', 'Pudahuel', 'Quilicura', 'Quinta Normal', 'Recoleta', 'Renca', 'San Joaquín', 'San Miguel', 'San Ramón', 'Vitacura', 'Puente Alto', 'San Bernardo', 'Buin', 'Calera de Tango', 'Paine', 'Melipilla', 'Alhué', 'Curacaví', 'María Pinto', 'San Pedro', 'Talagante', 'El Monte', 'Isla de Maipo', 'Padre Hurtado', 'Peñaflor'],
    "Región de O'Higgins": ['Rancagua', 'Machalí', 'Graneros', 'Mostazal', 'Codegua', 'Coinco', 'Coltauco', 'Doñihue', 'Las Cabras', 'Malloa', 'Olivar', 'Peumo', 'Pichidegua', 'Quinta de Tilcoco', 'Rengo', 'Requínoa', 'San Vicente', 'San Fernando', 'Chépica', 'Chimbarongo', 'Lolol', 'Nancagua', 'Palmilla', 'Peralillo', 'Placilla', 'Pumanque', 'Santa Cruz', 'Pichilemu', 'La Estrella', 'Litueche', 'Marchigüe', 'Navidad', 'Paredones'],
    'Región del Maule': ['Talca', 'Constitución', 'Curepto', 'Empedrado', 'Maule', 'Pelarco', 'Pencahue', 'Río Claro', 'San Clemente', 'San Rafael', 'Curicó', 'Hualañé', 'Licantén', 'Molina', 'Rauco', 'Romeral', 'Sagrada Familia', 'Teno', 'Vichuquén', 'Linares', 'Colbún', 'Longaví', 'Parral', 'Retiro', 'San Javier', 'Villa Alegre', 'Yerbas Buenas', 'Cauquenes', 'Chanco', 'Pelluhue'],
    'Región de Ñuble': ['Chillán', 'Bulnes', 'Cobquecura', 'Coelemu', 'Coihueco', 'Chillán Viejo', 'El Carmen', 'Ninhue', 'Ñiquén', 'Pemuco', 'Pinto', 'Portezuelo', 'Quillón', 'Quirihue', 'Ránquil', 'San Carlos', 'San Fabián', 'San Ignacio', 'San Nicolás', 'Treguaco', 'Yungay'],
    'Región del Biobío': ['Concepción', 'Talcahuano', 'Hualpén', 'San Pedro de la Paz', 'Chiguayante', 'Coronel', 'Lota', 'Tomé', 'Penco', 'Hualqui', 'Florida', 'Santa Juana', 'Los Ángeles', 'Antuco', 'Cabrero', 'Laja', 'Mulchén', 'Nacimiento', 'Negrete', 'Quilaco', 'Quilleco', 'San Rosendo', 'Santa Bárbara', 'Tucapel', 'Yumbel', 'Arauco', 'Cañete', 'Contulmo', 'Curanilahue', 'Lebu', 'Los Álamos', 'Tirúa'],
    'Región de La Araucanía': ['Temuco', 'Padre Las Casas', 'Carahue', 'Cunco', 'Curarrehue', 'Freire', 'Galvarino', 'Gorbea', 'Lautaro', 'Loncoche', 'Melipeuco', 'Nueva Imperial', 'Perquenco', 'Pitrufquén', 'Pucón', 'Saavedra', 'Teodoro Schmidt', 'Toltén', 'Vilcún', 'Villarrica', 'Cholchol', 'Angol', 'Collipulli', 'Curacautín', 'Ercilla', 'Lonquimay', 'Los Sauces', 'Lumaco', 'Purén', 'Renaico', 'Traiguén', 'Victoria'],
    'Región de Los Ríos': ['Valdivia', 'Corral', 'Lanco', 'Los Lagos', 'Máfil', 'Mariquina', 'Paillaco', 'Panguipulli', 'La Unión', 'Futrono', 'Lago Ranco', 'Río Bueno'],
    'Región de Los Lagos': ['Puerto Montt', 'Calbuco', 'Cochamó', 'Fresia', 'Frutillar', 'Los Muermos', 'Llanquihue', 'Maullín', 'Puerto Varas', 'Osorno', 'Puerto Octay', 'Purranque', 'Puyehue', 'Río Negro', 'San Juan de la Costa', 'San Pablo', 'Castro', 'Ancud', 'Chonchi', 'Curaco de Vélez', 'Dalcahue', 'Puqueldón', 'Queilén', 'Quellón', 'Quemchi', 'Quinchao', 'Chaitén', 'Futaleufú', 'Hualaihué', 'Palena'],
    'Región de Aysén': ['Coyhaique', 'Lago Verde', 'Aysén', 'Cisnes', 'Guaitecas', 'Chile Chico', 'Río Ibáñez', 'Cochrane', "O'Higgins", 'Tortel'],
    'Región de Magallanes': ['Punta Arenas', 'Laguna Blanca', 'Río Verde', 'San Gregorio', 'Puerto Natales', 'Torres del Paine', 'Porvenir', 'Primavera', 'Timaukel', 'Cabo de Hornos', 'Antártica'],
  };

  static List<String> get regions => ciudadesPorRegion.keys.toList()..sort();
}

// ─── Widget principal ─────────────────────────────────────────────────────────
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  // Información personal
  final _nombreCtrl      = TextEditingController();
  final _emailCtrl       = TextEditingController();
  final _telefonoCtrl    = TextEditingController();
  final _rutCtrl         = TextEditingController();

  // Contraseña
  final _passwordCtrl    = TextEditingController();
  final _confirmPassCtrl = TextEditingController();

  // Dirección — separada en campos específicos
  final _calleCtrl       = TextEditingController(); // Nombre de calle
  final _numeroCtrl      = TextEditingController(); // Número
  final _deptoCtrl       = TextEditingController(); // Depto/Casa (opcional)
  final _ciudadCtrl      = TextEditingController(); // Ciudad (texto libre)
  final _comunaCtrl      = TextEditingController(); // Comuna (texto libre)
  final _cpCtrl          = TextEditingController(); // Código postal (opcional)

  String? _selectedRegion;
  bool _loading = false;

  @override
  void dispose() {
    for (final c in [
      _nombreCtrl, _emailCtrl, _telefonoCtrl, _rutCtrl,
      _passwordCtrl, _confirmPassCtrl,
      _calleCtrl, _numeroCtrl, _deptoCtrl,
      _ciudadCtrl, _comunaCtrl, _cpCtrl,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  void _onRegionChanged(String? value) {
    setState(() {
      _selectedRegion = value;
      _ciudadCtrl.clear();
      _comunaCtrl.clear();
    });
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    await Future.delayed(const Duration(milliseconds: 1400));
    setState(() => _loading = false);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: _C.card,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: _C.success, width: 1),
        ),
        content: Row(
          children: const [
            Icon(Icons.check_circle_outline, color: _C.success, size: 18),
            SizedBox(width: 10),
            Text('Cuenta creada con éxito',
                style: TextStyle(color: _C.white, fontSize: 13)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _C.bg,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Botón volver ──
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _C.card,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: _C.border),
                ),
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: _C.white, size: 16),
              ),
            ),
            const SizedBox(height: 16),
            _buildTopBanner(),
            const SizedBox(height: 24),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ════════════════════════════════
                  //  INFORMACIÓN PERSONAL
                  // ════════════════════════════════
                  _sectionLabel('INFORMACIÓN PERSONAL'),
                  const SizedBox(height: 12),

                  DefaultTextField(
                    label: 'Nombre completo',
                    icon: Icons.person_outline,
                    controller: _nombreCtrl,
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Campo requerido'
                        : null,
                  ),
                  DefaultTextField(
                    label: 'Email',
                    icon: Icons.alternate_email,
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Campo requerido';
                      }
                      if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,}$')
                          .hasMatch(v.trim())) {
                        return 'Email inválido';
                      }
                      return null;
                    },
                  ),
                  DefaultTextField(
                    label: 'Teléfono',
                    icon: Icons.phone_outlined,
                    controller: _telefonoCtrl,
                    keyboardType: TextInputType.phone,
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Campo requerido'
                        : null,
                  ),
                  DefaultTextField(
                    label: 'RUT (12345678-9)',
                    icon: Icons.badge_outlined,
                    controller: _rutCtrl,
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Campo requerido'
                        : null,
                  ),

                  const SizedBox(height: 8),

                  // ════════════════════════════════
                  //  CONTRASEÑA
                  // ════════════════════════════════
                  _sectionLabel('CONTRASEÑA'),
                  const SizedBox(height: 12),

                  DefaultTextField(
                    label: 'Contraseña',
                    icon: Icons.lock_outline,
                    obscureText: true,
                    controller: _passwordCtrl,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Campo requerido';
                      }
                      if (v.length < 8) {
                        return 'Mínimo 8 caracteres';
                      }
                      if (!RegExp(r'[A-Z]').hasMatch(v)) {
                        return 'Debe incluir al menos una mayúscula';
                      }
                      if (!RegExp(r'[0-9]').hasMatch(v)) {
                        return 'Debe incluir al menos un número';
                      }
                      return null;
                    },
                  ),
                  DefaultTextField(
                    label: 'Confirmar contraseña',
                    icon: Icons.lock_outline,
                    obscureText: true,
                    controller: _confirmPassCtrl,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Campo requerido';
                      }
                      if (v != _passwordCtrl.text) {
                        return 'Las contraseñas no coinciden';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 8),

                  // ════════════════════════════════
                  //  DIRECCIÓN DE ENVÍO
                  // ════════════════════════════════
                  _sectionLabel('DIRECCIÓN DE ENVÍO'),
                  const SizedBox(height: 12),

                  // Calle + Número en fila
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: DefaultTextField(
                          label: 'Calle / Av.',
                          icon: Icons.signpost_outlined,
                          controller: _calleCtrl,
                          validator: (v) => (v == null || v.trim().isEmpty)
                              ? 'Requerido'
                              : null,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: DefaultTextField(
                          label: 'Número',
                          icon: Icons.tag,
                          controller: _numeroCtrl,
                          keyboardType: TextInputType.streetAddress,
                          validator: (v) => (v == null || v.trim().isEmpty)
                              ? 'Requerido'
                              : null,
                        ),
                      ),
                    ],
                  ),

                  // Depto / Casa / Block (opcional)
                  DefaultTextField(
                    label: 'Depto / Casa / Block (opcional)',
                    icon: Icons.apartment_outlined,
                    controller: _deptoCtrl,
                  ),

                  // Región dropdown
                  _regionDropdown(),

                  // Ciudad texto libre
                  DefaultTextField(
                    label: 'Ciudad',
                    icon: Icons.location_city_outlined,
                    controller: _ciudadCtrl,
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Campo requerido'
                        : null,
                  ),

                  // Comuna texto libre
                  DefaultTextField(
                    label: 'Comuna',
                    icon: Icons.location_on_outlined,
                    controller: _comunaCtrl,
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Campo requerido'
                        : null,
                  ),

                  // Código postal (opcional)
                  DefaultTextField(
                    label: 'Código postal (opcional)',
                    icon: Icons.local_post_office_outlined,
                    controller: _cpCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),

                  const SizedBox(height: 20),
                  _buildSubmitButton(),
                  const SizedBox(height: 16),
                  _buildLoginLink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Región dropdown ───────────────────────────────────────────────────────
  Widget _regionDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        initialValue: _selectedRegion,
        onChanged: _onRegionChanged,
        isExpanded: true,
        dropdownColor: const Color(0xFF1E1E1E),
        menuMaxHeight: 320,
        style: const TextStyle(color: _C.white, fontSize: 13.5),
        icon: const Icon(Icons.keyboard_arrow_down_rounded,
            color: _C.gray, size: 20),
        decoration: _dropdownDecoration('Región *', Icons.map_outlined),
        validator: (v) => v == null ? 'Selecciona una región' : null,
        items: _ChileData.regions
            .map((r) => DropdownMenuItem(
                  value: r,
                  child: Text(r,
                      style: const TextStyle(color: _C.white, fontSize: 13),
                      overflow: TextOverflow.ellipsis),
                ))
            .toList(),
      ),
    );
  }

  // ─── Decoración para dropdown ──────────────────────────────────────────────
  InputDecoration _dropdownDecoration(String hint, IconData icon,
      {bool enabled = true}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: enabled ? _C.gray.withValues(alpha: 0.6) : _C.border,
        fontSize: 13,
      ),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 14, right: 10),
        child: Icon(icon, color: enabled ? _C.gray : _C.border, size: 18),
      ),
      prefixIconConstraints: const BoxConstraints(minWidth: 44, minHeight: 44),
      filled: true,
      fillColor: enabled ? _C.field : const Color(0xFF1C1C1C),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: _C.border, width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: _C.border.withValues(alpha: 0.4), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: _C.yellow, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: _C.red, width: 1.2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: _C.red, width: 1.5),
      ),
      errorStyle: const TextStyle(
          color: Color(0xFFFF6B6B), fontSize: 11, height: 1.2),
    );
  }

  // ─── Banner superior ───────────────────────────────────────────────────────
  Widget _buildTopBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: _C.card,
        border: Border.all(color: _C.border),
        image: const DecorationImage(
          image: NetworkImage(
              'https://www.transparenttextures.com/patterns/hexellence.png'),
          repeat: ImageRepeat.repeat,
          opacity: 0.04,
        ),
      ),
      child: Row(
        children: [
          const _Pokeball(size: 44),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: _C.white,
                        letterSpacing: 0.5),
                    children: [
                      const TextSpan(text: 'Crear '),
                      TextSpan(
                        text: 'cuenta',
                        style: TextStyle(
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: [_C.yellow, Color(0xFFFFE566)],
                            ).createShader(
                                const Rect.fromLTWH(0, 0, 80, 20)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                const Text('Compra cartas TCG al mejor precio',
                    style: TextStyle(color: _C.gray, fontSize: 11.5)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: _C.red.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _C.red.withValues(alpha: 0.4)),
            ),
            child: const Text('TCG',
                style: TextStyle(
                    color: _C.red,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5)),
          ),
        ],
      ),
    );
  }

  // ─── Label de sección ──────────────────────────────────────────────────────
  Widget _sectionLabel(String text) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 14,
          decoration: BoxDecoration(
              color: _C.yellow, borderRadius: BorderRadius.circular(2)),
        ),
        const SizedBox(width: 8),
        Text(text,
            style: const TextStyle(
                color: _C.yellow,
                fontSize: 10.5,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.8)),
        const SizedBox(width: 10),
        Expanded(child: Divider(color: _C.border, thickness: 1)),
      ],
    );
  }

  // ─── Botón submit ──────────────────────────────────────────────────────────
  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _loading ? null : _submit,
          borderRadius: BorderRadius.circular(12),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [_C.red, Color(0xFF990000)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: _C.red.withValues(alpha: 0.35),
                  blurRadius: 14,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: _loading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                          color: _C.white, strokeWidth: 2))
                  : const Text('Crear cuenta',
                      style: TextStyle(
                          color: _C.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5)),
            ),
          ),
        ),
      ),
    );
  }

  // ─── Link login ────────────────────────────────────────────────────────────
  Widget _buildLoginLink() {
    return Center(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 12.5, color: _C.gray),
          children: [
            const TextSpan(text: '¿Ya tienes cuenta? '),
            WidgetSpan(
              child: GestureDetector(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => LoginPage()),
                ),
                child: const Text('Inicia sesión',
                    style: TextStyle(
                        color: _C.yellow,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Pokéball dibujada con CustomPainter ─────────────────────────────────────
class _Pokeball extends StatelessWidget {
  final double size;
  const _Pokeball({required this.size});

  @override
  Widget build(BuildContext context) =>
      CustomPaint(size: Size(size, size), painter: _PokeballPainter());
}

class _PokeballPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size s) {
    final cx = s.width / 2;
    final cy = s.height / 2;
    final r  = s.width / 2 - 1;

    canvas.drawArc(Rect.fromCircle(center: Offset(cx, cy), radius: r),
        3.14159, 3.14159, true, Paint()..color = const Color(0xFFCC0000));
    canvas.drawArc(Rect.fromCircle(center: Offset(cx, cy), radius: r),
        0, 3.14159, true, Paint()..color = const Color(0xFFE0E0E0));
    canvas.drawLine(Offset(cx - r, cy), Offset(cx + r, cy),
        Paint()
          ..color = const Color(0xFF111111)
          ..strokeWidth = s.width * 0.065);
    canvas.drawCircle(Offset(cx, cy), r,
        Paint()
          ..color = const Color(0xFF111111)
          ..style = PaintingStyle.stroke
          ..strokeWidth = s.width * 0.055);
    canvas.drawCircle(Offset(cx, cy), s.width * 0.19,
        Paint()..color = const Color(0xFF111111));
    canvas.drawCircle(Offset(cx, cy), s.width * 0.12,
        Paint()..color = const Color(0xFFF0F0F0));
  }

  @override
  bool shouldRepaint(covariant CustomPainter _) => false;
}
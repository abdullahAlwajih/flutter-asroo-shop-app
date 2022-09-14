part of 'app_themes.dart';

const Color kColor1 = Color(0xff685959);
const Color kColor2 = Color(0xffADA79B);
const Color kColor3 = Color(0xffA5947F);
const Color kColor4 = Color(0xff738B71);
const Color kColor5 = Color(0xff6D454D);
const Color darkSettings = Color(0xff6132e4);
const Color accountSettings = Color(0xff73bc65);
const Color logOutSettings = Color(0xff5f95ef);
const Color notiSettings = Color(0xffdf5862);
const Color languageSettings = Color(0xffCB256C);


abstract class AppColors {

  static const  greyLight=Color(0xffF2F2F2);
  static const  greyColor=Color(0xffE8E8E8);
  static const  greyDark=Color(0xffB1B1B1);
  static const  greyMoreDark=Color(0xff333333);
  static const MaterialColor primarySwatchLight = MaterialColor(
    0xFF00BE84,
    <int, Color>{
      50: Color(0xFFe3f6ed),
      100: Color(0xFFbae8d3),
      200: Color(0xFF8bd8b7),
      300: Color(0xFF53ca9a),
      400: Color(0xFF00be85),
      500: Color(0xFF00b26f),
      600: Color(0xFF00a364),
      700: Color(0xFF009157),
      800: Color(0xFF007f4a),
      900: Color(0xFF006034),
    },
  );

  static const MaterialColor primarySwatchDark = MaterialColor(
    0xFFff4667,
    <int, Color>{
      50: Color(0xFFffebf2),
      100: Color(0xFFffcddb),
      200: Color(0xFFf699a8),
      300: Color(0xFFf06f85),
      400: Color(0xFFff4668),
      500: Color(0xFFff2450),
      600: Color(0xFFf8194f),
      700: Color(0xFFe60447),
      800: Color(0xFFd9003f),
      900: Color(0xFFca0033),
    },
  );

  static final ColorScheme colorSchemeLight =  ColorScheme.light(
    primary: primarySwatchLight,
    primaryContainer: primarySwatchLight.shade300,

  );

  static final ColorScheme colorSchemeDark =  ColorScheme.dark(
    primary: primarySwatchDark,
    primaryContainer: primarySwatchDark.shade300,

  );
}
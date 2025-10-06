/**
 * WIDGET SIN USO
 Como buena práctica, intentar delegar el contenido de cada slide aquí.
 */
class SlideInfo {

  String title;
  String image;

  SlideInfo({
    required this.title,
    required this.image
  });

}

List<SlideInfo> getSlides() {
  return [
    SlideInfo(title: 'Busca jugadores', image: ''),
    SlideInfo(title: 'Desliza para ver más', image: ''),
    SlideInfo(title: 'Selecciona un jugador', image: ''),
  ];
}
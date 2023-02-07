class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? meals;
  int kacl;

  static List<MealsListData> tabIconsList = <MealsListData>[
    /*MealsListData(
      imagePath: 'assets/fitness_app/breakfast.png',
      titleTxt: 'Breakfast',
      kacl: 525,
      meals: <String>['Bread,', 'Peanut butter,', 'Apple'],
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),*/
    /*MealsListData(
      imagePath: 'assets/fitness_app/lunch.png',
      titleTxt: 'Lunch',
      kacl: 602,
      meals: <String>['Salmon,', 'Mixed veggies,', 'Avocado'],
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),*/
    MealsListData(
      imagePath: 'assets/fitness_app/galeria.png',
      titleTxt: 'Foto Galeria',
      kacl: 0,
      meals: <String>['Selecciona una foto'],
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/camera.png',
      titleTxt: 'Foto Camara',
      kacl: 0,
      meals: <String>['Tomar una foto'],
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
  ];
}

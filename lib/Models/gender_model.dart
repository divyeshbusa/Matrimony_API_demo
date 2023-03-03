class GenderModel{
  late int GenderID1;
  late String GenderType1;

  GenderModel({required this.GenderID1 , required this.GenderType1});

  int get GenderID => GenderID1;

  set GenderID(int GenderID) {
    GenderID1 = GenderID;
  }


  String get GenderType => GenderType1;

  set GenderType(String GenderType) {
    GenderType1 = GenderType;
  }
}
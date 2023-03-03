class UserModel {
  int? UserID1;
  late String UserName1;
  late int PhoneNo1;
  late bool IsFavourite1;
  late String DOB1;
  late int Cityid1;
  late String Photo1;
  late int GenderID1;

  UserModel(
      {required this.UserName1,
      required this.PhoneNo1,
      required this.Cityid1,
      required this.Photo1,
      required this.GenderID1,
      required this.IsFavourite1,
      required this.DOB1});

  int? get UserID => UserID1;

  set UserID(int? UserID) {
    UserID1 = UserID;
  }


  bool get IsFavourite => IsFavourite1;

  set IsFavourite(bool IsFavourite) {
    IsFavourite1 = IsFavourite;
  }


  int get PhoneNo => PhoneNo1;

  set PhoneNo(int PhoneNo) {
    PhoneNo1 = PhoneNo;
  }




  int get Genderid => GenderID1;

  set Genderid(int Genderid) {
    GenderID1 = Genderid;
  }

  String get DOB => DOB1;

  set DOB(String DOB) {
    DOB1 = DOB;
  }

  int get Cityid => Cityid1;

  set Cityid(int Cityid) {
    Cityid1 = Cityid;
  }

  String get UserName => UserName1;

  set UserName(String UserName) {
    UserName1 = UserName;
  }

  String get Photo => Photo1;

  set Photo(String Photo) {
    Photo1 = Photo;
  }
}

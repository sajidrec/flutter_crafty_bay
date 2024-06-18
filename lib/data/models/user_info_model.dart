import 'package:crafty_bay/data/models/user_private_info_model.dart';

/// id : 169
/// cus_name : "abc abc"
/// cus_add : "NA"
/// cus_city : "abc"
/// cus_state : "NA"
/// cus_postcode : "NA"
/// cus_country : "NA"
/// cus_phone : "abc"
/// cus_fax : "NA"
/// ship_name : "NA"
/// ship_add : "abc"
/// ship_city : "NA"
/// ship_state : "NA"
/// ship_postcode : "NA"
/// ship_country : "NA"
/// ship_phone : "NA"
/// user_id : 341
/// created_at : "2024-06-12T18:29:25.000000Z"
/// updated_at : "2024-06-12T18:29:25.000000Z"
/// user : {"id":341,"email":"sajidrec@gmail.com","otp":"0","created_at":"2024-06-08T14:01:57.000000Z","updated_at":"2024-06-18T14:33:20.000000Z"}

class UserInfoModel {
  UserInfoModel({
      num? id, 
      String? cusName, 
      String? cusAdd, 
      String? cusCity, 
      String? cusState, 
      String? cusPostcode, 
      String? cusCountry, 
      String? cusPhone, 
      String? cusFax, 
      String? shipName, 
      String? shipAdd, 
      String? shipCity, 
      String? shipState, 
      String? shipPostcode, 
      String? shipCountry, 
      String? shipPhone, 
      num? userId, 
      String? createdAt, 
      String? updatedAt, 
      UserPrivateInfoModel? user,}){
    _id = id;
    _cusName = cusName;
    _cusAdd = cusAdd;
    _cusCity = cusCity;
    _cusState = cusState;
    _cusPostcode = cusPostcode;
    _cusCountry = cusCountry;
    _cusPhone = cusPhone;
    _cusFax = cusFax;
    _shipName = shipName;
    _shipAdd = shipAdd;
    _shipCity = shipCity;
    _shipState = shipState;
    _shipPostcode = shipPostcode;
    _shipCountry = shipCountry;
    _shipPhone = shipPhone;
    _userId = userId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _user = user;
}

  UserInfoModel.fromJson(dynamic json) {
    _id = json['id'];
    _cusName = json['cus_name'];
    _cusAdd = json['cus_add'];
    _cusCity = json['cus_city'];
    _cusState = json['cus_state'];
    _cusPostcode = json['cus_postcode'];
    _cusCountry = json['cus_country'];
    _cusPhone = json['cus_phone'];
    _cusFax = json['cus_fax'];
    _shipName = json['ship_name'];
    _shipAdd = json['ship_add'];
    _shipCity = json['ship_city'];
    _shipState = json['ship_state'];
    _shipPostcode = json['ship_postcode'];
    _shipCountry = json['ship_country'];
    _shipPhone = json['ship_phone'];
    _userId = json['user_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _user = json['user'] != null ? UserPrivateInfoModel.fromJson(json['user']) : null;
  }
  num? _id;
  String? _cusName;
  String? _cusAdd;
  String? _cusCity;
  String? _cusState;
  String? _cusPostcode;
  String? _cusCountry;
  String? _cusPhone;
  String? _cusFax;
  String? _shipName;
  String? _shipAdd;
  String? _shipCity;
  String? _shipState;
  String? _shipPostcode;
  String? _shipCountry;
  String? _shipPhone;
  num? _userId;
  String? _createdAt;
  String? _updatedAt;
  UserPrivateInfoModel? _user;
UserInfoModel copyWith({  num? id,
  String? cusName,
  String? cusAdd,
  String? cusCity,
  String? cusState,
  String? cusPostcode,
  String? cusCountry,
  String? cusPhone,
  String? cusFax,
  String? shipName,
  String? shipAdd,
  String? shipCity,
  String? shipState,
  String? shipPostcode,
  String? shipCountry,
  String? shipPhone,
  num? userId,
  String? createdAt,
  String? updatedAt,
  UserPrivateInfoModel? user,
}) => UserInfoModel(  id: id ?? _id,
  cusName: cusName ?? _cusName,
  cusAdd: cusAdd ?? _cusAdd,
  cusCity: cusCity ?? _cusCity,
  cusState: cusState ?? _cusState,
  cusPostcode: cusPostcode ?? _cusPostcode,
  cusCountry: cusCountry ?? _cusCountry,
  cusPhone: cusPhone ?? _cusPhone,
  cusFax: cusFax ?? _cusFax,
  shipName: shipName ?? _shipName,
  shipAdd: shipAdd ?? _shipAdd,
  shipCity: shipCity ?? _shipCity,
  shipState: shipState ?? _shipState,
  shipPostcode: shipPostcode ?? _shipPostcode,
  shipCountry: shipCountry ?? _shipCountry,
  shipPhone: shipPhone ?? _shipPhone,
  userId: userId ?? _userId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  user: user ?? _user,
);
  num? get id => _id;
  String? get cusName => _cusName;
  String? get cusAdd => _cusAdd;
  String? get cusCity => _cusCity;
  String? get cusState => _cusState;
  String? get cusPostcode => _cusPostcode;
  String? get cusCountry => _cusCountry;
  String? get cusPhone => _cusPhone;
  String? get cusFax => _cusFax;
  String? get shipName => _shipName;
  String? get shipAdd => _shipAdd;
  String? get shipCity => _shipCity;
  String? get shipState => _shipState;
  String? get shipPostcode => _shipPostcode;
  String? get shipCountry => _shipCountry;
  String? get shipPhone => _shipPhone;
  num? get userId => _userId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  UserPrivateInfoModel? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['cus_name'] = _cusName;
    map['cus_add'] = _cusAdd;
    map['cus_city'] = _cusCity;
    map['cus_state'] = _cusState;
    map['cus_postcode'] = _cusPostcode;
    map['cus_country'] = _cusCountry;
    map['cus_phone'] = _cusPhone;
    map['cus_fax'] = _cusFax;
    map['ship_name'] = _shipName;
    map['ship_add'] = _shipAdd;
    map['ship_city'] = _shipCity;
    map['ship_state'] = _shipState;
    map['ship_postcode'] = _shipPostcode;
    map['ship_country'] = _shipCountry;
    map['ship_phone'] = _shipPhone;
    map['user_id'] = _userId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : 341
/// email : "sajidrec@gmail.com"
/// otp : "0"
/// created_at : "2024-06-08T14:01:57.000000Z"
/// updated_at : "2024-06-18T14:33:20.000000Z"


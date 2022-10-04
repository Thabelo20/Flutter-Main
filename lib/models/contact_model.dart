import 'dart:convert';

class Contacts {
  Contacts({
    this.count,
    this.descriptionColumns,
    this.ids,
    this.labelColumns,
    this.listColumns,
    this.listTitle,
    this.orderColumns,
    this.result,
  });
  int? count;
  DescriptionColumns? descriptionColumns;
  List<int>? ids;
  LabelColumns? labelColumns;
  List<String>? listColumns;
  String? listTitle;
  List<String>? orderColumns;
  List<Result>? result;

  factory Contacts.fromJson(Map<String, dynamic> json) => Contacts(
        count: json["count"],
        descriptionColumns:
            DescriptionColumns.fromJson(json["description_columns"]),
        ids: List<int>.from(json["ids"].map((x) => x)),
        labelColumns: LabelColumns.fromJson(json["label_columns"]),
        listColumns: List<String>.from(json["list_columns"].map((x) => x)),
        listTitle: json["list_title"],
        orderColumns: List<String>.from(json["order_columns"].map((x) => x)),
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "description_columns": descriptionColumns!.toJson(),
        "ids": List<dynamic>.from(ids!.map((x) => x)),
        "label_columns": labelColumns!.toJson(),
        "list_columns": List<dynamic>.from(listColumns!.map((x) => x)),
        "list_title": listTitle,
        "order_columns": List<dynamic>.from(orderColumns!.map((x) => x)),
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class DescriptionColumns {
  DescriptionColumns();

  factory DescriptionColumns.fromJson(Map<String, dynamic> json) =>
      DescriptionColumns();

  Map<String, dynamic> toJson() => {};
}

class LabelColumns {
  LabelColumns({
    this.address,
    this.birthday,
    this.contactGroup,
    this.name,
    this.personalCellphone,
    this.personalPhone,
  });
  String? address;
  String? birthday;
  String? contactGroup;
  String? name;
  String? personalCellphone;
  String? personalPhone;

  factory LabelColumns.fromJson(Map<String, dynamic> json) => LabelColumns(
        address: json["address"],
        birthday: json["birthday"],
        contactGroup: json["contact_group"],
        name: json["name"],
        personalCellphone: json["contact_group"],
        personalPhone: json["personal_phone"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "birthday": birthday,
        "contact_group": contactGroup,
        "name": name,
        "personal_cellphone": personalCellphone,
        "personal_phone": personalPhone,
      };
}

class Result {
  Result({
    this.address,
    this.birthday,
    this.contactGroup,
    this.name,
    this.personalCellphone,
    this.personalPhone,
  });

  String? address;
  DateTime? birthday;
  ContactGroup? contactGroup;
  String? name;
  String? personalCellphone;
  String? personalPhone;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        address: json["address"],
        birthday: DateTime.parse(json["birthday"]),
        contactGroup: ContactGroup.fromJson(json["contact_group"]),
        name: json["name"],
        personalCellphone: json["personal_cellphone"],
        personalPhone: json["personal_phone"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "birthday":
            "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
        "contact_group": contactGroup!.toJson(),
        "name": name,
        "personal_cellpone": personalCellphone,
        "personal_phone": personalPhone,
      };
}

class ContactGroup {
  ContactGroup({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory ContactGroup.fromJson(Map<String, dynamic> json) => ContactGroup(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

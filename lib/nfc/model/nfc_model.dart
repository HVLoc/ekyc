

class SendNfcRequestModel {
  SendNfcRequestModel({
    this.sessionId,
    this.type,
    this.number,
    this.name,
    this.firstName,
    this.lastName,
    this.dob,
    this.sex,
    this.nationality,
    this.doe,
    this.mrz,
    this.file,
    this.aaSignature,
    this.aaPublicKey,
    this.keyAlg,
  });

  String? sessionId;
  String? type;
  String? number;
  String? name;
  String? firstName;
  String? lastName;
  String? dob;
  String? sex;
  String? nationality;
  String? doe;
  String? mrz;
  String? file;
  String? aaSignature;
  String? aaPublicKey;
  String? keyAlg;

  ///base64
  String? sodData;
  String? dg1DataB64;
  String? dg2DataB64;
  String? dg13DataB64;
  String? dg14DataB64;
  String? fileId;

  ///data dg13VNM
  String? numberVMN;
  String? nameVNM;
  String? dobVMN;
  String? sexVMN;
  String? nationalityVMN;
  String? nationVNM;
  String? religionVMN;
  String? homeTownVMN;
  String? residentVMN;
  String? identificationSignsVNM;
  String? registrationDateVMN;
  String? doeVMN;
  String? nameDadVMN;
  String? nameMomVMN;
  String? otherPaper;
  String? nameCouple;
  String? raw;
  String? transactionId;/// id very cts
  bool isView = false;
  bool statusSuccess = false;
  bool visibleButtonDetail = true;

  factory SendNfcRequestModel.fromJson(Map<String, dynamic> json) {
    return SendNfcRequestModel(
      sessionId: json["session_id"],
      type: json["type"],
      number: json["number"],
      name: json["name"],
      dob: json["dob"],
      sex: json["sex"],
      nationality: json["nationality"],
      doe: json["doe"],
      mrz: json["MRZ"],
      file: json["file"],
      aaSignature: json["aaSignature"],
      aaPublicKey: json["aaPublicKey"],
      keyAlg: json["keyAlg"],
    );
  }

  Map<String, dynamic> toJsonBase64() => {
        "sodData": sodData,
        "dg1DataB64": dg1DataB64,
        "dg2DataB64": dg2DataB64,
        "dg13DataB64": dg13DataB64,
        "dg14DataB64": dg14DataB64,
      };

  Map<String, dynamic> toJsonCTS(
    String signature,
    String imageSignature,
  ) =>
      {
        "address": residentVMN,
        "email": "",
        "phone": "",
        "citizenIdentify": number,
        "fullName": nameVNM,
        "dateOfBirth": dobVMN,
        "dateOfExpired": doeVMN,
        "dateOfProvide": registrationDateVMN,
        "placeOfResidence": residentVMN,
        "gender": sexVMN,
        "nationality": nationalityVMN,
        "placeOfOrigin": homeTownVMN,
        "faceImage": file,
        "c06Result": null,
        "verifiedTime":
            ((DateTime.now().millisecondsSinceEpoch) ~/ 1000).toString(),
        "rarSignature": signature,
        "signatureImage": imageSignature,
      };

  Map<String, dynamic> toJson() => {
        "sessionId": sessionId,
        "type": type,
        "number": number,
        "name": nameVNM,
        "dob": dobVMN,
        "sex": sex,
        "nationality": nationality,
        "doe": doeVMN,
        "MRZ": mrz,
        "poo": homeTownVMN,
        "por": residentVMN,
        "religion": religionVMN,
        "nation": nationVNM,
        "registerDate": registrationDateVMN,
        "symbol": identificationSignsVNM,
        "father": nameDadVMN,
        "mother": nameMomVMN,
        "aaSignature": aaSignature,
        "aaPublicKey": aaPublicKey,
        "keyAlg": keyAlg != null ? keyAlg!.split('.').last : null,
        "file": file,
        "identity": otherPaper,
        "raw": raw,
        "couple": nameCouple,
      };
}

import 'package:ekyc/assets.dart';
import 'package:ekyc/values/values.src.dart';

class LiveNessCollection {
  static List<String> questions = [
    LocaleKeys.live_ness_actionFaceLeft,
    LocaleKeys.live_ness_actionFaceRight,
    LocaleKeys.live_ness_actionFaceBetween,
    LocaleKeys.live_ness_actionFaceUp,
    LocaleKeys.live_ness_actionFaceSmile,
    LocaleKeys.live_ness_actionFaceBlink,
  ];

  static List<String> types = [
    LocaleKeys.live_ness_faceYaw,
    LocaleKeys.live_ness_faceYaw,
    LocaleKeys.live_ness_facePith,
    LocaleKeys.live_ness_facePith,
    LocaleKeys.live_ness_faceSmile,
    LocaleKeys.live_ness_faceOpen
  ];

  static List<String> listFaceDetach = [
    Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_FACE_LEFT_SVG,
    Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_FACE_RIGHT_SVG,
    Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_FACE_BETWEEN_SVG,
    Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_FACE_UP_SVG,
    Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_FACE_SMILE_SVG,
    Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_FACE_BLINK_SVG,
  ];

  static Map<String, String> listMapOderActionApi = {
    LocaleKeys.live_ness_actionFaceLeft: "TRAI",
    LocaleKeys.live_ness_actionFaceRight: "PHAI",
    LocaleKeys.live_ness_actionFaceUp: "TREN",
    LocaleKeys.live_ness_actionFaceSmile: "CUOI",
    LocaleKeys.live_ness_actionFaceBetween: "GIUA",
    LocaleKeys.live_ness_actionFaceBlink: "NHAY",
  };

  static Map<String, String> listMapOderActionSuccess = {
    LocaleKeys.live_ness_actionFaceLeft: "LEFT",
    LocaleKeys.live_ness_actionFaceRight: "RIGHT",
    LocaleKeys.live_ness_actionFaceUp: "ABOVE",
    LocaleKeys.live_ness_actionFaceSmile: "SMILE",
    LocaleKeys.live_ness_actionFaceBetween: "BETWEEN",
    LocaleKeys.live_ness_actionFaceBlink: "BLINK",
  };

  static Map<String, int> listMapOderAction = {
    "TRAI": 0,
    "PHAI": 1,
    "TREN": 2,
    "GIUA": 3,
    "CUOI": 4,
    "NHAY": 5,
  };
}

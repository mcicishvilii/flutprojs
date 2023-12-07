// import 'package:flutter/foundation.dart';
// import 'package:provider/provider.dart';
//
// import '../data/remote/yes_no_dto.dart';
// import '../data/repository/yes_no_repository.dart';
//
// class MainViewModel extends ChangeNotifier {
//   final YesNoRepository repository;
//   YesNoDto? data;
//   bool isLoading = false;
//
//   MainViewModel({required this.repository});
//
//   Future<void> getYesOrNo() async {
//     isLoading = true;
//     notifyListeners();
//
//     try {
//       data = await repository.getYesOrNo();
//     } catch (e) {
//       // handle error
//     }
//
//     isLoading = false;
//     notifyListeners();
//   }
// }

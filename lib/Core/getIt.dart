import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Model/dashBoardDetailsDataModel.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/AskForQuote.dart';
import 'package:pozitive/Core/Services/changePasswordApi.dart';
import 'package:pozitive/Core/Services/dashBoardApi.dart';
import 'package:pozitive/Core/Services/dashBoradDetaislApi.dart';
import 'package:pozitive/Core/Services/forgotPasswordApi.dart';
import 'package:pozitive/Core/Services/logInApi.dart';
import 'package:pozitive/Core/Services/profileApi.dart';
import 'package:pozitive/Core/Services/quotationNoteApi.dart';
import 'package:pozitive/Core/ViewModel/askForQuoteViewModel.dart';
import 'package:pozitive/Core/ViewModel/changePasswordViewModel.dart';
import 'package:pozitive/Core/ViewModel/forgotPasswordViewModel.dart';
import 'package:pozitive/Core/ViewModel/logInProvider.dart';
import 'package:pozitive/Core/ViewModel/profileProvideModel.dart';
import 'Services/GenerateContractIndivisual.dart';
import 'Services/askForQuoteViewButton.dart';
import 'Services/addProspectApi.dart';

import 'ViewModel/addAndViewNoteViewModel.dart';
import 'ViewModel/dashBoardDetailsViewModel.dart';
import 'ViewModel/dashBoardViewModel.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  // Firebase
  getIt.registerLazySingleton(() => LogInApi());
  getIt.registerLazySingleton(() => ProfileApi());
  getIt.registerLazySingleton(() => LogInModel());
  getIt.registerLazySingleton(() => DashBoardApi());
  getIt.registerLazySingleton(() => ForgotPasswordApi());
  getIt.registerLazySingleton(() => ProfileProviderModel());
  getIt.registerLazySingleton(() => DashBoardViewModel());
  getIt.registerLazySingleton(() => ForgotPasswordViewModel());
  getIt.registerLazySingleton(() => ChangePasswordAPi());
  getIt.registerLazySingleton(() => ChangePasswordViewModel());
  getIt.registerLazySingleton(() => DashBoardDatailsApi());
  getIt.registerLazySingleton(() => DashBoardDetailDataModel());
  getIt.registerLazySingleton(() => DashBoardDetailsViewModel());
  getIt.registerLazySingleton(() => AddandViewNoteViewModel());
  getIt.registerLazySingleton(() => QuotationNoteApi());
  getIt.registerLazySingleton(() => AskForQuoteApi());
  getIt.registerLazySingleton(() => AskForQuoteView());
  getIt.registerLazySingleton(() => GetPartnerAddQuoteViewModel());
  getIt.registerLazySingleton(() => GenerateContractIndivisual());
  getIt.registerLazySingleton(() => AddProspectApi());
  getIt.registerFactory(() => User());
}

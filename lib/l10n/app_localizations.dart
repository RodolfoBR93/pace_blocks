import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
  ];

  /// Home tab label
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Workouts tab label
  ///
  /// In en, this message translates to:
  /// **'Workouts'**
  String get workouts;

  /// Welcome message with user name
  ///
  /// In en, this message translates to:
  /// **'Hello, {userName} 👋'**
  String helloUser(String userName);

  /// Total workouts count
  ///
  /// In en, this message translates to:
  /// **'🏃 Total workouts: {count}'**
  String totalWorkouts(int count);

  /// Calories burned count
  ///
  /// In en, this message translates to:
  /// **'🔥 Calories burned: {calories} kcal'**
  String caloriesBurned(int calories);

  /// Total time in minutes
  ///
  /// In en, this message translates to:
  /// **'⏱️ Total time: {minutes} min'**
  String totalTime(int minutes);

  /// Start workout button
  ///
  /// In en, this message translates to:
  /// **'Start workout'**
  String get startWorkout;

  /// Create workout screen title
  ///
  /// In en, this message translates to:
  /// **'Create Workout'**
  String get createWorkout;

  /// Save button
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Workout name field label
  ///
  /// In en, this message translates to:
  /// **'Workout Name'**
  String get workoutName;

  /// Workout name field hint
  ///
  /// In en, this message translates to:
  /// **'Ex: Morning Running Workout'**
  String get workoutNameHint;

  /// Exercise type field label
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// Exercise type field hint
  ///
  /// In en, this message translates to:
  /// **'Select a type'**
  String get selectType;

  /// Unit field label
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get unit;

  /// Minutes unit
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get minutes;

  /// Meters unit
  ///
  /// In en, this message translates to:
  /// **'Meters'**
  String get meters;

  /// Kilometers unit
  ///
  /// In en, this message translates to:
  /// **'Km'**
  String get kilometers;

  /// Value field with unit
  ///
  /// In en, this message translates to:
  /// **'Value ({unit})'**
  String value(String unit);

  /// Cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Add button
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// Error message for empty workout name
  ///
  /// In en, this message translates to:
  /// **'Enter a name for the workout'**
  String get enterWorkoutName;

  /// Error message for empty workout
  ///
  /// In en, this message translates to:
  /// **'Add at least one exercise to the workout'**
  String get addAtLeastOneExercise;

  /// Success message when workout is saved
  ///
  /// In en, this message translates to:
  /// **'Workout \"{workoutName}\" saved successfully! Session ID: {sessionId}'**
  String workoutSavedSuccessfully(String workoutName, int sessionId);

  /// Error message when saving workout fails
  ///
  /// In en, this message translates to:
  /// **'Error saving workout: {error}'**
  String errorSavingWorkout(String error);

  /// Default user name
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

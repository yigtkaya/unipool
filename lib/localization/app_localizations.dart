import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('tr')
  ];

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logIn.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get logIn;

  /// No description provided for @emailAndPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your email and password to log in'**
  String get emailAndPassword;

  /// No description provided for @forgotPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address to reset your password'**
  String get forgotPasswordSubtitle;

  /// No description provided for @invalidEmailOrPassword.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password'**
  String get invalidEmailOrPassword;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAnAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address to reset your password'**
  String get forgotPasswordDescription;

  /// No description provided for @sendLink.
  ///
  /// In en, this message translates to:
  /// **'Send Link'**
  String get sendLink;

  /// No description provided for @comments.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get comments;

  /// No description provided for @aldreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get aldreadyHaveAnAccount;

  /// No description provided for @inviteThisUserToYourTrip.
  ///
  /// In en, this message translates to:
  /// **'Invite this user to your trip?'**
  String get inviteThisUserToYourTrip;

  /// No description provided for @sendRequestToJoinThisTrip.
  ///
  /// In en, this message translates to:
  /// **'Send request to join this trip as {role}'**
  String sendRequestToJoinThisTrip(String role);

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @noCommentsYet.
  ///
  /// In en, this message translates to:
  /// **'No comments yet'**
  String get noCommentsYet;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @inThisArea.
  ///
  /// In en, this message translates to:
  /// **'{count} Trips shared in this area'**
  String inThisArea(int count);

  /// No description provided for @surname.
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get surname;

  /// No description provided for @thisFieldIsRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get thisFieldIsRequired;

  /// No description provided for @trips.
  ///
  /// In en, this message translates to:
  /// **'Trips'**
  String get trips;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// No description provided for @messages.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages;

  /// No description provided for @myTrips.
  ///
  /// In en, this message translates to:
  /// **'My Trips'**
  String get myTrips;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @imLookingForCar.
  ///
  /// In en, this message translates to:
  /// **'Looking for a car'**
  String get imLookingForCar;

  /// No description provided for @imLookingForPassenger.
  ///
  /// In en, this message translates to:
  /// **'Looking for a passenger'**
  String get imLookingForPassenger;

  /// No description provided for @noTrips.
  ///
  /// In en, this message translates to:
  /// **'No trips available'**
  String get noTrips;

  /// No description provided for @noMessages.
  ///
  /// In en, this message translates to:
  /// **'No messages available'**
  String get noMessages;

  /// No description provided for @noActiveTrips.
  ///
  /// In en, this message translates to:
  /// **'You dont have any active trips'**
  String get noActiveTrips;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @taxi.
  ///
  /// In en, this message translates to:
  /// **'Taxi'**
  String get taxi;

  /// No description provided for @departureTime.
  ///
  /// In en, this message translates to:
  /// **'Departure Time'**
  String get departureTime;

  /// No description provided for @invite.
  ///
  /// In en, this message translates to:
  /// **'Invite'**
  String get invite;

  /// No description provided for @driverInformation.
  ///
  /// In en, this message translates to:
  /// **'Driver Information'**
  String get driverInformation;

  /// No description provided for @passengerInformation.
  ///
  /// In en, this message translates to:
  /// **'Passenger Information'**
  String get passengerInformation;

  /// No description provided for @passengers.
  ///
  /// In en, this message translates to:
  /// **'Passengers'**
  String get passengers;

  /// No description provided for @noPassengers.
  ///
  /// In en, this message translates to:
  /// **'There is no passenger yet'**
  String get noPassengers;

  /// No description provided for @soonestTime.
  ///
  /// In en, this message translates to:
  /// **'At the Soonest Time'**
  String get soonestTime;

  /// No description provided for @tripInformation.
  ///
  /// In en, this message translates to:
  /// **'Trip Informations'**
  String get tripInformation;

  /// No description provided for @searchForLocation.
  ///
  /// In en, this message translates to:
  /// **'Search Location'**
  String get searchForLocation;

  /// No description provided for @inviteSentSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Invite sent successfully'**
  String get inviteSentSuccessfully;

  /// No description provided for @inviteSentError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while sending the invitation'**
  String get inviteSentError;

  /// No description provided for @pleaseChooseTrip.
  ///
  /// In en, this message translates to:
  /// **'Please choose a trip'**
  String get pleaseChooseTrip;

  /// No description provided for @chooseInviterTrip.
  ///
  /// In en, this message translates to:
  /// **'Choose the trip you want to invite the passenger'**
  String get chooseInviterTrip;

  /// No description provided for @chooseInviteeTrip.
  ///
  /// In en, this message translates to:
  /// **'Choose the trip to be invited'**
  String get chooseInviteeTrip;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @emailSendSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Email sent successfully'**
  String get emailSendSuccessfully;

  /// No description provided for @emailSendError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while sending the email'**
  String get emailSendError;

  /// No description provided for @pleaseUploadProfilePhoto.
  ///
  /// In en, this message translates to:
  /// **'Lütfen profil fotoğrafı yükleyin'**
  String get pleaseUploadProfilePhoto;

  /// No description provided for @requestToJoin.
  ///
  /// In en, this message translates to:
  /// **'Request to Join'**
  String get requestToJoin;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @accountSecurity.
  ///
  /// In en, this message translates to:
  /// **'Account Security'**
  String get accountSecurity;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @accountSettings.
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get accountSettings;

  /// No description provided for @deleteAccountPermanent.
  ///
  /// In en, this message translates to:
  /// **'Delete Account Permanently'**
  String get deleteAccountPermanent;

  /// No description provided for @deleteAcountDescription.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account permanently? This action cannot be undone.'**
  String get deleteAcountDescription;

  /// No description provided for @ongoing.
  ///
  /// In en, this message translates to:
  /// **'Ongoing'**
  String get ongoing;

  /// No description provided for @inThisWeek.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get inThisWeek;

  /// No description provided for @inThisMonth.
  ///
  /// In en, this message translates to:
  /// **'This month'**
  String get inThisMonth;

  /// No description provided for @upcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get upcoming;

  /// No description provided for @pleaseEnterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get pleaseEnterValidEmail;

  /// No description provided for @pleaseEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address'**
  String get pleaseEnterEmail;

  /// No description provided for @aPasswordShouldBeAtLeast8Characters.
  ///
  /// In en, this message translates to:
  /// **'Password should be at least 8 characters'**
  String get aPasswordShouldBeAtLeast8Characters;

  /// No description provided for @notAvalidNumberPlate.
  ///
  /// In en, this message translates to:
  /// **'Not a valid number plate'**
  String get notAvalidNumberPlate;

  /// No description provided for @pleaseEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password'**
  String get pleaseEnterPassword;

  /// No description provided for @applicationSettings.
  ///
  /// In en, this message translates to:
  /// **'Application Settings'**
  String get applicationSettings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @notificationPermission.
  ///
  /// In en, this message translates to:
  /// **'Notification Permission'**
  String get notificationPermission;

  /// No description provided for @locationPermission.
  ///
  /// In en, this message translates to:
  /// **'Location Permission'**
  String get locationPermission;

  /// No description provided for @giveUsFeedback.
  ///
  /// In en, this message translates to:
  /// **'Give Us Feedback'**
  String get giveUsFeedback;

  /// No description provided for @car.
  ///
  /// In en, this message translates to:
  /// **'Car'**
  String get car;

  /// No description provided for @chooseImage.
  ///
  /// In en, this message translates to:
  /// **'Choose Image'**
  String get chooseImage;

  /// No description provided for @pleaseChooseImageFromGalleryOrTakeAPhoto.
  ///
  /// In en, this message translates to:
  /// **'Please choose image from gallery or take a photo'**
  String get pleaseChooseImageFromGalleryOrTakeAPhoto;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @birthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get birthday;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @sex.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get sex;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @supportFeedback.
  ///
  /// In en, this message translates to:
  /// **'Support & Feedback'**
  String get supportFeedback;

  /// No description provided for @shareWithFriends.
  ///
  /// In en, this message translates to:
  /// **'Share with Friends'**
  String get shareWithFriends;

  /// No description provided for @helpCenter.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get helpCenter;

  /// No description provided for @totalRides.
  ///
  /// In en, this message translates to:
  /// **'Total Rides'**
  String get totalRides;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @sendFeedback.
  ///
  /// In en, this message translates to:
  /// **'Send Feedback'**
  String get sendFeedback;

  /// No description provided for @verificationPending.
  ///
  /// In en, this message translates to:
  /// **'Verification Pending'**
  String get verificationPending;

  /// No description provided for @maximumFileSize.
  ///
  /// In en, this message translates to:
  /// **'Maximum file size: 3MB'**
  String get maximumFileSize;

  /// No description provided for @pleaseChooseImageSource.
  ///
  /// In en, this message translates to:
  /// **'Please choose image source'**
  String get pleaseChooseImageSource;

  /// No description provided for @chooseGender.
  ///
  /// In en, this message translates to:
  /// **'Choose Gender'**
  String get chooseGender;

  /// No description provided for @numberPlate.
  ///
  /// In en, this message translates to:
  /// **'Number Plate'**
  String get numberPlate;

  /// No description provided for @university.
  ///
  /// In en, this message translates to:
  /// **'University'**
  String get university;

  /// No description provided for @department.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get department;

  /// No description provided for @searchForUniversity.
  ///
  /// In en, this message translates to:
  /// **'Search For University'**
  String get searchForUniversity;

  /// No description provided for @chooseUniversity.
  ///
  /// In en, this message translates to:
  /// **'Choose University'**
  String get chooseUniversity;

  /// No description provided for @chooseDepartment.
  ///
  /// In en, this message translates to:
  /// **'Choose Department'**
  String get chooseDepartment;

  /// No description provided for @searchForDepartment.
  ///
  /// In en, this message translates to:
  /// **'Search For Department'**
  String get searchForDepartment;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Onayla'**
  String get confirm;

  /// No description provided for @noTripsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No Trips Available'**
  String get noTripsAvailable;

  /// No description provided for @noTripsAvailableDescription.
  ///
  /// In en, this message translates to:
  /// **'There are no trips at the moment. Please check back later.'**
  String get noTripsAvailableDescription;

  /// No description provided for @messageSent.
  ///
  /// In en, this message translates to:
  /// **'Message sent'**
  String get messageSent;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @enterYourEmailToReset.
  ///
  /// In en, this message translates to:
  /// **'Enter your email to reset your password'**
  String get enterYourEmailToReset;

  /// No description provided for @rememberedYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Remembered your password? '**
  String get rememberedYourPassword;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @sendFirstMessage.
  ///
  /// In en, this message translates to:
  /// **'Send First Message, Learn about trips!'**
  String get sendFirstMessage;

  /// No description provided for @noTripsYet.
  ///
  /// In en, this message translates to:
  /// **'No trips yet, share a trip to start'**
  String get noTripsYet;

  /// No description provided for @driver.
  ///
  /// In en, this message translates to:
  /// **'Driver'**
  String get driver;

  /// No description provided for @shareApp.
  ///
  /// In en, this message translates to:
  /// **'Check out this app on {url}'**
  String shareApp(String url);

  /// No description provided for @passenger.
  ///
  /// In en, this message translates to:
  /// **'Passenger'**
  String get passenger;

  /// No description provided for @remainingSeats.
  ///
  /// In en, this message translates to:
  /// **'Remaining Seats'**
  String get remainingSeats;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get goBack;

  /// No description provided for @createYourProfile.
  ///
  /// In en, this message translates to:
  /// **'Create Your Profile'**
  String get createYourProfile;

  /// No description provided for @createProfileDesc.
  ///
  /// In en, this message translates to:
  /// **'Please fill in the details below to create your profile, this will help us to serve you better.'**
  String get createProfileDesc;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @route.
  ///
  /// In en, this message translates to:
  /// **'Route'**
  String get route;

  /// No description provided for @tripRoute.
  ///
  /// In en, this message translates to:
  /// **'Trip Route'**
  String get tripRoute;

  /// No description provided for @createProfile.
  ///
  /// In en, this message translates to:
  /// **'Create Profile'**
  String get createProfile;

  /// No description provided for @whereTo.
  ///
  /// In en, this message translates to:
  /// **'Where To'**
  String get whereTo;

  /// No description provided for @pleaseChooseAProfilePhoto.
  ///
  /// In en, this message translates to:
  /// **'Please choose a profile photo'**
  String get pleaseChooseAProfilePhoto;

  /// No description provided for @pleaseEnterYourPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get pleaseEnterYourPhoneNumber;

  /// No description provided for @pleaseEnterYourBirthday.
  ///
  /// In en, this message translates to:
  /// **'Please enter your birthday'**
  String get pleaseEnterYourBirthday;

  /// No description provided for @plaseFillInAllTheFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill in all the fields'**
  String get plaseFillInAllTheFields;

  /// No description provided for @validatorPhoneError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get validatorPhoneError;

  /// No description provided for @uploadStudentCertificate.
  ///
  /// In en, this message translates to:
  /// **'Upload Student Certificate'**
  String get uploadStudentCertificate;

  /// No description provided for @uploadStudentCertificateDesc.
  ///
  /// In en, this message translates to:
  /// **'Please upload your student certificate to verify your student status'**
  String get uploadStudentCertificateDesc;

  /// No description provided for @incaseVerification.
  ///
  /// In en, this message translates to:
  /// **'In case of verification your account will be approved'**
  String get incaseVerification;

  /// No description provided for @tapToUpload.
  ///
  /// In en, this message translates to:
  /// **'Tap to upload'**
  String get tapToUpload;

  /// No description provided for @tapToChange.
  ///
  /// In en, this message translates to:
  /// **'Tap to change'**
  String get tapToChange;

  /// No description provided for @nonApprovedUserDesc.
  ///
  /// In en, this message translates to:
  /// **'You are successfully logged in and created your profile but your account is not approved yet. Please wait for the admin to approve your account.'**
  String get nonApprovedUserDesc;

  /// No description provided for @pleaseUploadStudentCertificate.
  ///
  /// In en, this message translates to:
  /// **'Please upload your student certificate'**
  String get pleaseUploadStudentCertificate;

  /// No description provided for @yourProfileCreatedSuccesfully.
  ///
  /// In en, this message translates to:
  /// **'Your profile created successfully'**
  String get yourProfileCreatedSuccesfully;

  /// No description provided for @startChatting.
  ///
  /// In en, this message translates to:
  /// **'Start a chat by texting people from trips'**
  String get startChatting;

  /// No description provided for @createTrip.
  ///
  /// In en, this message translates to:
  /// **'Share Trip'**
  String get createTrip;

  /// No description provided for @passengerLimit.
  ///
  /// In en, this message translates to:
  /// **'Passenger Limit'**
  String get passengerLimit;

  /// No description provided for @passengerLimitDescription.
  ///
  /// In en, this message translates to:
  /// **'*Please enter the maximum number of people you would like to travel with.'**
  String get passengerLimitDescription;

  /// No description provided for @pleaseEnterPassengerLimit.
  ///
  /// In en, this message translates to:
  /// **'Please enter the passenger limit'**
  String get pleaseEnterPassengerLimit;

  /// No description provided for @pleaseEnterFromTo.
  ///
  /// In en, this message translates to:
  /// **'Please enter the departure and arrival locations'**
  String get pleaseEnterFromTo;

  /// No description provided for @successfullySharedTrip.
  ///
  /// In en, this message translates to:
  /// **'Trip shared successfully'**
  String get successfullySharedTrip;

  /// No description provided for @requests.
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get requests;

  /// No description provided for @noRequests.
  ///
  /// In en, this message translates to:
  /// **'No requests available'**
  String get noRequests;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// No description provided for @invites.
  ///
  /// In en, this message translates to:
  /// **'Invites'**
  String get invites;

  /// No description provided for @requestsAndInvites.
  ///
  /// In en, this message translates to:
  /// **'Requests & Invites'**
  String get requestsAndInvites;

  /// No description provided for @reportABug.
  ///
  /// In en, this message translates to:
  /// **'Report a bug'**
  String get reportABug;

  /// No description provided for @suggestAFeature.
  ///
  /// In en, this message translates to:
  /// **'Suggest a feature'**
  String get suggestAFeature;

  /// No description provided for @noInvites.
  ///
  /// In en, this message translates to:
  /// **'No invites available'**
  String get noInvites;

  /// No description provided for @locationPermissionRationale.
  ///
  /// In en, this message translates to:
  /// **'We need to track your location to show you the route and your current location.'**
  String get locationPermissionRationale;

  /// No description provided for @notificationPermissionRationale.
  ///
  /// In en, this message translates to:
  /// **'We need to send you notifications to inform you about the status of your trips.'**
  String get notificationPermissionRationale;

  /// No description provided for @yourOpinionMattersToUs.
  ///
  /// In en, this message translates to:
  /// **'Your opinion matters to us'**
  String get yourOpinionMattersToUs;

  /// No description provided for @weWouldLoveToHearFromYou.
  ///
  /// In en, this message translates to:
  /// **'We\'d love to hear from you! Please share your thoughts, suggestions, and feedback with us.'**
  String get weWouldLoveToHearFromYou;

  /// No description provided for @finishTrip.
  ///
  /// In en, this message translates to:
  /// **'Finish Trip'**
  String get finishTrip;

  /// No description provided for @startTrip.
  ///
  /// In en, this message translates to:
  /// **'Start Trip'**
  String get startTrip;

  /// No description provided for @cancelTrip.
  ///
  /// In en, this message translates to:
  /// **'Cancel Trip'**
  String get cancelTrip;

  /// No description provided for @tripType.
  ///
  /// In en, this message translates to:
  /// **'Trip Type'**
  String get tripType;

  /// No description provided for @activeTrips.
  ///
  /// In en, this message translates to:
  /// **'Active Trips'**
  String get activeTrips;

  /// No description provided for @pastTrips.
  ///
  /// In en, this message translates to:
  /// **'Past Trips'**
  String get pastTrips;

  /// No description provided for @yourTripIsStarted.
  ///
  /// In en, this message translates to:
  /// **'Your trip is started'**
  String get yourTripIsStarted;

  /// No description provided for @yourTripIsFinished.
  ///
  /// In en, this message translates to:
  /// **'Your trip is finished'**
  String get yourTripIsFinished;

  /// No description provided for @yourTripIsCanceled.
  ///
  /// In en, this message translates to:
  /// **'Your trip is canceled'**
  String get yourTripIsCanceled;

  /// No description provided for @areYouSureToEndTheTrip.
  ///
  /// In en, this message translates to:
  /// **'Are you sure to end the trip?'**
  String get areYouSureToEndTheTrip;

  /// No description provided for @areYouSureToStartTheTrip.
  ///
  /// In en, this message translates to:
  /// **'Are you sure to start the trip?'**
  String get areYouSureToStartTheTrip;

  /// No description provided for @areYouSureToCancelTheTrip.
  ///
  /// In en, this message translates to:
  /// **'Are you sure to cancel the trip?'**
  String get areYouSureToCancelTheTrip;

  /// No description provided for @endTripContent.
  ///
  /// In en, this message translates to:
  /// **'If you end the trip, you will not be able to start it again. Are you sure you want to end the trip?'**
  String get endTripContent;

  /// No description provided for @startTripContent.
  ///
  /// In en, this message translates to:
  /// **'If you start the trip, you will not be able to cancel it. Are you sure you want to start the trip?'**
  String get startTripContent;

  /// No description provided for @cancelTripContent.
  ///
  /// In en, this message translates to:
  /// **'If you cancel the trip, you will not be able to start it again. Are you sure you want to cancel the trip?'**
  String get cancelTripContent;

  /// No description provided for @youAlreadyHaveActiveTrip.
  ///
  /// In en, this message translates to:
  /// **'You have an active trip. You can\'t start a new trip until you finish the active one.'**
  String get youAlreadyHaveActiveTrip;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// No description provided for @january.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get january;

  /// No description provided for @february.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get february;

  /// No description provided for @march.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get march;

  /// No description provided for @april.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get april;

  /// No description provided for @may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// No description provided for @june.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get june;

  /// No description provided for @july.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get july;

  /// No description provided for @august.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get august;

  /// No description provided for @september.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get september;

  /// No description provided for @october.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get october;

  /// No description provided for @november.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get november;

  /// No description provided for @december.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get december;

  /// No description provided for @roomCreated.
  ///
  /// In en, this message translates to:
  /// **'Room created'**
  String get roomCreated;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @writeAreview.
  ///
  /// In en, this message translates to:
  /// **'Write a review'**
  String get writeAreview;

  /// No description provided for @leftAReview.
  ///
  /// In en, this message translates to:
  /// **'Left a review for'**
  String get leftAReview;

  /// No description provided for @howWasTheTrip.
  ///
  /// In en, this message translates to:
  /// **'How was the trip with {name}'**
  String howWasTheTrip(String name);

  /// No description provided for @carShareWith.
  ///
  /// In en, this message translates to:
  /// **'Car Share to {location}'**
  String carShareWith(String location);

  /// No description provided for @reviewSentSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Review sent successfully'**
  String get reviewSentSuccessfully;

  /// No description provided for @tripDone.
  ///
  /// In en, this message translates to:
  /// **'Trip Finished'**
  String get tripDone;

  /// No description provided for @tripCanceled.
  ///
  /// In en, this message translates to:
  /// **'Trip Canceled'**
  String get tripCanceled;

  /// No description provided for @tripStarted.
  ///
  /// In en, this message translates to:
  /// **'Trip Started'**
  String get tripStarted;

  /// No description provided for @succesfullyUpdatedProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get succesfullyUpdatedProfile;

  /// No description provided for @clarificationText.
  ///
  /// In en, this message translates to:
  /// **'You can review the <cc>Disclosure Text</cc> for information on the processing of your personal data.'**
  String get clarificationText;

  /// No description provided for @termsOfUseText.
  ///
  /// In en, this message translates to:
  /// **'You can review the <cc>Terms of Use</cc> for the rules you are obliged to follow when using the application.'**
  String get termsOfUseText;
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
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}

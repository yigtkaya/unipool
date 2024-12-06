import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'Login';

  @override
  String get logIn => 'Log In';

  @override
  String get emailAndPassword => 'Enter your email and password to log in';

  @override
  String get forgotPasswordSubtitle =>
      'Enter your email address to reset your password';

  @override
  String get invalidEmailOrPassword => 'Invalid email or password';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get dontHaveAnAccount => 'Don\'t have an account? ';

  @override
  String get signUp => 'Sign Up';

  @override
  String get forgotPasswordTitle => 'Forgot Password';

  @override
  String get forgotPasswordDescription =>
      'Enter your email address to reset your password';

  @override
  String get sendLink => 'Send Link';

  @override
  String get comments => 'Comments';

  @override
  String get aldreadyHaveAnAccount => 'Already have an account? ';

  @override
  String get inviteThisUserToYourTrip => 'Invite this user to your trip?';

  @override
  String sendRequestToJoinThisTrip(String role) {
    return 'Send request to join this trip as $role';
  }

  @override
  String get seeAll => 'See All';

  @override
  String get noCommentsYet => 'No comments yet';

  @override
  String get name => 'Name';

  @override
  String inThisArea(int count) {
    return '$count Trips shared in this area';
  }

  @override
  String get surname => 'Surname';

  @override
  String get thisFieldIsRequired => 'This field is required';

  @override
  String get trips => 'Trips';

  @override
  String get report => 'Report';

  @override
  String get messages => 'Messages';

  @override
  String get myTrips => 'My Trips';

  @override
  String get settings => 'Settings';

  @override
  String get imLookingForCar => 'Looking for a car';

  @override
  String get imLookingForPassenger => 'Looking for a passenger';

  @override
  String get noTrips => 'No trips available';

  @override
  String get noMessages => 'No messages available';

  @override
  String get noActiveTrips => 'You dont have any active trips';

  @override
  String get from => 'From';

  @override
  String get to => 'To';

  @override
  String get taxi => 'Taxi';

  @override
  String get departureTime => 'Departure Time';

  @override
  String get invite => 'Invite';

  @override
  String get driverInformation => 'Driver Information';

  @override
  String get passengerInformation => 'Passenger Information';

  @override
  String get passengers => 'Passengers';

  @override
  String get noPassengers => 'There is no passenger yet';

  @override
  String get soonestTime => 'At the Soonest Time';

  @override
  String get tripInformation => 'Trip Informations';

  @override
  String get searchForLocation => 'Search Location';

  @override
  String get inviteSentSuccessfully => 'Invite sent successfully';

  @override
  String get inviteSentError =>
      'An error occurred while sending the invitation';

  @override
  String get pleaseChooseTrip => 'Please choose a trip';

  @override
  String get chooseInviterTrip =>
      'Choose the trip you want to invite the passenger';

  @override
  String get chooseInviteeTrip => 'Choose the trip to be invited';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get or => 'Or';

  @override
  String get emailSendSuccessfully => 'Email sent successfully';

  @override
  String get emailSendError => 'An error occurred while sending the email';

  @override
  String get pleaseUploadProfilePhoto => 'Lütfen profil fotoğrafı yükleyin';

  @override
  String get requestToJoin => 'Request to Join';

  @override
  String get profile => 'Profile';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get edit => 'Edit';

  @override
  String get changePassword => 'Change Password';

  @override
  String get change => 'Change';

  @override
  String get accountSecurity => 'Account Security';

  @override
  String get logout => 'Logout';

  @override
  String get save => 'Save';

  @override
  String get accountSettings => 'Account Settings';

  @override
  String get deleteAccountPermanent => 'Delete Account Permanently';

  @override
  String get deleteAcountDescription =>
      'Are you sure you want to delete your account permanently? This action cannot be undone.';

  @override
  String get ongoing => 'Ongoing';

  @override
  String get inThisWeek => 'This week';

  @override
  String get inThisMonth => 'This month';

  @override
  String get upcoming => 'Upcoming';

  @override
  String get pleaseEnterValidEmail => 'Please enter a valid email address';

  @override
  String get pleaseEnterEmail => 'Please enter your email address';

  @override
  String get aPasswordShouldBeAtLeast8Characters =>
      'Password should be at least 8 characters';

  @override
  String get notAvalidNumberPlate => 'Not a valid number plate';

  @override
  String get pleaseEnterPassword => 'Please enter a password';

  @override
  String get applicationSettings => 'Application Settings';

  @override
  String get language => 'Language';

  @override
  String get notificationPermission => 'Notification Permission';

  @override
  String get locationPermission => 'Location Permission';

  @override
  String get giveUsFeedback => 'Give Us Feedback';

  @override
  String get car => 'Car';

  @override
  String get chooseImage => 'Choose Image';

  @override
  String get pleaseChooseImageFromGalleryOrTakeAPhoto =>
      'Please choose image from gallery or take a photo';

  @override
  String get gallery => 'Gallery';

  @override
  String get camera => 'Camera';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get birthday => 'Birthday';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get other => 'Other';

  @override
  String get sex => 'Gender';

  @override
  String get optional => 'Optional';

  @override
  String get supportFeedback => 'Support & Feedback';

  @override
  String get shareWithFriends => 'Share with Friends';

  @override
  String get helpCenter => 'Help Center';

  @override
  String get totalRides => 'Total Rides';

  @override
  String get completed => 'Completed';

  @override
  String get cancelled => 'Cancelled';

  @override
  String get sendFeedback => 'Send Feedback';

  @override
  String get verificationPending => 'Verification Pending';

  @override
  String get maximumFileSize => 'Maximum file size: 3MB';

  @override
  String get pleaseChooseImageSource => 'Please choose image source';

  @override
  String get chooseGender => 'Choose Gender';

  @override
  String get numberPlate => 'Number Plate';

  @override
  String get university => 'University';

  @override
  String get department => 'Department';

  @override
  String get searchForUniversity => 'Search For University';

  @override
  String get chooseUniversity => 'Choose University';

  @override
  String get chooseDepartment => 'Choose Department';

  @override
  String get searchForDepartment => 'Search For Department';

  @override
  String get confirm => 'Onayla';

  @override
  String get noTripsAvailable => 'No Trips Available';

  @override
  String get noTripsAvailableDescription =>
      'There are no trips at the moment. Please check back later.';

  @override
  String get messageSent => 'Message sent';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get enterYourEmailToReset => 'Enter your email to reset your password';

  @override
  String get rememberedYourPassword => 'Remembered your password? ';

  @override
  String get delete => 'Delete';

  @override
  String get no => 'No';

  @override
  String get sendFirstMessage => 'Send First Message, Learn about trips!';

  @override
  String get noTripsYet => 'No trips yet, share a trip to start';

  @override
  String get driver => 'Driver';

  @override
  String shareApp(String url) {
    return 'Check out this app on $url';
  }

  @override
  String get passenger => 'Passenger';

  @override
  String get remainingSeats => 'Remaining Seats';

  @override
  String get close => 'Close';

  @override
  String get goBack => 'Go Back';

  @override
  String get createYourProfile => 'Create Your Profile';

  @override
  String get createProfileDesc =>
      'Please fill in the details below to create your profile, this will help us to serve you better.';

  @override
  String get next => 'Next';

  @override
  String get route => 'Route';

  @override
  String get tripRoute => 'Trip Route';

  @override
  String get createProfile => 'Create Profile';

  @override
  String get whereTo => 'Where To';

  @override
  String get pleaseChooseAProfilePhoto => 'Please choose a profile photo';

  @override
  String get pleaseEnterYourPhoneNumber => 'Please enter your phone number';

  @override
  String get pleaseEnterYourBirthday => 'Please enter your birthday';

  @override
  String get plaseFillInAllTheFields => 'Please fill in all the fields';

  @override
  String get validatorPhoneError => 'Please enter a valid phone number';

  @override
  String get uploadStudentCertificate => 'Upload Student Certificate';

  @override
  String get uploadStudentCertificateDesc =>
      'Please upload your student certificate to verify your student status';

  @override
  String get incaseVerification =>
      'In case of verification your account will be approved';

  @override
  String get tapToUpload => 'Tap to upload';

  @override
  String get tapToChange => 'Tap to change';

  @override
  String get nonApprovedUserDesc =>
      'You are successfully logged in and created your profile but your account is not approved yet. Please wait for the admin to approve your account.';

  @override
  String get pleaseUploadStudentCertificate =>
      'Please upload your student certificate';

  @override
  String get yourProfileCreatedSuccesfully =>
      'Your profile created successfully';

  @override
  String get startChatting => 'Start a chat by texting people from trips';

  @override
  String get createTrip => 'Share Trip';

  @override
  String get passengerLimit => 'Passenger Limit';

  @override
  String get passengerLimitDescription =>
      '*Please enter the maximum number of people you would like to travel with.';

  @override
  String get pleaseEnterPassengerLimit => 'Please enter the passenger limit';

  @override
  String get pleaseEnterFromTo =>
      'Please enter the departure and arrival locations';

  @override
  String get successfullySharedTrip => 'Trip shared successfully';

  @override
  String get requests => 'Requests';

  @override
  String get noRequests => 'No requests available';

  @override
  String get accept => 'Accept';

  @override
  String get reject => 'Reject';

  @override
  String get invites => 'Invites';

  @override
  String get requestsAndInvites => 'Requests & Invites';

  @override
  String get reportABug => 'Report a bug';

  @override
  String get suggestAFeature => 'Suggest a feature';

  @override
  String get noInvites => 'No invites available';

  @override
  String get locationPermissionRationale =>
      'We need to track your location to show you the route and your current location.';

  @override
  String get notificationPermissionRationale =>
      'We need to send you notifications to inform you about the status of your trips.';

  @override
  String get yourOpinionMattersToUs => 'Your opinion matters to us';

  @override
  String get weWouldLoveToHearFromYou =>
      'We\'d love to hear from you! Please share your thoughts, suggestions, and feedback with us.';

  @override
  String get finishTrip => 'Finish Trip';

  @override
  String get startTrip => 'Start Trip';

  @override
  String get cancelTrip => 'Cancel Trip';

  @override
  String get tripType => 'Trip Type';

  @override
  String get activeTrips => 'Active Trips';

  @override
  String get pastTrips => 'Past Trips';

  @override
  String get yourTripIsStarted => 'Your trip is started';

  @override
  String get yourTripIsFinished => 'Your trip is finished';

  @override
  String get yourTripIsCanceled => 'Your trip is canceled';

  @override
  String get areYouSureToEndTheTrip => 'Are you sure to end the trip?';

  @override
  String get areYouSureToStartTheTrip => 'Are you sure to start the trip?';

  @override
  String get areYouSureToCancelTheTrip => 'Are you sure to cancel the trip?';

  @override
  String get endTripContent =>
      'If you end the trip, you will not be able to start it again. Are you sure you want to end the trip?';

  @override
  String get startTripContent =>
      'If you start the trip, you will not be able to cancel it. Are you sure you want to start the trip?';

  @override
  String get cancelTripContent =>
      'If you cancel the trip, you will not be able to start it again. Are you sure you want to cancel the trip?';

  @override
  String get youAlreadyHaveActiveTrip =>
      'You have an active trip. You can\'t start a new trip until you finish the active one.';

  @override
  String get monday => 'Monday';

  @override
  String get tuesday => 'Tuesday';

  @override
  String get wednesday => 'Wednesday';

  @override
  String get thursday => 'Thursday';

  @override
  String get friday => 'Friday';

  @override
  String get saturday => 'Saturday';

  @override
  String get sunday => 'Sunday';

  @override
  String get january => 'January';

  @override
  String get february => 'February';

  @override
  String get march => 'March';

  @override
  String get april => 'April';

  @override
  String get may => 'May';

  @override
  String get june => 'June';

  @override
  String get july => 'July';

  @override
  String get august => 'August';

  @override
  String get september => 'September';

  @override
  String get october => 'October';

  @override
  String get november => 'November';

  @override
  String get december => 'December';

  @override
  String get roomCreated => 'Room created';

  @override
  String get message => 'Message';

  @override
  String get send => 'Send';

  @override
  String get writeAreview => 'Write a review';

  @override
  String get leftAReview => 'Left a review for';

  @override
  String howWasTheTrip(String name) {
    return 'How was the trip with $name';
  }

  @override
  String carShareWith(String location) {
    return 'Car Share to $location';
  }

  @override
  String get reviewSentSuccessfully => 'Review sent successfully';

  @override
  String get tripDone => 'Trip Finished';

  @override
  String get tripCanceled => 'Trip Canceled';

  @override
  String get tripStarted => 'Trip Started';

  @override
  String get succesfullyUpdatedProfile => 'Profile updated successfully';

  @override
  String get clarificationText =>
      'You can review the <cc>Disclosure Text</cc> for information on the processing of your personal data.';

  @override
  String get termsOfUseText =>
      'You can review the <cc>Terms of Use</cc> for the rules you are obliged to follow when using the application.';
}

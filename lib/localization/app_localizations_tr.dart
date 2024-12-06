import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get login => 'Giriş Yap';

  @override
  String get logIn => 'Giriş Yap';

  @override
  String get emailAndPassword =>
      'E-posta ve şifrenizi girerek giriş yapabilirsiniz';

  @override
  String get forgotPasswordSubtitle =>
      'Şifrenizi sıfırlamak için e-posta adresinizi girin';

  @override
  String get invalidEmailOrPassword => 'Geçersiz e-posta veya şifre';

  @override
  String get email => 'E-posta';

  @override
  String get password => 'Şifre';

  @override
  String get forgotPassword => 'Şifremi Unuttum?';

  @override
  String get dontHaveAnAccount => 'Hesabınız yok mu? ';

  @override
  String get signUp => 'Kayıt Ol';

  @override
  String get forgotPasswordTitle => 'Şifremi Unuttum';

  @override
  String get forgotPasswordDescription =>
      'Şifrenizi sıfırlamak için e-posta adresinizi girin';

  @override
  String get sendLink => 'Send Link';

  @override
  String get comments => 'Yorumlar';

  @override
  String get aldreadyHaveAnAccount => 'Zaten hesabınız var mı? ';

  @override
  String get inviteThisUserToYourTrip =>
      'kendi yolculuğunuza davet etmek ister misiniz?';

  @override
  String sendRequestToJoinThisTrip(String role) {
    return 'Bu yolculuğa $role olarak katılmak istediğinizi bildirin';
  }

  @override
  String get seeAll => 'Tümünü Gör';

  @override
  String get noCommentsYet => 'Henüz yorum yok';

  @override
  String get name => 'Ad';

  @override
  String inThisArea(int count) {
    return 'Bu alanda $count ilan bulunmakta';
  }

  @override
  String get surname => 'Soyad';

  @override
  String get thisFieldIsRequired => 'Bu alan zorunludur';

  @override
  String get trips => 'İlanlar';

  @override
  String get report => 'Bildir';

  @override
  String get messages => 'Sohbetler';

  @override
  String get myTrips => 'Yolculuklar';

  @override
  String get settings => 'Ayarlar';

  @override
  String get imLookingForCar => 'Araç arıyorum';

  @override
  String get imLookingForPassenger => 'Yolcu arıyorum';

  @override
  String get noTrips => 'Henüz ilan yok';

  @override
  String get noMessages => 'Henüz mesaj yok';

  @override
  String get noActiveTrips => 'Henüz aktif bir yolculuğunuz yok';

  @override
  String get from => 'Nereden';

  @override
  String get to => 'Nereye';

  @override
  String get taxi => 'Taksi';

  @override
  String get departureTime => 'Kalkış Saati';

  @override
  String get invite => 'Davet Et';

  @override
  String get driverInformation => 'Sürücü Bilgileri';

  @override
  String get passengerInformation => 'Yolcu Bilgileri';

  @override
  String get passengers => 'Yolcular';

  @override
  String get noPassengers => 'Henüz yolcu yok';

  @override
  String get soonestTime => 'En Yakın Zamanda';

  @override
  String get tripInformation => 'Yolculuk Bilgileri';

  @override
  String get searchForLocation => 'Konum Ara';

  @override
  String get inviteSentSuccessfully => 'Davet başarıyla gönderildi';

  @override
  String get inviteSentError => 'Davet gönderilirken bir hata oluştu';

  @override
  String get pleaseChooseTrip => 'Lütfen bir yolculuk seçin';

  @override
  String get chooseInviterTrip =>
      'Yolcuyu davet etmek istediğiniz yolculuğunuzu seçin';

  @override
  String get chooseInviteeTrip => 'Davet edilecek yolculuğu seçin';

  @override
  String get somethingWentWrong => 'Bir şeyler yanlış gitti';

  @override
  String get or => 'Veya';

  @override
  String get emailSendSuccessfully => 'E-posta başarıyla gönderildi';

  @override
  String get emailSendError => 'E-posta gönderilirken bir hata oluştu';

  @override
  String get pleaseUploadProfilePhoto => 'Lütfen profil fotoğrafı yükleyin';

  @override
  String get requestToJoin => 'Katılma İsteği Gönder';

  @override
  String get profile => 'Profil';

  @override
  String get editProfile => 'Profili Düzenle';

  @override
  String get edit => 'Düzenle';

  @override
  String get changePassword => 'Şifre Değiştir';

  @override
  String get change => 'Değiştir';

  @override
  String get accountSecurity => 'Hesap Güvenliği';

  @override
  String get logout => 'Çıkış Yap';

  @override
  String get save => 'Kaydet';

  @override
  String get accountSettings => 'Hesap Ayarları';

  @override
  String get deleteAccountPermanent => 'Hesabı Kalıcı Olarak Sil';

  @override
  String get deleteAcountDescription =>
      'Hesabınızı kalıcı olarak silmek istediğinize emin misiniz? Bu işlem geri alınamaz.';

  @override
  String get ongoing => 'Şu an';

  @override
  String get inThisWeek => 'Bu hafta';

  @override
  String get inThisMonth => 'Bu ay';

  @override
  String get upcoming => 'Yakında';

  @override
  String get pleaseEnterValidEmail => 'Lütfen geçerli bir e-posta adresi girin';

  @override
  String get pleaseEnterEmail => 'Lütfen e-posta adresinizi girin';

  @override
  String get aPasswordShouldBeAtLeast8Characters =>
      'Şifre en az 8 karakter olmalıdır';

  @override
  String get notAvalidNumberPlate => 'Geçerli bir plaka numarası giriniz';

  @override
  String get pleaseEnterPassword => 'Lütfen bir şifre girin';

  @override
  String get applicationSettings => 'Uygulama Ayarları';

  @override
  String get language => 'Dil';

  @override
  String get notificationPermission => 'Bildirim İzni';

  @override
  String get locationPermission => 'Konum İzni';

  @override
  String get giveUsFeedback => 'Bize Geri Bildirimde Bulunun';

  @override
  String get car => 'Araç';

  @override
  String get chooseImage => 'Fotoğraf Kaynağı Seç';

  @override
  String get pleaseChooseImageFromGalleryOrTakeAPhoto =>
      'Lütfen galeriden fotoğraf seçin veya fotoğraf çekin';

  @override
  String get gallery => 'Galeri';

  @override
  String get camera => 'Kamera';

  @override
  String get phoneNumber => 'Telefon Numarası';

  @override
  String get birthday => 'Doğum Günü';

  @override
  String get male => 'Erkek';

  @override
  String get female => 'Kadın';

  @override
  String get other => 'Diğer';

  @override
  String get sex => 'Cinsiyet';

  @override
  String get optional => 'İsteğe Bağlı';

  @override
  String get supportFeedback => 'Destek & Geri Bildirim';

  @override
  String get shareWithFriends => 'Arkadaşlarla Paylaş';

  @override
  String get helpCenter => 'Yardım Merkezi';

  @override
  String get totalRides => 'Toplam Yolculuklar';

  @override
  String get completed => 'Tamamlanan';

  @override
  String get cancelled => 'İptal Edilen';

  @override
  String get sendFeedback => 'Geri Bildirim Gönder';

  @override
  String get verificationPending => 'Doğrulama Bekliyor';

  @override
  String get maximumFileSize => 'Maksimum dosya boyutu: 3MB';

  @override
  String get pleaseChooseImageSource => 'Lütfen fotoğraf kaynağı seçin';

  @override
  String get chooseGender => 'Cinsiyet Seçiniz';

  @override
  String get numberPlate => 'Plaka Numarası';

  @override
  String get university => 'Üniversite';

  @override
  String get department => 'Bölüm';

  @override
  String get searchForUniversity => 'Üniversite Ara';

  @override
  String get chooseUniversity => 'Üniversite Seç';

  @override
  String get chooseDepartment => 'Bölüm Seç';

  @override
  String get searchForDepartment => 'Bölüm Ara';

  @override
  String get confirm => 'Onayla';

  @override
  String get noTripsAvailable => 'Uygun yolculuk bulunamadı';

  @override
  String get noTripsAvailableDescription =>
      'Şu anda yolculuk yok. Lütfen daha sonra tekrar deneyin.';

  @override
  String get messageSent => 'Mesaj gönderildi';

  @override
  String get resetPassword => 'Şifre Sıfırlama';

  @override
  String get enterYourEmailToReset =>
      'Şifrenizi sıfırlamak için e-posta adresinizi girin';

  @override
  String get rememberedYourPassword => 'Şifrenizi hatırladınız mı? ';

  @override
  String get delete => 'Sil';

  @override
  String get no => 'Hayır';

  @override
  String get sendFirstMessage =>
      'İlk Mesajı Gönder, Yolculuklar hakkında bilgi edin!';

  @override
  String get noTripsYet =>
      'Henüz yolculuk yok, bir yolculuk paylaşarak başlayın';

  @override
  String get driver => 'Sürücü';

  @override
  String shareApp(String url) {
    return '$url uygulamasına göz atın';
  }

  @override
  String get passenger => 'Yolcu';

  @override
  String get remainingSeats => 'Kalan Koltuk';

  @override
  String get close => 'Kapat';

  @override
  String get goBack => 'Geri Dön';

  @override
  String get createYourProfile => 'Profilinizi Oluşturun';

  @override
  String get createProfileDesc =>
      'Lütfen profilinizi oluşturmak için aşağıdaki bilgileri doldurun, bu size daha iyi hizmet verebilmemize yardımcı olacaktır.';

  @override
  String get next => 'Devam';

  @override
  String get route => 'Rota';

  @override
  String get tripRoute => 'Yolculuk Rotası';

  @override
  String get createProfile => 'Profil Oluştur';

  @override
  String get whereTo => 'Nereye';

  @override
  String get pleaseChooseAProfilePhoto => 'Lütfen bir profil fotoğrafı seçin';

  @override
  String get pleaseEnterYourPhoneNumber => 'Lütfen telefon numaranızı girin';

  @override
  String get pleaseEnterYourBirthday => 'Lütfen doğum gününüzü girin';

  @override
  String get plaseFillInAllTheFields => 'Lütfen tüm alanları doldurun';

  @override
  String get validatorPhoneError => 'Geçerli bir telefon numarası girin';

  @override
  String get uploadStudentCertificate => 'Öğrenci Belgesi Yükle';

  @override
  String get uploadStudentCertificateDesc =>
      'Öğrenci statünüzü doğrulamak için lütfen öğrenci belgenizi yükleyin';

  @override
  String get incaseVerification =>
      'Doğrulama işlemi birkaç gün sürebilir. Doğrulama işlemi tamamlandığında size bildirim gönderilecektir.';

  @override
  String get tapToUpload => 'Yüklemek için dokunun';

  @override
  String get tapToChange => 'Değiştirmek için dokunun';

  @override
  String get nonApprovedUserDesc =>
      'Başarıyla giriş yaptınız ve profilinizi oluşturdunuz ancak hesabınız henüz onaylanmadı. Lütfen yöneticinin hesabınızı onaylamasını bekleyin.';

  @override
  String get pleaseUploadStudentCertificate =>
      'Lütfen öğrenci belgesi yükleyin';

  @override
  String get yourProfileCreatedSuccesfully =>
      'Profiliniz başarıyla oluşturuldu';

  @override
  String get startChatting =>
      'Konuşma başlatmak için ilanlar sayfasından bir yolculuk seçin';

  @override
  String get createTrip => 'Yolculuk Paylaş';

  @override
  String get passengerLimit => 'Yolcu Limiti';

  @override
  String get passengerLimitDescription =>
      '*Lütfen en fazla kaç kişiyle yolculuk yapmak istediğinizi girin.';

  @override
  String get pleaseEnterPassengerLimit => 'Lütfen yolcu limitini girin';

  @override
  String get pleaseEnterFromTo => 'Lütfen kalkış ve varış noktalarını girin';

  @override
  String get successfullySharedTrip => 'Yolculuk başarıyla paylaşıldı';

  @override
  String get requests => 'Gelen İstekler';

  @override
  String get noRequests => 'Henüz istek yok';

  @override
  String get accept => 'Kabul Et';

  @override
  String get reject => 'Reddet';

  @override
  String get invites => 'Gelen Davetler';

  @override
  String get requestsAndInvites => 'Gelen İstekler & Gönderilen Davetler';

  @override
  String get reportABug => 'Hata Bildir';

  @override
  String get suggestAFeature => 'Yeni Bir Özellik Öner';

  @override
  String get noInvites => 'No invites available';

  @override
  String get locationPermissionRationale =>
      'Yolculuklarınızın rotasını ve güncel konumunuzu takip etmek için konum izni vermelidir.';

  @override
  String get notificationPermissionRationale =>
      'Yolculuklarınızın durumunu size bildirmek için bildirim izni vermelidir.';

  @override
  String get yourOpinionMattersToUs => 'Görüşünüz bizler içim önemli';

  @override
  String get weWouldLoveToHearFromYou =>
      'Sizden duyumak istiyoruz! Lütfen görüşlerinizi, önerilerinizi ve geri bildirimlerinizi bize paylaşın.';

  @override
  String get finishTrip => 'Yolculuğu Bitir';

  @override
  String get startTrip => 'Yolculuğu Başlat';

  @override
  String get cancelTrip => 'Yolculuğu İptal Et';

  @override
  String get tripType => 'Yolculuk Türü';

  @override
  String get activeTrips => 'Aktif Yolculuklar';

  @override
  String get pastTrips => 'Geçmiş Yolculuklar';

  @override
  String get yourTripIsStarted => 'Yolculuğunuz başladı';

  @override
  String get yourTripIsFinished => 'Yolculuğunuz bitti';

  @override
  String get yourTripIsCanceled => 'Yolculuğunuz iptal edildi';

  @override
  String get areYouSureToEndTheTrip =>
      'Yolculuğu bitirmek istediğinize emin misiniz?';

  @override
  String get areYouSureToStartTheTrip =>
      'Yolculuğu başlatmak istediğinize emin misiniz?';

  @override
  String get areYouSureToCancelTheTrip =>
      'Yolculuğu iptal etmek istediğinize emin misiniz?';

  @override
  String get endTripContent =>
      'Yolculuğu bitirirseniz tekrar başlatamazsınız. Yolculuğu bitirmek istediğinize emin misiniz?';

  @override
  String get startTripContent =>
      'Yolculuğu başlatırsanız iptal edemezsiniz. Yolculuğu başlatmak istediğinize emin misiniz?';

  @override
  String get cancelTripContent =>
      'Yolculuğu iptal ederseniz tekrar başlatamazsınız. Yolculuğu iptal etmek istediğinize emin misiniz?';

  @override
  String get youAlreadyHaveActiveTrip =>
      'Aktif bir seyahatiniz var. Aktif olanı bitirmeden yeni bir seyahate başlayamazsınız.';

  @override
  String get monday => 'Pazartesi';

  @override
  String get tuesday => 'Salı';

  @override
  String get wednesday => 'Çarşamba';

  @override
  String get thursday => 'Perşembe';

  @override
  String get friday => 'Cuma';

  @override
  String get saturday => 'Cumartesi';

  @override
  String get sunday => 'Pazar';

  @override
  String get january => 'Ocak';

  @override
  String get february => 'Şubat';

  @override
  String get march => 'Mart';

  @override
  String get april => 'Nisan';

  @override
  String get may => 'Mayıs';

  @override
  String get june => 'Haziran';

  @override
  String get july => 'Temmuz';

  @override
  String get august => 'Ağustos';

  @override
  String get september => 'Eylül';

  @override
  String get october => 'Ekim';

  @override
  String get november => 'Kasım';

  @override
  String get december => 'Aralık';

  @override
  String get roomCreated => 'Sohbet odası oluşturuldu';

  @override
  String get message => 'Mesaj';

  @override
  String get send => 'Gönder';

  @override
  String get writeAreview => 'Yorum Yazın';

  @override
  String get leftAReview => 'Left a review for';

  @override
  String howWasTheTrip(String name) {
    return '$name ile yolculuğunuz nasıl geçti?';
  }

  @override
  String carShareWith(String location) {
    return '$location için araç paylaşımı';
  }

  @override
  String get reviewSentSuccessfully => 'Yorum başarıyla gönderildi';

  @override
  String get tripDone => 'Yolculuk Tamamlandı';

  @override
  String get tripCanceled => 'Yolculuk İptal Edildi';

  @override
  String get tripStarted => 'Yolculuk Başladı';

  @override
  String get succesfullyUpdatedProfile => 'Profil başarıyla güncellendi';

  @override
  String get clarificationText =>
      'Kişisel verilerinizin işlenmesine ilişkin bilgi almak için <cc>Aydınlatma Metni’ni</cc> inceleyebilirsiniz.';

  @override
  String get termsOfUseText =>
      'Uygulamayı kullanırken uymakla yükümlü olduğunuz kurallar için <cc>Kullanım Koşulları’nı</cc> inceleyebilirsiniz.';
}

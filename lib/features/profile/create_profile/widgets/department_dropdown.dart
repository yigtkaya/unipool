import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unipool/app/shared/button/dropdown_button.dart';
import 'package:unipool/core/constants/app_colors.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/extensions/l10.dart';
import 'package:unipool/features/profile/create_profile/cubit/department_cubit.dart';

final class DepartmentPickerDropdown extends StatelessWidget {
  const DepartmentPickerDropdown({super.key});
  static const list = [
    "Acil Durum ve Afet Yönetimi",
    "Acil Yardım ve Afet Yönetimi",
    "Adalet",
    "Adalet Meslek Yüksekokulu",
    "Adli Bilimler",
    "Adli Bilişim Mühendisliği",
    "Aile ve Tüketici Bilimleri",
    "Aktüerya",
    "Aktüerya Bilimleri",
    "Aktüerya ve Risk Yönetimi",
    "Alman Dili ve Edebiyatı",
    "Almanca Öğretmenliği",
    "Alternatif Enerji Kaynakları Teknolojisi",
    "Ameliyathane Hizmetleri",
    "Amerikan Kültürü ve Edebiyatı",
    "Anestezi",
    "Antrenörlük Eğitimi",
    "Antropoloji",
    "Arap Dili ve Edebiyatı",
    "Arapça Öğretmenliği",
    "Arkeoloji",
    "Arkeoloji ve Sanat Tarihi",
    "Arnavut Dili ve Edebiyatı",
    "Arıcılık",
    "Astronomi ve Astrofizik",
    "Astronomi ve Uzay Bilimleri",
    "Atçılık ve Antrenörlüğü",
    "Atık Yönetimi",
    "Avcılık ve Yaban Hayatı",
    "Avrupa Birliği İlişkileri",
    "Ayakkabı Tasarım ve Üretimi",
    "Ayakkabı Tasarımı ve Üretimi",
    "Azerbaycan Dili ve Edebiyatı",
    "Azerbaycan Dili Öğretmenliği",
    "Azerbaycan Türkçesi ve Edebiyatı",
    "Ağaç İşleri Endüstri Mühendisliği",
    "Ağız ve Diş Sağlığı",
    "Aşçılık",
    "Bahçe Bitkileri",
    "Bahçe Tarımı",
    "Bahçe ve Tarla Bitkileri",
    "Balıkçılık Teknolojisi Mühendisliği",
    "Bankacılık",
    "Bankacılık ve Finans",
    "Bankacılık ve Sigortacılık",
    "Basım Teknolojileri",
    "Basım ve Yayın Teknolojileri",
    "Basın ve Yayın",
    "Basın ve Yayıncılık",
    "Batı Dilleri",
    "Bağcılık",
    "Beden Eğitimi ve Spor Öğretmenliği",
    "Beslenme ve Diyetetik",
    "Bilgi Güvenliği Teknolojisi",
    "Bilgi Yönetimi",
    "Bilgi ve Belge Yönetimi",
    "Bilgisayar Bilimleri",
    "Bilgisayar Destekli Tasarım ve Animasyon",
    "Bilgisayar Mühendisliği",
    "Bilgisayar Operatörlüğü",
    "Bilgisayar Programcılığı",
    "Bilgisayar Teknolojisi",
    "Bilgisayar Teknolojisi ve Bilişim Sistemleri",
    "Bilgisayar ve Yazılım Mühendisliği",
    "Bilgisayar ve Öğretim Teknolojileri Öğretmenliği",
    "Bilim Tarihi",
    "Bilişim Sistemleri Mühendisliği",
    "Bilişim Sistemleri ve Teknolojileri",
    "Bitki Koruma",
    "Bitkisel Üretim ve Teknolojileri",
    "Biyoenformatik ve Genetik",
    "Biyokimya",
    "Biyoloji",
    "Biyoloji Öğretmenliği",
    "Biyomedikal Cihaz Teknolojisi",
    "Biyomedikal Mühendisliği",
    "Biyomühendislik",
    "Biyosistem Mühendisliği",
    "Biyoteknoloji",
    "Biyoteknoloji ve Moleküler Biyoloji",
    "Boya Teknolojisi",
    "Boşnak Dili ve Edebiyatı",
    "Bulgar Dili ve Edebiyatı",
    "Büro Yönetimi ve Yönetici Asistanlığı",
    "Canlandırma Filmi Tasarım ve Yönetimi",
    "Cevher Hazırlama Mühendisliği",
    "Ceza İnfaz ve Güvenlik Hizmetleri",
    "Coğrafi Bilgi Sistemleri",
    "Coğrafya",
    "Coğrafya Öğretmenliği",
    "Deniz Brokerliği",
    "Deniz Ulaştırma ve İşletme",
    "Deniz Ulaştırma İşletme Mühendisliği",
    "Deniz ve Liman İşletmeciliği",
    "Denizci Sağlığı",
    "Denizcilik İşletmeleri Yönetimi",
    "Deri Konfeksiyon",
    "Deri Mühendisliği",
    "Deri Teknolojisi",
    "Dezenfeksiyon, Sterilizasyon ve Antisepsi",
    "Dijital Medya ve Pazarlama",
    "Dijital Oyun Tasarımı",
    "Dil ve Konuşma Terapisi",
    "Dilbilim",
    "Dilbilimi",
    "Diyaliz",
    "Diş Hekimliği",
    "Diş Protez Teknolojisi",
    "Doğal Yapı Taşları Teknolojisi",
    "Doğalgaz ve Tesisatı Teknolojisi",
    "Doğu Dilleri",
    "Döküm",
    "Dış Ticaret",
    "Ebelik",
    "Eczacılık",
    "Eczane Hizmetleri",
    "Ekonometri",
    "Ekonomi",
    "Ekonomi ve Finans",
    "El Sanatları",
    "El Sanatları Tasarımı ve Üretimi",
    "Elektrik",
    "Elektrik Enerjisi Üretim, İletim ve Dağıtımı",
    "Elektrik Mühendisliği",
    "Elektrik-Elektronik Mühendisliği",
    "Elektrikli Cihaz Teknolojisi",
    "Elektronik Haberleşme Teknolojisi",
    "Elektronik Mühendisliği",
    "Elektronik Teknolojisi",
    "Elektronik Ticaret ve Teknoloji Yönetimi",
    "Elektronik ve Haberleşme Mühendisliği",
    "Elektronörofizyoloji",
    "Emlak ve Emlak Yönetimi",
    "Endüstri Mühendisliği",
    "Endüstri ve Sistem Mühendisliği",
    "Endüstri Ürünleri Tasarımı",
    "Endüstriyel Cam ve Seramik",
    "Endüstriyel Hammaddeler İşleme Teknolojisi",
    "Endüstriyel Kalıpçılık",
    "Endüstriyel Tasarım",
    "Endüstriyel Tasarım Mühendisliği",
    "Endüstriyel Tavukçuluk",
    "Enerji Mühendisliği",
    "Enerji Sistemleri Mühendisliği",
    "Enerji Tesisleri İşletmeciliği",
    "Enerji Yönetimi",
    "Engelli Bakımı ve Rehabilitasyon",
    "Ergoterapi",
    "Ermeni Dili ve Edebiyatı",
    "Ermeni Dili ve Kültürü",
    "Eser Koruma",
    "Eski Yunan Dili ve Edebiyatı",
    "Et ve Ürünleri Teknolojisi",
    "Ev Tekstili Tasarımı",
    "Ev İdaresi",
    "Evde Hasta Bakımı",
    "Fars Dili ve Edebiyatı",
    "Felsefe",
    "Felsefe Grubu Öğretmenliği",
    "Fen Bilgisi Öğretmenliği",
    "Fidan Yetiştiriciliği",
    "Film Tasarım ve Yazarlık",
    "Film Tasarım ve Yönetmenliği",
    "Film Tasarımı",
    "Finans ve Bankacılık",
    "Fizik",
    "Fizik Mühendisliği",
    "Fizik Öğretmenliği",
    "Fizyoterapi",
    "Fizyoterapi ve Rehabilitasyon",
    "Fotonik",
    "Fotoğraf",
    "Fotoğraf ve Video",
    "Fotoğrafçılık ve Kameramanlık",
    "Fransız Dili ve Edebiyatı",
    "Fransızca Öğretmenliği",
    "Fındık Eksperliği",
    "Gastronomi",
    "Gastronomi ve Mutfak Sanatları",
    "Gayrimenkul Geliştirme ve Yönetimi",
    "Gaz ve Tesisatı Teknolojisi",
    "Gazetecilik",
    "Geleneksel El Sanatları",
    "Geleneksel Türk Sanatları",
    "Gemi Makineleri İşletme",
    "Gemi Makineleri İşletme Mühendisliği",
    "Gemi ve Deniz Teknolojisi Mühendisliği",
    "Gemi ve Yat Tasarımı",
    "Gemi İnşaatı",
    "Gemi İnşaatı ve Gemi Makineleri Mühendisliği",
    "Genetik ve Biyomühendislik",
    "Genetik ve Yaşam Bilimleri Programları",
    "Geomatik Mühendisliği",
    "Geoteknik",
    "Gerontoloji",
    "Girişimcilik",
    "Giyim Üretim Teknolojisi",
    "Grafik Tasarım",
    "Grafik Tasarımı",
    "Görsel Sanatlar",
    "Görsel Sanatlar ve İletişim Tasarımı",
    "Görsel İletişim",
    "Görsel İletişim Tasarımı",
    "Gümrük İşletme",
    "Gürcü Dili ve Edebiyatı",
    "Gıda Kalite Kontrolü ve Analizi",
    "Gıda Mühendisliği",
    "Gıda Teknolojisi",
    "Halkbilim",
    "Halkla İlişkiler",
    "Halkla İlişkiler ve Reklamcılık",
    "Halkla İlişkiler ve Tanıtım",
    "Halıcılık ve Kilimcilik",
    "Harita Mühendisliği",
    "Harita ve Kadastro",
    "Hava Lojistiği",
    "Havacılık Elektrik ve Elektroniği",
    "Havacılık Elektroniği",
    "Havacılık Yönetimi",
    "Havacılık ve Uzay Mühendisliği",
    "Hayvansal Üretim",
    "Hayvansal Üretim ve Teknolojileri",
    "Hemşirelik",
    "Hemşirelik ve Sağlık Hizmetleri",
    "Hibrid ve Elektrikli Taşıtlar Teknolojisi",
    "Hidrojeoloji Mühendisliği",
    "Hindoloji",
    "Hititoloji",
    "Hukuk",
    "Hukuk Büro Yönetimi ve Sekreterliği",
    "Hungaroloji",
    "Japon Dili ve Edebiyatı",
    "Japonca Öğretmenliği",
    "Jeofizik Mühendisliği",
    "Jeoloji Mühendisliği",
    "Kamu Yönetimi",
    "Kanatlı Hayvan Yetiştiriciliği",
    "Karşılaştırmalı Edebiyat",
    "Kaynak Teknolojisi",
    "Kazak Dili ve Edebiyatı",
    "Kentsel Tasarım ve Peyzaj Mimarlığı",
    "Kimya",
    "Kimya Mühendisliği",
    "Kimya Mühendisliği ve Uygulamalı Kimya",
    "Kimya Teknolojisi",
    "Kimya ve Süreç Mühendisliği",
    "Kimya Öğretmenliği",
    "Kimya-Biyoloji Mühendisliği",
    "Klasik Arkeoloji",
    "Konaklama İşletmeciliği",
    "Kontrol ve Otomasyon Mühendisliği",
    "Kontrol ve Otomasyon Teknolojisi",
    "Kooperatifçilik",
    "Kore Dili ve Edebiyatı",
    "Kozmetik Teknolojisi",
    "Kurgu-Ses ve Görüntü Yönetimi",
    "Kuyumculuk ve Mücevher Tasarımı",
    "Kuyumculuk ve Mücevherat Tasarımı",
    "Kuyumculuk ve Takı Tasarımı",
    "Kültür Varlıklarını Koruma ve Onarım",
    "Kültür ve İletişim Bilimleri",
    "Kültürel Miras ve Turizm",
    "Kümes Hayvanları Yetiştiriciliği",
    "Küresel Siyaset ve Uluslararası İlişkiler",
    "Kürt Dili ve Edebiyatı",
    "Laborant ve Veteriner Sağlık",
    "Laboratuvar Teknolojisi",
    "Lastik ve Plastik Teknolojisi",
    "Latin Dili ve Edebiyatı",
    "Leh Dili ve Edebiyatı",
    "Lif ve Polimer Mühendisliği",
    "Lojistik",
    "Lojistik Yönetimi",
    "Maden Mühendisliği",
    "Maden Teknolojisi",
    "Makine",
    "Makine Mühendisliği",
    "Makine ve İmalat Mühendisliği",
    "Makine, Resim ve Konstrüksiyon",
    "Maliye",
    "Malzeme Bilimi ve Mühendisliği",
    "Malzeme Bilimi ve Nanoteknoloji Mühendisliği",
    "Malzeme Bilimi ve Teknolojileri",
    "Mantarcılık",
    "Marina ve Yat İşletmeciliği",
    "Marka İletişimi",
    "Matematik",
    "Matematik Mühendisliği",
    "Matematik Öğretmenliği",
    "Matematik-Bilgisayar",
    "Medya ve Görsel Sanatlar",
    "Medya ve İletişim",
    "Mekatronik",
    "Mekatronik Mühendisliği",
    "Mekatronik Sistemler Mühendisliği",
    "Menkul Kıymetler ve Sermaye Piyasası",
    "Metalurji",
    "Metalurji ve Malzeme Mühendisliği",
    "Meteoroloji Mühendisliği",
    "Meyve ve Sebze İşleme Teknolojisi",
    "Mimari Dekoratif Sanatlar",
    "Mimari Restorasyon",
    "Mimarlık",
    "Mobil Teknolojileri",
    "Mobilya ve Dekorasyon",
    "Moda Tasarımı",
    "Moda Yönetimi",
    "Moda ve Tekstil Tasarımı",
    "Moleküler Biyoloji ve Genetik",
    "Moleküler Biyoteknoloji",
    "Muhasebe",
    "Muhasebe Bilgi Sistemleri",
    "Muhasebe ve Denetim",
    "Muhasebe ve Finans Yönetimi",
    "Muhasebe ve Vergi Uygulamaları",
    "Mühendislik Programları",
    "Mühendislik ve Doğa Bilimleri Programları",
    "Mütercim-Tercümanlık",
    "Müzecilik",
    "Nanobilim ve Nanoteknoloji",
    "Nanoteknoloji Mühendisliği",
    "Nüfus ve Vatandaşlık",
    "Nükleer Enerji Mühendisliği",
    "Nükleer Teknoloji ve Radyasyon Güvenliği",
    "Nükleer Tıp Teknikleri",
    "Odyoloji",
    "Odyometri",
    "Okul Öncesi Öğretmenliği",
    "Optik ve Akustik Mühendisliği",
    "Optisyenlik",
    "Organik Tarım",
    "Organik Tarım İşletmeciliği",
    "Orman Endüstrisi Mühendisliği",
    "Orman Mühendisliği",
    "Ormancılık ve Orman Ürünleri",
    "Ortez-Protez",
    "Ortopedik Protez ve Ortez",
    "Otel Yöneticiliği",
    "Oto Boya ve Karoseri",
    "Otobüs Kaptanlığı",
    "Otomotiv Mühendisliği",
    "Otomotiv Teknolojisi",
    "Otopsi Yardımcılığı",
    "Pastacılık ve Ekmekçilik",
    "Patoloji Laboratuvar Teknikleri",
    "Pazarlama",
    "Perakende Satış ve Mağaza Yönetimi",
    "Perfüzyon",
    "Perfüzyon Teknikleri",
    "Petrol ve Doğalgaz Mühendisliği",
    "Peyzaj Mimarlığı",
    "Peyzaj ve Süs Bitkileri",
    "Pilotaj",
    "Podoloji",
    "Polimer Mühendisliği",
    "Polimer Teknolojisi",
    "Politika ve Ekonomi",
    "Polonya Dili ve Kültürü",
    "Posta Hizmetleri",
    "Protohistorya ve Ön Asya Arkeolojisi",
    "Psikoloji",
    "Psikolojik Danışmanlık ve Rehberlik",
    "Psikolojik Danışmanlık ve Rehberlik Öğretmenliği",
    "Radyo ve Televizyon Programcılığı",
    "Radyo ve Televizyon Teknolojisi",
    "Radyo, Televizyon ve Sinema",
    "Radyoterapi",
    "Rafineri ve Petro-Kimya Teknolojisi",
    "Raylı Sistemler Elektrik ve Elektronik Teknolojisi",
    "Raylı Sistemler Makine Teknolojisi",
    "Raylı Sistemler Makinistlik",
    "Raylı Sistemler Mühendisliği",
    "Raylı Sistemler Yol Teknolojisi",
    "Raylı Sistemler İşletmeciliği",
    "Rehberlik ve Psikolojik Danışmanlık",
    "Reklam Tasarımı ve İletişimi",
    "Reklamcılık",
    "Rekreasyon",
    "Rekreasyon Yönetimi",
    "Restorasyon ve Konservasyon",
    "Rus Dili ve Edebiyatı",
    "Rus Dili ve Edebiyatı Öğretmenliği",
    "Rus ve İngiliz Dilleri ve Edebiyatları",
    "Sahne ve Dekor Tasarımı",
    "Sahne ve Gösteri Sanatları Teknolojisi",
    "Sanat Tarihi",
    "Sanat Yönetimi",
    "Sanat ve Kültür Yönetimi",
    "Sanat ve Sosyal Bilimler Programları",
    "Saç Bakımı ve Güzellik Hizmetleri",
    "Sağlık Bilgi Sistemleri Teknikerliği",
    "Sağlık Kurumları İşletmeciliği",
    "Sağlık Turizmi İşletmeciliği",
    "Sağlık Yönetimi",
    "Seracılık",
    "Seramik Tasarımı",
    "Seramik, Cam ve Çinicilik",
    "Sermaye Piyasaları ve Portföy Yönetimi",
    "Sermaye Piyasası",
    "Seyahat İşletmeciliği",
    "Seyahat İşletmeciliği ve Turizm Rehberliği",
    "Sigortacılık",
    "Sigortacılık ve Aktüerya Bilimleri",
    "Sigortacılık ve Risk Yönetimi",
    "Sigortacılık ve Sosyal Güvenlik",
    "Silah Sanayi Teknikerliği",
    "Sinema ve Dijital Medya",
    "Sinema ve Televizyon",
    "Sinoloji",
    "Sivil Hava Ulaştırma İşletmeciliği",
    "Sivil Havacılık Kabin Hizmetleri",
    "Sivil Savunma ve İtfaiyecilik",
    "Siyasal Bilimler ve Uluslararası İlişkiler",
    "Siyaset Bilimi",
    "Siyaset Bilimi ve Kamu Yönetimi",
    "Siyaset Bilimi ve Uluslararası İlişkiler",
    "Sondaj Teknolojisi",
    "Sosyal Bilgiler Öğretmenliği",
    "Sosyal Güvenlik",
    "Sosyal Hizmet",
    "Sosyal Hizmetler",
    "Sosyal Medya Yöneticiliği",
    "Sosyal ve Siyasal Bilimler",
    "Sosyoloji",
    "Spor Bilimleri",
    "Spor Yöneticiliği",
    "Spor Yönetimi",
    "Su Altı Teknolojisi",
    "Su Bilimleri ve Mühendisliği",
    "Su Ürünleri Mühendisliği",
    "Su Ürünleri İşleme Teknolojisi",
    "Sulama Teknolojisi",
    "Sümeroloji",
    "Süryani Dili ve Edebiyatı",
    "Süs Bitkileri Yetiştiriciliği",
    "Süt Teknolojisi",
    "Süt ve Besi Hayvancılığı",
    "Süt ve Ürünleri Teknolojisi",
    "Sınıf Öğretmenliği",
    "Tahribatsız Muayene",
    "Takı Tasarımı",
    "Tapu Kadastro",
    "Tapu ve Kadastro",
    "Tarih",
    "Tarih Öncesi Arkeolojisi",
    "Tarih Öğretmenliği",
    "Tarla Bitkileri",
    "Tarım",
    "Tarım Ekonomisi",
    "Tarım Makineleri",
    "Tarım Makineleri ve Teknolojileri Mühendisliği",
    "Tarım Ticareti ve İşletmeciliği",
    "Tarımsal Biyoteknoloji",
    "Tarımsal Genetik Mühendisliği",
    "Tarımsal Yapılar ve Sulama",
    "Tarımsal Ürünler Muhafaza ve Depolama Teknolojisi",
    "Tarımsal İşletmecilik",
    "Taşınabilir Kültür Varlıklarını Koruma ve Onarım",
    "Teknoloji ve Bilgi Yönetimi",
    "Tekstil Mühendisliği",
    "Tekstil Tasarımı",
    "Tekstil Teknolojisi",
    "Tekstil ve Halı Makineleri",
    "Tekstil ve Moda Tasarımı",
    "Televizyon Haberciliği ve Programcılığı",
    "Tiyatro Eleştirmenliği ve Dramaturji",
    "Tohum Bilimi ve Teknolojisi",
    "Tohumculuk Teknolojisi",
    "Toprak Bilimi ve Bitki Besleme",
    "Turist Rehberliği",
    "Turizm Animasyonu",
    "Turizm Rehberliği",
    "Turizm ve Otel İşletmeciliği",
    "Turizm ve Otelcilik",
    "Turizm ve Seyahat Hizmetleri",
    "Turizm İşletmeciliği",
    "Turizm İşletmeciliği ve Otelcilik",
    "Türk Dili ve Edebiyatı",
    "Türk Dili ve Edebiyatı Öğretmenliği",
    "Türk Halkbilimi",
    "Türk İslam Arkeolojisi",
    "Türkoloji",
    "Türkçe Öğretmenliği",
    "Tütün Eksperliği",
    "Tıbbi Dokümantasyon ve Sekreterlik",
    "Tıbbi Görüntüleme Teknikleri",
    "Tıbbi Laboratuvar Teknikleri",
    "Tıbbi Tanıtım ve Pazarlama",
    "Tıbbi ve Aromatik Bitkiler",
    "Tıp",
    "Tıp Mühendisliği",
    "Ukrayna Dili ve Edebiyatı",
    "Ulaştırma Mühendisliği",
    "Ulaştırma ve Lojistik",
    "Ulaştırma ve Trafik Hizmetleri",
    "Uluslararası Ekonomi",
    "Uluslararası Finans",
    "Uluslararası Finans ve Bankacılık",
    "Uluslararası Girişimcilik",
    "Uluslararası Lojistik Yönetimi",
    "Uluslararası Lojistik ve Taşımacılık",
    "Uluslararası Ticaret",
    "Uluslararası Ticaret ve Finans",
    "Uluslararası Ticaret ve Lojistik",
    "Uluslararası Ticaret ve Lojistik Yönetimi",
    "Uluslararası Ticaret ve İşletmecilik",
    "Uluslararası Ulaştırma Sistemleri",
    "Uluslararası İlişkiler",
    "Uluslararası İşletme Yönetimi",
    "Uluslararası İşletmecilik",
    "Uluslararası İşletmecilik ve Ticaret",
    "Un ve Unlu Mamuller Teknolojisi",
    "Urdu Dili ve Edebiyatı",
    "Uygulamalı Rusça ve Çevirmenlik",
    "Uygulamalı İngilizce ve Çevirmenlik",
    "Uygulamalı İspanyolca ve Çevirmenlik",
    "Uzay Bilimleri ve Teknolojileri",
    "Uzay Mühendisliği",
    "Uçak Bakım ve Onarım",
    "Uçak Elektrik-Elektronik",
    "Uçak Gövde-Motor Bakım",
    "Uçak Mühendisliği",
    "Uçak Teknolojisi",
    "Uçak ve Uzay Mühendisliği",
    "Uçuş Harekat Yöneticiliği",
    "Veterinerlik",
    "Web Tasarımı ve Kodlama",
    "Yaban Hayatı Ekolojisi ve Yönetimi",
    "Yapay Zeka Mühendisliği",
    "Yapı Denetimi",
    "Yapı Ressamlığı",
    "Yapı Tesisat Teknolojisi",
    "Yapı Yalıtım Teknolojisi",
    "Yat Kaptanlığı",
    "Yazılım Geliştirme",
    "Yazılım Mühendisliği",
    "Yağ Endüstrisi",
    "Yaşlı Bakımı",
    "Yeni Medya",
    "Yeni Medya ve Gazetecilik",
    "Yeni Medya ve İletişim",
    "Yerel Yönetimler",
    "Yiyecek ve İçecek İşletmeciliği",
    "Yunan Dili ve Edebiyatı",
    "Yönetim Bilimleri Programları",
    "Yönetim Bilişim Sistemleri",
    "Zaza Dili ve Edebiyatı",
    "Zeytincilik ve Zeytin İşleme Teknolojisi",
    "Ziraat Mühendisliği Programları",
    "Zootekni",
    "Çalışma Ekonomisi ve Endüstri İlişkileri",
    "Çay Tarımı ve İşleme Teknolojisi",
    "Çağdaş Türk Lehçeleri ve Edebiyatları",
    "Çağdaş Yunan Dili ve Edebiyatı",
    "Çağrı Merkezi Hizmetleri",
    "Çerkez Dili ve Edebiyatı",
    "Çeviribilim",
    "Çevre Koruma ve Kontrol",
    "Çevre Mühendisliği",
    "Çevre Sağlığı",
    "Çevre Temizliği ve Denetimi",
    "Çim Alan Tesisi ve Yönetimi",
    "Çin Dili ve Edebiyatı",
    "Çini Sanatı ve Tasarımı",
    "Çizgi Film ve Animasyon",
    "Çocuk Gelişimi",
    "Çocuk Koruma ve Bakım Hizmetleri",
    "Özel Eğitim Öğretmenliği",
    "Özel Güvenlik ve Koruma",
    "Üretimde Kalite Kontrol",
    "Üç Boyutlu Modelleme ve Animasyon",
    "İbrani Dili ve Edebiyatı",
    "İklimlendirme ve Soğutma Teknolojisi",
    "İkram Hizmetleri",
    "İktisadi ve İdari Bilimler Programları",
    "İktisadi ve İdari Programlar",
    "İktisat",
    "İlahiyat",
    "İletişim",
    "İletişim Bilimleri",
    "İletişim Sanatları",
    "İletişim Tasarımı",
    "İletişim Tasarımı ve Medya",
    "İletişim Tasarımı ve Yeni Medya",
    "İletişim Tasarımı ve Yönetimi",
    "İletişim ve Tasarım",
    "İlk ve Acil Yardım",
    "İlköğretim Matematik Öğretmenliği",
    "İmalat Mühendisliği",
    "İngiliz Dil Bilimi",
    "İngiliz Dili ve Edebiyatı",
    "İngiliz Dili ve Karşılaştırmalı Edebiyat",
    "İngiliz ve Rus Dilleri ve Edebiyatları",
    "İngilizce Öğretmenliği",
    "İnsan Kaynakları Yönetimi",
    "İnsan ve Toplum Bilimleri",
    "İnternet ve Ağ Teknolojileri",
    "İnşaat Mühendisliği",
    "İnşaat Teknolojisi",
    "İslam Bilimleri",
    "İslam Ekonomisi ve Finans",
    "İslami İlimler",
    "İspanyol Dili ve Edebiyatı",
    "İstatistik",
    "İstatistik ve Bilgisayar Bilimleri",
    "İtalyan Dili ve Edebiyatı",
    "İç Mekan Tasarımı",
    "İç Mimarlık",
    "İç Mimarlık ve Çevre Tasarımı",
    "İş Makineleri Operatörlüğü",
    "İş Sağlığı ve Güvenliği",
    "İş ve Uğraşı Terapisi",
    "İşletme",
    "İşletme Bilgi Yönetimi",
    "İşletme Enformatiği",
    "İşletme Mühendisliği",
    "İşletme Yönetimi",
    "İşletme-Ekonomi",
    "Şarap Üretim Teknolojisi",
    "Şehir ve Bölge Planlama",
  ];
  @override
  Widget build(BuildContext context) {
    final textEditingController = TextEditingController();
    return BlocBuilder<DepartmentCubit, String?>(
      builder: (context, state) {
        return CustomDropdownButton(
          dropdownSearchData: DropdownSearchData(
            searchController: textEditingController,
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Container(
              height: 50,
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 4,
                right: 8,
                left: 8,
              ),
              child: TextFormField(
                expands: true,
                maxLines: null,
                controller: textEditingController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 8.h,
                  ),
                  hintText: context.l10n.searchForDepartment,
                  hintStyle: context.textTheme.bodyMedium,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              return item.value.toString().toLowerCase().contains(searchValue.toLowerCase());
            },
          ),
          hint: context.l10n.department,
          buttonWidth: double.infinity,
          buttonHeight: 64.h,
          bgColor: AppColors.kGreyLight1,
          dropdownDecoration: BoxDecoration(
            color: AppColors.kWhite,
            borderRadius: BorderRadius.circular(8.r),
          ),
          dropdownItems: list,
          onChanged: (value) {
            if (value != null) {
              context.read<DepartmentCubit>().setDepartment(value);
            }
          },
          value: state,
        );
      },
    );
  }
}

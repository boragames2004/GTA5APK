# Bora GTA V Launcher

Bu proje, Android'de bir `.exe` dosyasını seçip cihazda kurulu EXE açabilen uygulamaya
(GameHub/Winlator gibi) gönderen basit bir launcher kabuğudur.

## Önemli
- GTA V dosyalarını içermez.
- Wine/Box64/DXVK içermez.
- OBB'yi otomatik açmaz veya çıkartmaz.
- Native Android port üretmez.
- Yalnızca kendi yasal oyun dosyalarınla kullanılmalıdır.

## APK oluşturma
1. Projeyi Android Studio veya AndroidIDE ile aç.
2. Gradle senkronizasyonunu bekle.
3. Build > Build APK(s) seç.
4. Çıktı: `app/build/outputs/apk/debug/app-debug.apk`

## Kullanım
1. Launcher'ı yükle.
2. `PlayGTAV.exe` dosyasını seç.
3. İstersen OBB dosyasını da seçip kaydet.
4. `OYUNU BAŞLAT` butonuna dokun.
5. Açılan uygulama listesinden GameHub/Winlator seç.

GameHub/Winlator, `.exe` için Android `ACTION_VIEW` kaydı yapmıyorsa otomatik açılmaz.
Bu durumda ilgili uygulamanın özel deep-link veya paket entegrasyonu gerekir.

HAZIR DERLEME DOSYALARI
- gradlew: Linux/macOS için Gradle başlatıcı
- gradlew.bat: Windows için Gradle başlatıcı
- .github/workflows/build-apk.yml: GitHub Actions ile otomatik APK

GitHub'a yüklerken ZIP'in içindeki app, gradlew, gradlew.bat, build.gradle,
settings.gradle ve .github klasörünü repo ana dizinine koy.
Actions > Build Android APK > Run workflow seç.

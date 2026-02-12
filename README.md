# Risale-App

Risale App (Teacher Lesson Tracker)

Risale App is a cross-platform Flutter app (Android + iOS) made to help teachers track students’ learning progress without notebooks. It was built for real daily use in a school environment: quick logging, clear history, and clean PDF reports.

What the app does
	•	Manage multiple schools (switch anytime)
	•	Add/manage students
	•	Log lesson entries (date, page learned, passed/not passed, optional note)
	•	Store Arabic/Turkish/English text safely (notes can be Arabic)
	•	Generate PDFs:
	•	Student Report: one student
	•	General Report: all students in one PDF + daily lessons history table at the end
	•	Multi-language support:
	•	Arabic (default, RTL)
	•	Turkish (LTR)
	•	English (LTR)

Downloads (Android APK)
I included an Android release APK in a .rar file so you can try it quickly.
	1.	Download the .rar from this repository
	2.	Extract it
	3.	Install the APK on your Android phone

Important: Android might warn “Unknown apps”. If needed:
Settings → Security/Privacy → Install unknown apps → allow for the browser/files app you used.

iPhone install (shortest way for personal use)
Apple doesn’t allow direct “APK-style” installs. The easiest personal method is using Xcode (Mac required).

Steps:
	1.	Install Xcode from the App Store and open it once
	2.	On your iPhone: Settings → Privacy & Security → Developer Mode → ON (if asked)
	3.	Connect iPhone to Mac using cable (or wireless after pairing)
	4.	Open the iOS project:
	•	In project root, open: ios/Runner.xcworkspace
	5.	In Xcode:
	•	Select “Runner” target → Signing & Capabilities
	•	Choose your Apple ID under “Team”
	•	Make sure the Bundle Identifier is unique (change it if needed)
	6.	Press Run in Xcode (or run from terminal: flutter run)

After installing:
On iPhone: Settings → General → VPN & Device Management → Trust your developer certificate.

Note: This installs the app for personal testing. If you want to share it publicly on iOS, you’ll need TestFlight/App Store.

How to run locally (developers)
	•	Install Flutter SDK
	•	flutter pub get
	•	flutter gen-l10n
	•	flutter run

Notes about PDFs and languages
PDFs are generated using proper fonts so Arabic renders correctly, and text direction switches automatically (RTL for Arabic, LTR for Turkish/English). The PDF language matches the currently selected app language.

Project status
This project is complete and used as a practical teacher tool. If you find bugs or want improvements, feel free to open an issue or suggest changes.

License
Add your preferred license here (MIT/Apache-2.0/etc).

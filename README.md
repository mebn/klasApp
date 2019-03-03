# klasApp 

App till roboten Klas.

## Information

Gymnasiearbete.

All kod ligger i `./lib`.

|Fil|Förklaring|
|---|---|
|`./lib/main.dart`|Startpunkten för appen.|
|`./lib/globals.dart`|Globala variablar.|
|`./lib/serverSetup.dart`|Allt som har med servern att göra. Appen skickar data till servern som ligger på rpi.|
|`./lib/screens/homeScreen.dart`|Hemskärmen för appen.|
|`./lib/screens/controllScreen.dart`|Kontrollerna som styr bilen.|
|`./lib/screens/infoScreen.dart`|Information om appen, gymnasiearbetet och oss.|
|`./lib/components/awesomeButton.dart`|Knapparna som används i `./lib/screens/controllScreen.dart`.|
|`./lib/components/infoCard.dart`|Informationsrutorna som används i `./lib/screens/infoScreen.dart`.|
|`./lib/components/landscapeOrientation.dart`|Hur layouten ser ut i liggande läge.|
|`./lib/components/portraitOrientation.dart`|Hur layouten ser ut i stående läge.|
|`./lib/components/someButton.dart`|Knappen som används i `./lib/screens/homeScreen.dart` för att öppna kontrollerna.|

## Nedladdning

Ladda ner appen för android:

https://github.com/mebn/klasApp/releases

## Länkar

Server:

https://github.com/mebn/klas

Socket.io:

https://pub.dartlang.org/packages/flutter_socket_io

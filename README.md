# record_cataloguer

An application to assist in learning the notes of the staff along with notes on the instrument.

## Getting Started

##Flutter Sample Readme
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



## Project Setup Instructions

Installing/Setting Up Flutter SDK
1. Download Flutter SDK:
   https://docs.flutter.dev/get-started/install

Note: For M1 Chip Macbooks (ARM64 architecture) refer to following link for additional steps M1 Setup Notes. Rosetta 2 is installed here.
https://github.com/flutter/flutter/wiki/Developing-with-Flutter-on-Apple-Silicon

2. Add environment variable to .bash_profile or .zprofile depending upon which shell you use
   Note: To get to bash_profile....open finder -> users/[user] and CMD-SHIFT-PERIOD (to show hidden files)

Add the following line, substituting your path to bin:
export PATH="$PATH:/[my-path-to-flutter-folder]/bin" ****Example: export PATH="$PATH:/$HOME/developer/flutter 2/bin"

3. Verify that the environment variable setup worked by checking flutter version.
   ****In terminal, type: flutter --version ****If version information is listed, the SDK was setup correctly. **If flutter is unknown command error is received, check your flutter path in the env variable by entering into terminal: which flutter

**And in bash_profile: echo $PATH

Install Android Studio
https://developer.android.com/studio. If you have an M1 machine, use the Download Options link and then download the MAC_ARM.ZIP file.

Add flutter and dart plugins.
Android Studio -> Preferences -> Plugins -> Search for flutter and install, should be prompted to install Dart plugin as well. Then restart Android Studio.

Set Android Studio SDK
File -> Project Structure -> Project Settings (left pane) -> Project (left pane) then select which SDK you want to use under Project SDK.

**<Optional> Set up Dart SDK**
Run these two commands in a terminal:
brew tap dart-lang/dart
brew install dart
Setup SDK path in Android Studio
todo: Do this!!!!*******

In Android Studio go to Preferences > Languages and Frameworks > Dart then check the box "Enable Dart Support for the project 'my_project'
Then set the Dart SDK Path. If installed with Homebrew, it should be at the following path (from the root drive directory "Macintosh" unless renamed.)
**Path to dart SDK**: /opt/homebrew/Cellar/dart/2.16.1/libexec

Apply and restart Android Studio.

Add emulator to Android Studio.
****M1 Troubleshooting https://stackoverflow.com/questions/64907154/android-studio-emulator-on-macos-with-arm-cpu-m1 Make sure the image used for the emulator is ARM image if you have an M1 chip. When you get to the 'Select an Image' page, the ARM images are under 'other images' menu.

Install the android sdk command line tools:
In Android Studio go to Preferences->Appearance and Behavior->System Settings->Android SDK and check the box for android sdk build tools and click apply.

Restart the terminal to pick up the changes.

Accept the Android Licenses
Run flutter doctor --android-licenses Accept the licenses

Check to see if you have everything installed
Run flutter doctor -v Flutter will diagnose if you have the required dependencies for developing for each platform, and it will give commands to run to add missing dependencies.

Set up for IOS/MacOS development
Install Homebrew
Run /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" (without backticks)

After that finishes, add to the environment variables
Run echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/david/.bash_profile And then Run eval "$(/opt/homebrew/bin/brew shellenv)"

Run brew doctor (making sure that it is configured correctly)

Install Cocoapods

Run brew install cocoapods

Verify all platforms are ready for development

Run flutter doctor -v and check the output. This will tell you if everything is installed correctly

##Troubleshooting error messages
When launching the emulator in Android Studio
1. The emulator process for AVD has terminated

Solution:

Go to SDK Manager (icon in top right next to search icon).
Click on SDK tools in the dialog box, uncheck Android Emulator and apply.
Once it's done uninstalling, recheck the box and apply to reinstall it.
Restart Android Studio and try the emulator again.
2. AVD Manager: Unable to locate ADB

Solution:

Set up the Project Android SDK as explained earlier.

# fmx-toast
![Delphi Supported Versions](https://img.shields.io/badge/Delphi%20Supported%20Version-10.3%20Rio-blue.svg)
![Platforms](https://img.shields.io/badge/Supported%20platforms-Windows%20,%20Android%20and%20IOS-red.svg)

Simple customized toast for firemonkey.

## Prerequisites
 * `[Alcinoe]` For this project I used Alcinoe controls. You can dowload and install the component [**here**](https://github.com/Zeus64/alcinoe). You can use native controls like TRectangle, TLayout. I prefer Alcinoe because the visual look better than Delphi components, and is more fast too. Take a time to read about Alcinoe lib.

 * `[Optional]` For ease I recommend using the [**Boss**](https://github.com/HashLoad/boss) (Dependency Manager for Delphi) for installation.
 
 ## Boss Installation
```
boss install github.com/mateusvicente100/fmx-toast
```

## Manual Installation
If you choose to install manually, simply add the following folders to your project, in *Project > Options > Resource Compiler > Directories and Conditionals > Include file search path*
```
../fmx-toast/src
```

## Getting Started
All features offered by this project are located in the unit FMX.Toast. To get your project started, simply add your reference where your functionality is needed. Here's an example:
```pascal
uses FMX.Toast;
```

To create a new toast you must use the class function "New". It will return a new instance of TToast. You can simple use four comands:
```pascal
begin
  TToast.New(Self).Error('This is a simple error toast message!');
  TToast.New(Self).Info('This is a simple info toast message!');
  TToast.New(Self).Success('This is a simple success toast message!');
  TToast.New(Self).Warning('This is a simple warning toast message!');
end;
``` 

**Parameters**
* `AOwner` - Indicates the owner of the toast. It will be where the controls will appear;

The toast instance will be destroyed after the controls dissaper. If you touch in the toast you close he.

## Samples
Check out our sample project for each situation presented above in operation. If you have any questions or suggestion, please contact, make your pull request or create an issue.

`fmx-toast` is free and open-source software licensed under the [MIT License](https://github.com/mateusvicente100/fmx-toast/blob/master/LICENSE).
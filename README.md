Convert Xcode color theme to Vim color theme

## Requirements
* [jq](https://github.com/stedolan/jq)

## Usage

    $ ./convert <path>

Xcode color themes can be found in:

    ~/Library/Developer/Xcode/UserData/FontAndColorThemes/
    /Applications/Xcode.app/Contents/SharedFrameworks/DVTKit.framework/Versions/A/Resources/FontAndColorThemes/

## Configuration

[config](config) is used to define relations between keys in themes. When one
Xcode key relates to multiple Vim keys, the last matching entry in the config
file is used.

## Intro

My bank, HSBC, offers an OFX (and QIF) download.  I want to play around with storing my transactions in a Google Spreadsheet.  This utility will convert the OFX to CSV and then I'm hoping to create a Google Spreadsheet Script that removes duplicates.

## Installation

- Make sure you either have Xcode installed, or the command line tools (https://github.com/kennethreitz/osx-gcc-installer)
- If you are only using the command line tools, then you need to switch the xcode path (`sudo xcode-select -switch /`)
- Make sure you also have bundler installed
- Then do `bundle install`
- That should be it

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - 2024-08-25

### Fixed

- [AssertionError from apprise.notify(title=str(title), body=str(body))](https://github.com/klept0/MS-Rewards-Farmer/issues)

## [1.0.0] - 2024-08-23

### Removed

- `apprise.urls` from [config.yaml](config.yaml)
  - This now lives in `config-private.yaml`, see [.template-config-private.yaml](.template-config-private.yaml) on how
    to configure
  - This prevents accidentally leaking sensitive information since `config-private.yaml` is .gitignore'd

### Added

- Support for automatic handling of logins with 2FA and for passwordless setups:
  - Passwordless login is supported in both visible and headless mode by displaying the code that the user has to select
    on their phone in the terminal window
  - 2FA login with TOTPs is supported in both visible and headless mode by allowing the user to provide their TOTP key
    in `accounts.json` which automatically generates the one time password
  - 2FA login with device-based authentication is supported in theory, BUT doesn't currently work as the undetected
    chromedriver for some reason does not receive the confirmation signal after the user approves the login
- Completing quizzes started but not completed in previous runs
- Promotions/More activities
  - Find places to stay
  - How's the economy?
  - Who won?
  - Gaming time

### Changed

- Incomplete promotions Apprise notifications
  - How incomplete promotions are determined
  - Batched into single versus multiple notifications
- Full exception is sent via Apprise versus just error message

### Fixed

- Promotions/More activities
  - Too tired to cook tonight?
- [Last searches always timing out](https://github.com/klept0/MS-Rewards-Farmer/issues/172)
- [Quizzes don't complete](https://github.com/klept0/MS-Rewards-Farmer/issues)

## [0.2.1] - 2024-08-13

### Fixed

- [Fix ElementNotInteractableException](https://github.com/klept0/MS-Rewards-Farmer/pull/176)

## [0.2.0] - 2024-08-09

### Added

- Initial release of the Python script:
  - Generates a Task Scheduler XML file
  - Allows users to choose between Miniconda, Anaconda, and Local Python
  - Prompts users to input the name of their environment (if using Miniconda or Anaconda)
  - Uses the script directory as the output path
  - Default trigger time is set to 6:00 AM on a specified day, with instructions to modify settings after importing to
    Task Scheduler
  - Includes a batch file (`MS_reward.bat`) for automatic execution of the Python script

### Fixed

- [Error when trends fail to load](https://github.com/klept0/MS-Rewards-Farmer/issues/163)

## [0.1.0] - 2024-07-27

### Added

- New [config.yaml](config.yaml) options
  - `retries`
    - `base_delay_in_seconds`: how many seconds to delay
    - `max`: the max amount of retries to attempt
    - `strategy`: method to use when retrying, can be either:
      - `CONSTANT`: the default; a constant `base_delay_in_seconds` between attempts
      - `EXPONENTIAL`: an exponentially increasing `base_delay_in_seconds` between attempts
  - `apprise.summary`: configures how results are summarized via Apprise, can be either:
    - `ALWAYS`: the default, as it was before, how many points were gained and goal percentage if set
    - `ON_ERROR`: only sends email if for some reason there's remaining searches
    - `NEVER`: never send summary
- Apprise notification if activity isn't completed/completable
- Support for more activities
- New arguments (see [readme](README.md#launch-arguments) for details)
- Some useful JetBrains config
- More logging
- Config to make `requests` more reliable
- More checks for bug report
- Me, cal4, as a sponsoree

### Changed

- More reliable searches and closer to human behavior
- When logger is set to debug, doesn't include library code now
- Line endings to LF

### Removed

- Calls to close all Chrome processes

### Fixed

- [Error when executing script from .bat file](https://github.com/klept0/MS-Rewards-Farmer/issues/113)
- [\[BUG\] AttributeError: 'Browser' object has no attribute 'giveMeProxy'](https://github.com/klept0/MS-Rewards-Farmer/issues/115)
- [\[BUG\] driver.quit causing previous issue of hanging process with heavy load on cpu](https://github.com/klept0/MS-Rewards-Farmer/issues/136)
- Login
- Errors when [config.yaml](config.yaml) doesn't exist
- General reliability and maintainability fixes

## [0.0.0] - 2023-03-05

### Added

- Farmer and lots of other things, but gotta start a changelog somewhere!

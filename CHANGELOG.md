# Changelog

All notable changes to Pesha will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!---
The changes should be grouped using the following categories (in order of precedence):
- Added: for new features.
- Changed: for changes in existing functionality.
- Fixed: for any bug fixes.
- Deprecated: for soon-to-be removed features.
- Removed: for now removed features.
-->

[unreleased]: https://github.com/talal/ilm/compare/v0.4.0...HEAD

## [Unreleased]

## 0.4.0 - 2024-10-24

### Added

- `page-numbering-format` option so that end users can specify the numbering format pattern.
- Keywords to document metadata: author name, `curriculum vitae`, `cv`, `resume`.

### Changed

- Minimum required compiler version to 0.12.0.
- Decreased page margins by 1%.
- Decreased font size for experience time by 0.1em.

### Fixed

- Footer text not using correct styling for single page documents.

## 0.3.1 - 2024-04-17

### Added

- Example with profile picture.

### Changed

- Reduce top margin 14% -> 8.6% when profile picture is displayed in header.

## 0.3.0 - 2024-04-15

### Added

- Support for profile picture in the header.

## 0.2.0 - 2024-04-11

### Changed

- Paper size for template from `us-letter` to `a4`.
- Use _Libertinus Serif_ font, if available, otherwise fall back to _Linux Libertine_.
- Horizontal margin from 17% to 16%.

## 0.1.0 - 2024-03-23

Initial Release.

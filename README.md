# Ars Magica 5th Edition: Interchange Format <!-- omit in toc -->

[![CC BY-SA 4.0][cc-by-sa-shield]][cc-by-sa] [![License: GPL v3][gnu-gplv3-shield]][gnu-gplv3]

![Ars Magica 5th Open License Logo][arm5-open-license-logo]

This repository contains a JSON-based interchange format for the Ars Magica 5th Edition TTRPG, and associated
readers/writers. This format allows data transfer and communication between software built for the TTRPG, such as online
character sheets.

- [Project definition](#project-definition)
  - [Goals](#goals)
  - [Non-Goals](#non-goals)
- [Legal](#legal)
  - [Legal notice](#legal-notice)
  - [License](#license)

## Project definition

### Goals

The objectives of this project are, in order of priority:

1. Define an interchange format allowing data transfer between various tools regarding Ars Magica 5th Edition
2. Make the interchange format un-ambiguous, that is:
   1. There is only one way to represent data
   2. Upon reading data, there is only one way to understand it
3. Have the data format support as much as possible the elements of the Ars Magica 5th game to allow broad transfer
   between tools
4. Implement readers and writers for the format, as libraries, in code languages as useful to the community

### Non-Goals

The following goals, without limitation, are explicitly out-of-scope for this project (and in no particular order):

- Provide data in the defined format for import in tools supporting the format, e.g. data provided in canon source book

## Legal

### Legal notice

Based on the material for Ars Magica, ©1993–2024, licensed by Trident, Inc. d/b/a Atlas Games®, under [Creative Commons
Attribution-ShareAlike 4.0 International license 4.0][cc-by-sa] ("CC-BY-SA 4.0").

Ars Magica Open License Logo ©2024 Trident, Inc. The Ars Magica Open License Logo, Ars Magica, and Mythic Europe are
trademarks of Trident, Inc., and are used with permission.

Order of Hermes, Tremere, Doissetep, and Grimgroth are trademarks of Paradox Interactive AB and are used with
permission.

### License

This work is dual-licensed under:

- The [Creative Commons Attribution-ShareAlike 4.0 International License][cc-by-sa]
- The [GNU General Public License v3][gnu-gplv3], as a [CC-BY-SA 4.0 compatible license][cc-by-sa-compatible] per
  Creative Commons

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

[cc-by-sa]: https://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg
[cc-by-sa-compatible]: https://creativecommons.org/share-your-work/licensing-considerations/compatible-licenses/
[gnu-gplv3]: https://www.gnu.org/licenses/gpl-3.0.html
[gnu-gplv3-shield]: https://img.shields.io/badge/License-GPLv3-blue.svg
[arm5-open-license-logo]: https://atlas-games.com/atlas-cms/resources/styles/arm5openlicenselogo.png

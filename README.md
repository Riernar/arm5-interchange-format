# Ars Magica 5th Edition: Interchange Format <!-- omit in toc -->

[![CC BY-SA 4.0][cc-by-sa-shield]][cc-by-sa] [![License: GPL v3][gnu-gplv3-shield]][gnu-gplv3]

![Ars Magica 5th Open License Logo][arm5-open-license-logo]

This repository defines an interchange format for the Ars Magica 5th Edition TTRPG. This format allows data transfer and
inter-operability between softwares built for the Ars Magica 5h Edition, such as character builder, character sheets,
VTTs, game managers etc...

The format specification is implemented in libraries in various programming languages for use by software authors, to be
able to read and write the interchange format.

- [Project definition](#project-definition)
  - [Goals](#goals)
  - [Non-Goals](#non-goals)
- [Repository layout](#repository-layout)
- [Technologies](#technologies)
- [Legal](#legal)
  - [Legal notice](#legal-notice)
  - [License](#license)

## Project definition

### Goals

The objectives of this project are defined below, in order of priority. This means that a higher-priority goal has
precedence other a lower-priority one, should they be at odds

1. Define an interchange format allowing data transfer between various tools supporting Ars Magica 5th Edition, such as
   Virtual Tabletops (VTT), character builders, compendium, etc..
2. The data format support as much as possible the elements of the Ars Magica 5th game to allow broad transfer between
   tools.
3. Make the interchange format un-ambiguous, that is:

   1. There is only one way to represent data
   2. Upon reading data, there is only one way to understand it

4. Implement readers and writers for the format, as libraries, in programming languages useful to the community
5. Support backward and forward compatibility as much as possible:
   - **backward compatibility** Only major version change of the specification or schema may break backward
     compatibility. Reader libraries should provide conversion utilities from any previous major version to the latest
     version (ideally this is automatic when parsing data into structured language data)
   - **forward compatibility** The schema allows for additional keys not yet defined, so that older versions may accept
     data from newer version (from the same Major definition). Libraries are required to round-trip such data even if
     they do not support them. This allows an outdated library/schema version to use the subset of data it understands
     without hard errors.

### Non-Goals

The following goals, without limitation, are explicitly out-of-scope for this project (listed in no particular order):

- Enforce the rules of the game. We aim to support as much house-ruling as possible. Rule-enforcing could be built on
  top of the data format, but this is a non-goal for the data format.
- Provide data in the defined format for import in tools supporting the format, e.g. data provided in canon source books
  (i.e. a compendium). This must be possible to built on top of the data format (this is one of the envisioned usage)
  but it is not the goal of the data format to provide the data.

## Repository layout

- `specifications/`: definitions of the schema, each major version in a separate folder.
- `libraries/`: (TODO) contains the programming libraries with reader/writer capabilities, as described above. Each
  library has its own dedicated folder, named after the programming language used.

## Technologies

The schema is written in [`cuelang`][cuelang], a data language design to write such data schemas.

[cuelang]: https://cuelang.org/docs/

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

# Ars Magica 5th interchange format specification version 0 <!-- omit in toc -->

This document contains the specification of the Ars Magica 5th Edition interchange format, specification version `0.1`.
See [Versioning](../README.md#versioning) for more details on versioning.

## Table of Content

- [Table of Content](#table-of-content)
- [Definitions](#definitions)
- [Schema](#schema)
- [Design decisions](#design-decisions)
  - [Unknown keys \& forward compatibility](#unknown-keys--forward-compatibility)
  - [Tool-specific data](#tool-specific-data)
  - [Optional and required keys](#optional-and-required-keys)
- [Design questions](#design-questions)
  - [References](#references)
  - [ID](#id)
  - [Disjunctions types](#disjunctions-types)
  - [Computations](#computations)

## Definitions

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and
"OPTIONAL" in this document are to be interpreted as described in [RFC 2119][rfc-2119].

[rfc-2119]: https://www.rfc-editor.org/rfc/rfc2119

## Schema

This specification is partially written as a data schema in the [CUE][cuelang] language, defined in the `arm5/` folder
next to this document.

Should this document and the cue schema conflict, the cue schema takes precedence (though this is an error that needs
correcting).

[cuelang]: https://cuelang.org/

## Design decisions

List of design decisions that have been made following design questions.

### Unknown keys & forward compatibility

To support [forward-compatibility](../README.md#forward-compatibility), the data structures defined using cue's
[definitions][cuelang-definitions] are _open_, meaning they accept any keys, including unknown ones. In cue, this is
written by appending `...` at the end of the definition. This allows loading newer data in older specifications, though
with a loss of semantics.

The expected behaviors regarding those unknown keys are as follows:

- libraries and parsers MUST round-trip this data when reading then immediately writing the same structure
- a tool loading external data in the interchange format, followed by immediate re-export, SHOULD round-trip the data
  as-is: if the tool is used only to visualize the data, it should not change it
- If other data in the structure is edited using a tool, the tool MAY delete or modify in arbitrary ways the unsupported
  data. Tools MAY warn user and ask for confirmation before altering data. A single warning when the data is loaded is
  probably OK

[cuelang-definitions]: https://cuelang.org/docs/tour/types/definitions/

### Tool-specific data

To support use-cases not yet supported by the common interchange specification, we reserve a section in most structure
definition for tools-specific data. The data is a mapping (cue structure; JSON object; TOML table, ...) from tool name
to arbitrary data blob internally used by the tool.

This allows tools to export their entire internal data in teh interchange format and to reload from that export, even
when the interchange format is too constrained for this specific tool.

- libraries and parsers MUST round-trip this data when reading then immediately writing the same structure
- a tool loading data MAY ignore or delete this section, especially for other tools (typically because it is loading its
  own section into a richer data structure than the interchange format allows, and dropping the rest)
- If the entity represented by the structure is edited in a tool, it SHOULD delete this section (expect perhaps it's own
  entry). This specific tool likely does not know how to handle another tool internal data correctly
- Tools loading data MUST be prepared to deal with missing, incorrect, incoherent or nonsense data in their own private
  section (e.g. because the data was first edited in a third-party). This MUST NOT prevent loading the data, though the
  private data stored in the private entry MAY be dropped entirely, and the result of the load be equivalent to loading
  the same interchange format data without any tool-specific data. A warning to the user would be appropriate.

A goal of the interchange format is for this section to be useless. Realistically though, this lets tools leverage the
format even when lacking a structure, and demonstrate use-case and proposed new fields to evolve the interchange format
to cover more usages.

### Optional and required keys

In cue structure (JSON object, TOML tables, ...), keys may be required or optional. In the schema, all key MUST be
explicitly marked as required or optional using CUE's `?` and `!` markers, see [CUE struct syntax][cuelang-structs].

[cuelang-structs]: https://cuelang.org/docs/tour/types/structs/

## Design questions

Use-cases, edge-cases or generally any questions that needs be resolved by a decision, but hasn't been arbitrated yet.
This is a list of things under consideration for which no good answer has been found to date.

### References

It would be useful to be able to break cycle in a data export by allowing references to other entities in the export.
Should we use the path from the top-level object down to the entity? If so, this requires never using arrays. Should we
use an ID field?

### ID

Do we need a systematic `id` field in all structures to allow identification?

### Disjunctions types

CUE support [disjunction types][cuelang-disjunctions]: how should we use those? Generally, having a disjunction in data
structure types requires a if-guard before being able to use the data, which may make the happy-path of "just grab the
value" more verbose. On the other hand, this might force to handle all cases, and allow exhaustiveness checks from
compilers/type-checkers.

[cuelang-disjunctions]: https://cuelang.org/docs/tour/types/disjunctions/

### Computations

It is sometimes useful to store how a specific value was computed from the rest of the data. This is not always
available (e.g. template characters from the source books only have final values). How can we handle that?

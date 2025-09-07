# Interchange format specification <!-- omit in toc -->

This directory contains the specification for the Ars Magica 5th interchange format.

- [Definitions](#definitions)
- [Versioning](#versioning)
- [Compatibility](#compatibility)
  - [Backward compatibility](#backward-compatibility)
  - [Forward compatibility](#forward-compatibility)

## Definitions

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and
"OPTIONAL" in this document are to be interpreted as described in [RFC 2119][rfc-2119].

[rfc-2119]: https://www.rfc-editor.org/rfc/rfc2119

## Versioning

Versioning is based on [SemVer][semver]. The schema itself MUST exactly use the MAJOR and MINOR numbers. The PATCH
number is left for programming libraries versioning bug fixes (i.e. parser code not being compliant with the
`MAJOR.MINOR` specification they implement).

Each MAJOR version is defined in its own folder.

In line with SemVer, MAJOR version 0 is considered in development and unstable, and may break anything at any time,
without notice.

[semver]: https://semver.org/

## Compatibility

We expect the specification to evolve other time, and different tools to usually implement various versions of the
specification as update schedule differ between tools. To favor maximum compatibility between tools -- which is the
primary goal of the interchange format -- we strive for maximum compatibility.

### Backward compatibility

Only MAJOR version of the specification/schema MAY break backward compatibility. MINOR specification version MUST NOT
break backward compatibility, except for MAJOR version 0.

Backward compatibility is defined as follows:

A new specifications is _backward-compatible_ with a previous version if and only if any and all valid data under the
previous version is still valid under the new version, and may be parsed with a compliant parser implementing the old
version. The data semantics MUST NOT change to be backward-compliant, such that the same data has the same meaning under
both specification.

Reader libraries SHOULD provide conversion utilities from any previous major version to the latest version. This SHOULD
be automatic when parsing data into structured language data.

### Forward compatibility

Only MAJOR version version of the specification/schema MAY break forward compatibility. MINOR specification version MUST
NOT break forward compatibility, except for MAJOR version 0.

Forward compatibility is defined as follows: A new specification is _forward-compatible_ with a previous version if and
only if any and all valid data under the new version is still valid under the old specification. In the new version, new
data semantics MAY be added for data that previously had none, though existing data semantics MUST NOT change.

Reader libraries implementing an old specification MUST round-trip data from a newer, forward-compatible specification,
though they need not make that data accessible in a structured way.

Note that this is much harder to achieve that backward compatibility above, as we need dedicated mechanisms in the
previous version to account for unknown data. We strive to make this possible while designing the specifications.

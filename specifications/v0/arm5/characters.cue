package arm5

characters?: [character_id=string]: #Character

#Character: {
	player?:     string
	short_name?: string
	biography?:  #CharacterBiography
	attributes?: #CharacterAttributes
	age?: {
		current?:  int64
		apparent?: int64
	}
	decrepitude?: {
		score:  int64
		points: int64
	}
	warping?: {
		score:  int64
		points: int64
	}

	// Allow unsupported fields for tools that need to round-trip data we don't support
	custom?: #ToolsCustomFields

	// Allow undefined fields for forward compatibility of the parsers
	...
}

#CharacterBiography: {

	aliases?: [...string]
	description?: string
}

#CharacterAttributes: {
	characteristics?: #Characteristics
	size?:            int64
}

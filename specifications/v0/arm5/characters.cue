package arm5

characters?: [character_id=string]: #Character

#Character: {
	player?:     string
	short_name?: string

	infos?: #CharacterInfos

	aging?:             #CharacterAging
	warping?:           #CharacterWarping
	attributes?:        #CharacterAttributes
	virtues_and_flaws?: #CharacterVF

	// Allow unsupported fields for tools that need to round-trip data we don't support
	custom?: #ToolsCustomFields
	// Allow undefined fields for forward compatibility of the parsers
	...
}

#CharacterInfos: {
	names?: [...string]
	description?: string

	// Allow unsupported fields for tools that need to round-trip data we don't support
	custom?: #ToolsCustomFields

	// Allow undefined fields for forward compatibility of the parsers
	...
}

#CharacterAging: {
	current_age?:              int64
	apparent_age?:             int64
	total_decrepitude_points?: int64

	// Allow unsupported fields for tools that need to round-trip data we don't support
	custom?: #ToolsCustomFields
	// Allow undefined fields for forward compatibility of the parsers
	...
}

#CharacterWarping: {

	total_warping_points?: int64

	// Allow unsupported fields for tools that need to round-trip data we don't support
	custom?: #ToolsCustomFields
	// Allow undefined fields for forward compatibility of the parsers
	...
}

#CharacterAttributes: {
	characteristics?: #Characteristics
	size?:            int64
}

#CharacterVF: {
	virtues: [virtue_id=string]: #Virtue
	flaws: [flaw_id=string]:     #Flaw
}

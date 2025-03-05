package arm5

arm5: {
	characters?: [...#Character]
}

#Character: {
	player?:          string
	name?:            string
	characteristics?: #Characteristics
	size?: int64
	age?: {
		current?: int64
		apparent?: int64
	}
	decrepitude?: {
		score: int64
		points: int64
	}
	warping?: {
		score: int64
		points: int64
	}

	// Allow unsupported fields for tools that need to round-trip data we don't support
	// Format is custom: {"$TOOL_NAME": ...}
	// For instance, the Roll20 sheet might use
	// custom: {"roll20": ...}
	custom?: [string]: {...}

	// Allow undefined fields for forward compatibility of the parsers
	...
}

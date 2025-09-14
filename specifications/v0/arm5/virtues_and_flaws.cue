package arm5

virtues?: [virtue_id=string]: #Virtue
flaws?: [flaw_id=string]:     #Flaw

#Virtue: {
	name!:     string
	cost!:     #VFCost
	types!:    #VirtueTypes
	ruletext?: string

	// Allow unsupported fields for tools that need to round-trip data we don't support
	custom?: #ToolsCustomFields
	// Allow undefined fields for forward compatibility of the parsers
	...
}

#VFCost:
	{
		type!: "major"
		cost?: 3
	} |
	{
		type!: "minor"
		cost?: 1
	} |
	{
		type!: "free"
		cost?: 0
	} |
	{
		type!: "custom"
		name?: string
		cost!: uint8
	}

// One virtue may belong to several types, for instance Inoffensive to (Being) is both General and Hermetic
//   https://publish.obsidian.md/ars-magica-definitive-manuscript/04+Virtues+and+Flaws/Virtues/Inoffensive+to+(Beings)

#VirtueTypes: {
	child?:         bool | *false   // Protection from Disease (App p12)
	general?:       bool | *false   // Affinity with (Ability)
	hermetic?:      bool | *false   // Affinity with (Art)
	heroic?:        bool | *false   // Charmed Life (HoH:TL p104)
	mystery?:       bool | *false   // Arcadian Travel (HoH:MC p92)
	social_status?: bool | *false   // Hermetic Magus
	special?:       bool | *false   // The Gift
	supernatural?:  #Realm | *false // Dowsing
	tainted?:       bool | *false   // Amorphous (RoP:I p83)

	// TODO: force on of the field to be non-false
}

#Flaw: {
	name!:     string
	cost!:     #VFCost
	types!:    #FlawTypes
	ruletext?: string

	// Allow unsupported fields for tools that need to round-trip data we don't support
	custom?: #ToolsCustomFields
	// Allow undefined fields for forward compatibility of the parsers
	...
}

// One Flaw may belong to several types, for instance Visions is both Story and Supernatural

#FlawTypes: {
	child?:         bool | *false   // Infatuation, App 11
	general?:       bool | *false   // Blind
	hermetic?:      bool | *false   // Blatant Gift
	heroic?:        bool | *false   // Heroic Personality (HoH:TL p108)
	personality?:   bool | *false   // Ambitious
	social_status?: bool | *false   // Outlaw
	special?:       bool | *false   // (Astrological) Mutable (Flaw) (TMRE 37-38)
	story?:         bool | *false   // Abandoned Apprentice (App 12)
	supernatural?:  #Realm | *false // Age Quickly
	tainted?:       bool | *false   // False Power

	// TODO: force on of the field to be non-false
}

#Realm:
	{
		type!: "faerie"
	} |
	{
		type!: "magic"
	} |
	{
		type!: "infernal"
	} |
	{
		type!: "divine"
	} |
	{
		type!: "custom"
		name:  string
	}

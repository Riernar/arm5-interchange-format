package arm5

#Characteristics: #SentientCharacteristics | #AnimalCharacteristics | #IncorporealCharacteristics

#SentientCharacteristics: {
	// physical
	dexterity!: _Characteristic
	quickness!: _Characteristic
	stamina!:   _Characteristic
	strength!:  _Characteristic

	//mental
	communication!: _Characteristic
	intelligence!:  _Characteristic
	perception!:    _Characteristic
	presence!:      _Characteristic

	// Custom
	custom?: [string]: _Characteristic
}

#AnimalCharacteristics: {
	// physical
	dexterity!: _Characteristic
	quickness!: _Characteristic
	stamina!:   _Characteristic
	strength!:  _Characteristic

	//mental
	communication!: _Characteristic
	cunning!:       _Characteristic
	perception!:    _Characteristic
	presence!:      _Characteristic

	// Custom characteristics
	custom?: [string]: _Characteristic
}

#IncorporealCharacteristics: {
	// forbid physical characteristics by setting them to bottom, always incompatible
	// See https://cuelang.org/docs/tour/types/structs/
	dexterity?: _|_
	quickness?: _|_
	stamina?:   _|_
	strength?:  _|_

	//mental
	communication!: _Characteristic
	cunning!:       _Characteristic
	perception!:    _Characteristic
	presence!:      _Characteristic

	// Custom characteristics
	custom?: [string]: _Characteristic
}

_Characteristic: *0 | int64 | #SumInt64

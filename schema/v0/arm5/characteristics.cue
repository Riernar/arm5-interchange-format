package arm5

#Characteristics: #SentientCharacteristics | #AnimalCharacteristics

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

_Characteristic: int64 | *0
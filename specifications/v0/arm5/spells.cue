package arm5

#SpellBase: {
	name!: string

	technique!: #SpellTechnique
	technique_requisites?: [...#SpellTechnique]
	form: #SpellForm
	form_requisites?: [...#SpellForm]

	level?: int64 | "general"

	range!:    #SpellRange
	duration!: #SpellDuration
	target!:   #SpellTarget

	text?:  string
	source: #Source
}

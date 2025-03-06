package arm5

import ( "list"

	// Definitions for values that can be computed from others
)

#SumInt64: {
	// The terms to be summed together
	terms!: [...#SumInt64Term]
	// The value. Note we don't use ! or ?, this way CUE will compute it if missing. If present it must be consistent
	value: int64 & list.Sum([for term in terms {term.value}])
}

#SumInt64Term: {
	// The name of the element
	name!: string
	// How much it adds to the total sum. Left as a number
	value!: int64
	// Additional data specific to tools
	custom?: #ToolsCustomFields
}

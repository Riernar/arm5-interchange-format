package arm5

// Definition of custom values for when our schema doesn't support something that a tool does support

// Custom value not supported by the schema, wrapped in an object to make it easy to distinguish
#CustomString: {
	value!: string
}

// ToolsCustomFields is defined using CUE templates
// https://cuelang.org/docs/tour/types/templates/
// The template below can be read as a nested mapping: external key is the tool name
// (this allows several tools to cooperate/round-trip data) mapped to an object that is
// under the control of the specific tool
// {
//   "roll20": {
//      "key": value  // value can be anything
//   }
// }
// #ToolsCustomFields is an escape mechanism for when our schema does not yet support something
#ToolsCustomFields: [tool_name=string]: [key=string]: _

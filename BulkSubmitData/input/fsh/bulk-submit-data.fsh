Instance: bulk-submit-data
InstanceOf: OperationDefinition
Usage: #definition
Title: "Bulk Submit Data"
Description: "OperationDefinition for the Bulk Submit Data operation"
* name = "Bulk Submit Data"
* status = #draft
* kind = #operation
* extension[0].url          = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[0].valueInteger = 0
* extension[1].url          = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[1].valueCode    = #trial-use
* system = false
* type = true
* code = #submit-data
* description = "The bulk submit-data operation sends a bulk import request based on the data requirements of a FHIR Measure. This operation is modeled off the existing draft of the [Bulk Data Import Ping and Pull Approach](https://github.com/smart-on-fhir/bulk-import/blob/master/import-pnp.md)."

* instance = true
* resource[0] = #Measure

* parameter[+].name = #measureReport
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The measure report being submitted"
* parameter[=].type = #MeasureReport

* parameter[+].name = #exportUrl
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The absolute URL of the bulk export endpoint of a Data Provider"
* parameter[=].type = #url



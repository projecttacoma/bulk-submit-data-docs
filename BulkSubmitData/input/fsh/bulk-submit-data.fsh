Instance: Operation-measure-bulk-submit-data
InstanceOf: OperationDefinition
Usage: #definition
Title: "Bulk Submit Data"
Description: "OperationDefinition for the Bulk Submit Data operation"
* id = "measure-bulk-submit-data"
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
* description = "The bulk submit-data operation completes a bulk import request based on the data requirements of a FHIR Measure. As with standard [$submit-data requests](http://hl7.org/fhir/R4/operation-measure-submit-data.html), the submitted data must include one MeasureReport resource, and the requests are kicked off using the $submit-data endpoint. However, for a bulk submit-data request, the MeasureReport references the measure-of-interest by canonical URL. It is assumed that the data-of-interest for the measure-of-interest is already stored on the server. If the “prefer”: “respond-async” request header is provided, the data requirements will be retrieved for the measure-of-interest, and a modified bulk import request will kick off using the $import endpoint to import the data that fulfills the data requirements. 

Required header(s):
```
'prefer': 'respond-async'
```
"
* comment = "The expected responses from the bulk submit-data operation match the expected responses for the standard [bulk import operation](https://github.com/smart-on-fhir/bulk-import/blob/master/import-pnp.md)."
* instance = true
* resource[0] = #Measure

* parameter[+].name = #measureReport
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The measure report being submitted, which references the measure-of-interest by canonical URL"
* parameter[=].type = #MeasureReport

* parameter[+].name = #exportUrl
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The absolute URL of the bulk export endpoint of a bulk export server"
* parameter[=].type = #url



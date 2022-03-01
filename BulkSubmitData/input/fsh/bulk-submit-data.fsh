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
* description = """
The bulk submit-data operation sends a bulk import request based on the data requirements of a FHIR Measure. This operation is modeled off the existing draft of the [Bulk Data Import Ping and Pull Approach](https://github.com/smart-on-fhir/bulk-import/blob/master/import-pnp.md).

## Operation Request Body
The request body for this operation is a [FHIR Parameters Resource](https://www.hl7.org/fhir/parameters.html). The body SHALL include a FHIR MeasureReport Resource of type “data-collection” that references a measure by canonical URL. Additionally, the FHIR Parameters resource SHALL include the URL of a Data Provider, as defined in the [Bulk Data Import Ping and Pull Approach](https://github.com/smart-on-fhir/bulk-import/blob/master/import-pnp.md#bulk-data-import-kick-off-request-ping-from-data-provider-to-data-consumer). The Data Provider SHALL support `$export`. It is assumed that the data-of-interest for the measure referenced in the MeasureReport lives on the Data Provider server.

### Request Flow
The  Data Consumer server SHALL support invocation of the bulk submit-data operation using the [FHIR Asynchronous Request Pattern](http://hl7.org/fhir/async.html) via a POST request containing the FHIR Parameters Resource described above. As with the [standard $submit-data operation](http://hl7.org/fhir/R4/operation-measure-submit-data.html), the bulk submit-data operation will send a POST request to the `$submit-data` endpoint. 

When kicking off the request, if the `“prefer”: “respond-async”` header is provided, the bulk submit-data operation will calculate the data requirements for the measure-of-interest. The Data Consumer will kick off an `$export` request to the Data Provider. Then, the data exported from the Data Provider is uploaded to the system.

Required header(s):
```
"prefer": "respond-async"
```

### Examples

Request: Submit data of interest for FHIR Measure with "testMeasure" identifier from the Data Provider http://example.com/

```
POST [base]/Measure/testMeasure/$submit-data
{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "exportUrl",
      "valueUrl": "http://example.com/$export"
    },
    {
      "name": "measureReport",
      "resource": {
        "resourceType": "MeasureReport",
        "id": "measurereport-testMeasure",
        "measure": "http://example.com/Measure/testMeasure"
      }
    }
  ]
}
```

Response:
```
HTTP/1.1 200 OK
```
"""

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



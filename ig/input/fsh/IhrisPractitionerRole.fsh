Profile:        IhrisPractitionerRole
Parent:         PractitionerRole
Id:             ihris-practitioner-role
Title:          "Employment information "
Description:    "iHRIS profile of Practitioner Role."

* identifier 0..0
* active 1..1 MS
* active ^label = "Status"
* period 1..1 MS
* period ^label = "Period of Employment"
* period ^constraint[0].key = "ihris-period-start-end"
* period ^constraint[0].severity = #error
* period ^constraint[0].human = "The end date must be after the start date"
* period ^constraint[0].expression = "end.empty() or end = '' or end >= start"
* period.start 1..1 MS
* period.start ^label = "Start Date"
* period.start ^minValueDateTime = "1950-01-01"
* period.start ^maxValueDateTime = "2030-01-01"
* period.end 0..1 MS
* period.end ^label = "End Date"
* period.end ^minValueDateTime = "1950-01-01"
* period.end ^maxValueDateTime = "2030-01-01"
* practitioner 0..1 MS
* practitioner ^label = "Health Worker"
* code 1..1 MS
* code ^label = "Job"
* code from http://ihris.org/fhir/ValueSet/ihris-job
* code.coding 1..1 MS
* code.coding ^label = "Job"
* specialty 0..0
* location 1..1 MS 
* location ^label = "Current Employer/Facility"
* location only Reference(http://ihe.net/fhir/StructureDefinition/IHE.mCSD.FacilityLocation)
* extension contains
    IhrisPractitionerRoleFirstEmploymentDate named firstEmploymentDate 1..1 MS and
    IhrisPractitionerRoleCadre named cadre 1..1 MS and
    IhrisPractitionerRoleCategory named category 1..1 MS and
    IhrisPractitionerRoleWorkingHours named workingHours 1..1 MS /*and 
    IhrisPractitionerRoleEmploymentStatus named employmentStatus 1..1 MS*/
* extension[firstEmploymentDate].valueDate 1..1 MS
* extension[firstEmploymentDate].valueDate ^label = "First Employment Date"
* extension[cadre].valueCoding 1..1 MS
* extension[cadre].valueCoding ^label = "Cadre"
* extension[category].valueCoding 1..1 MS
* extension[category].valueCoding ^label = "Occupational Category"
* extension[workingHours].valueDecimal 1..1 MS
* extension[workingHours].valueDecimal ^label = "Working Hours"
/* extension[employmentStatus].valueBoolean 1..1 MS*/

Extension:      IhrisPractitionerRoleFirstEmploymentDate
Id:             ihris-practitioner-role-first-employment-date
Title:          "First Employment Date"
Description:    "IHRIS PractitionerRole Extension First Employment Date"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only date
* valueDate 1..1 MS
* valueDate ^label = "First Employment Date"
* valueDate ^minValueDateTime = "1950-01-01"
* valueDate ^maxValueDateTime = "2030-01-01"

Extension:     IhrisPractitionerRoleCadre
Id:            ihris-practitioner-role-cadre
Title:         "Cadre"
Description:   "IHRIS PractitionerRole Extension Cadre"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Cadre"
* valueCoding from http://ihris.org/fhir/ValueSet/ihris-cadre (required)

Extension:    IhrisPractitionerRoleCategory
Id:           ihris-practitioner-role-category
Title:        "Category"
Description:  "IHRIS PractitionerRole Extension Category"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Occupational Category"
* valueCoding from http://ihris.org/fhir/ValueSet/ihris-classification (required)

Extension:   IhrisPractitionerRoleWorkingHours
Id:          ihris-practitioner-role-working-hours
Title:       "Working Hours"
Description: "IHRIS PractitionerRole Extension Working Hours"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only decimal
* valueDecimal 1..1 MS
* valueDecimal ^label = "Working Hours"

/*Extension:  IhrisPractitionerRoleEmploymentStatus
Id:         ihris-practitioner-role-employment-status
Title:      "Employment Status"
Description: "IHRIS PractitionerRole Extension Employment Status"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only boolean
* valueBoolean 1..1 MS
* valueBoolean ^label = "Employment Status"*/

Instance:       ihris-page-practitionerrole
InstanceOf:     IhrisPage
Title:          "iHRIS PractitionerRole Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-practitioner-role)
* extension[display].extension[link].extension[field].valueString = "PractitionerRole.practitioner.reference"
* extension[display].extension[link].extension[text].valueString = "View Practitioner"
* extension[display].extension[link].extension[button].valueBoolean = true
* extension[display].extension[link].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Job|PractitionerRole.code[0].coding[0]"
* extension[display].extension[search][1].valueString = "Start Date|PractitionerRole.period.start"
* extension[display].extension[search][2].valueString = "Practitioner|PractitionerRole.practitioner"
* extension[display].extension[search][3].valueString = "Facility|PractitionerRole.location"
* extension[display].extension[search][4].valueString = "Employee Status|PractitionerRole.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-employment-status').valueCoding.display"
* extension[display].extension[filter][0].valueString = "Job|role|http://ihris.org/fhir/ValueSet/ihris-job"
* extension[display].extension[filter][1].valueString = "Facility|location"
* extension[display].extension[filter][2].valueString = "Employee Status|employmentstatus|http://ihris.org/fhir/ValueSet/ihris-employment-status-valueset"
* extension[display].extension[filter][3].valueString = "Position Status|positionstatus|http://ihris.org/fhir/ValueSet/ihris-position-status"
* extension[section][0].extension[title].valueString = "Employment Information"
* extension[section][0].extension[description].valueString = "Employment Information"
* extension[section][0].extension[name].valueString = "PractitionerRole"
* extension[section][0].extension[field][0].valueString = "PractitionerRole.code"
* extension[section][0].extension[field][1].valueString = "PractitionerRole.practitioner"
* extension[section][0].extension[field][2].valueString = "PractitionerRole.location"
* extension[section][0].extension[field][3].valueString = "PractitionerRole.period"
* extension[section][0].extension[field][4].valueString = "PractitionerRole.extension:firstEmploymentDate.value[x]:valueDate"
* extension[section][0].extension[field][5].valueString = "PractitionerRole.extension:cadre.value[x]:valueCoding"
* extension[section][0].extension[field][6].valueString = "PractitionerRole.extension:category.value[x]:valueCoding"
* extension[section][0].extension[field][7].valueString = "PractitionerRole.extension:workingHours.value[x]:valueDecimal"
* extension[section][0].extension[field][8].valueString = "PractitionerRole.extension:employmentStatus.value[x]:valueBoolean"
* extension[section][0].extension[field][9].valueString = "PractitionerRole.active"

Instance:       ihris-page-job
InstanceOf:     IhrisPage
Title:          "iHRIS Job CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-job)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[search][2].valueString = "Cadre|cadre"
* extension[display].extension[search][3].valueString = "Classification|classification"
* extension[section][0].extension[title].valueString = "Job"
* extension[section][0].extension[description].valueString = "Job Titles"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.code"
* extension[section][0].extension[field][1].valueString = "CodeSystem.definition"
* extension[section][0].extension[field][2].valueString = "CodeSystem.display"
* extension[section][0].extension[field][3].valueString = "CodeSystem.cadre"
* extension[section][0].extension[field][4].valueString = "CodeSystem.classification"
* extension[section][0].extension[field][4].valueString = "CodeSystem.salary-grade"
 
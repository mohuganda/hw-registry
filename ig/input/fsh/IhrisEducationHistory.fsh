Profile:        IhrisBasicEducationHistory
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-education-history
Title:          "Education Details"
Description:    "iHRIS Profile of the Basic resource for Education Details."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisEducationHistory named educationHistory 1..1 MS
* extension[educationHistory].extension[primary].valueString 1..1 MS
* extension[educationHistory].extension[olevel].valueString 0..1 MS
* extension[educationHistory].extension[alevel].valueString 1..1 MS
* extension[educationHistory].extension[tertiary].valueString 0..1 MS
* extension[educationHistory].extension[second_tertiary].valueString 0..1 MS
* extension[educationHistory].extension[other_cert].valueString MS
* extension[educationHistory].extension[speciality].valueString 0..1 MS

    
Extension:      IhrisEducationHistory
Id:             ihris-education-history
Title:          "Education details"
* extension contains
      primary 1..1 MS and
      olevel 0..1 MS and
      alevel 1..1 MS and
      tertiary 0..1 MS and
      second_tertiary 0..1 MS and
      other_cert 0..* MS and
      speciality 0..1 MS
* extension[primary].value[x] only string
* extension[primary].valueString 1..1 MS
* extension[primary].valueString ^label = "Primary education"
* extension[olevel].value[x] only string
* extension[olevel].valueString 0..1 MS
* extension[olevel].valueString ^label = "Lower secondary (O-level)"
* extension[alevel].value[x] only string
* extension[alevel].valueString 0..1 MS
* extension[alevel].valueString ^label = "Upper secondary (A-Level)"
* extension[tertiary].value[x] only string
* extension[tertiary].valueString 0..1 MS
* extension[tertiary].valueString ^label = "Tertiary education"
* extension[second_tertiary].value[x] only string
* extension[second_tertiary].valueString 0..1 MS
* extension[second_tertiary].valueString ^label = "Second stage of tertiary education"
* extension[other_cert].value[x] only string
* extension[other_cert].valueString 0..1 MS
* extension[other_cert].valueString ^label = "Other certification and fellowships "
* extension[speciality].value[x] only string
* extension[speciality].valueString 0..1 MS
* extension[speciality].valueString ^label = "Speciality of health worker"

/*Instance:       IhrisPractitionerWorkflowEducationHistory
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Education Detail Workflow"
* description = "iHRIS workflow to record a Education History"
* id = "ihris-education-history"
* url = "http://ihris.org/fhir/Questionnaire/ihris-education-history"
* name = "ihris-education-history"
* status = #active
* date = 2020-08-27
* purpose = "Workflow page for recording a Education Detailss information."

* item[0].linkId = "Basic"
* item[0].text = "Education Details"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].text = "Primary education"
* item[0].item[0].type = #string
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[1].text = "Lower secondary (O-level)"
* item[0].item[1].type = #string
* item[0].item[1].required = true
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[2].text = "Upper secondary (A-Level)"
* item[0].item[2].type = #string
* item[0].item[2].required = true
* item[0].item[2].repeats = false

* item[0].item[3].linkId = "Basic.extension[0].extension[3]"
* item[0].item[3].text = "Tertiary education"
* item[0].item[3].type = #string 
* item[0].item[3].required = false
* item[0].item[3].repeats = false

* item[0].item[4].linkId = "Basic.extension[0].extension[4]"
* item[0].item[4].text = "Second stage of tertiary education"
* item[0].item[4].type = #string
* item[0].item[4].required = false
* item[0].item[4].repeats = false

* item[0].item[5].linkId = "Basic.extension[0].extension[5]"
* item[0].item[5].text = "Other certification and fellowships"
* item[0].item[5].type = #string
* item[0].item[5].required = false
* item[0].item[5].repeats = false

* item[0].item[6].linkId = "Basic.extension[0].extension[6]"
* item[0].item[6].text = "Speciality of health worker"
* item[0].item[6].type = #string
* item[0].item[6].required = false
* item[0].item[6].repeats = false*/

Instance:       ihris-page-basic-education-history
InstanceOf:     IhrisPage
Title:          "Education Details"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-education-history)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[link][1].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][1].extension[text].valueString = "Add Another"
* extension[display].extension[link][1].extension[button].valueBoolean = true
* extension[display].extension[link][1].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][1].extension[url].valueUrl = "/resource/add/practitioner?practitioner=FIELD"
* extension[display].extension[search][0].valueString = "Primary education|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='primary').valueString"
* extension[display].extension[search][1].valueString = "O-level|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='olevel').valueString"
* extension[display].extension[search][2].valueString = "A-Level|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='alevel').valueString"
* extension[display].extension[search][3].valueString = "Tertiary|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='tertiary').valueString"
* extension[display].extension[search][4].valueString = "Second Tertiary|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='second_tertiary').valueString"
* extension[display].extension[search][5].valueString = "Speciality|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='speciality').valueString"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Education History"
* extension[section][0].extension[description].valueString = "Education History details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:educationHistory"

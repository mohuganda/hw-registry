Profile:        IhrisBasicProfessional
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-professional
Title:          "Professional License and Certification"
Description:    "iHRIS Profile of the Basic resource for Professional."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisProfessional named professional 0..1 MS
* extension[professional].extension[registrationStatus].valueCoding MS
* extension[professional].extension[registrationStatus].valueCoding ^label = "Registration Status"
* extension[professional].extension[certification].valueString MS
* extension[professional].extension[certification].valueString ^label = "Certificate Name"
* extension[professional].extension[license_number].valueString ^label = "License Number"
* extension[professional].extension[license_number].valueString MS
* extension[professional].extension[issue_date].valueDate ^label = "Issue Date"
* extension[professional].extension[issue_date].valueDate MS
* extension[professional].extension[expiry_date].valueDate ^label = "Expiry Date"
* extension[professional].extension[expiry_date].valueDate MS
* extension[professional].extension[license_status].valueCoding ^label = "License status"
* extension[professional].extension[license_status].valueCoding MS
    
Extension:      IhrisProfessional
Id:             ihris-professional
Title:          "Professional License and Certification"
* extension contains
      registrationStatus 1..1 MS and
      certification 0..1 MS and
      license_number 0..1 MS and
      issue_date 0..1 MS and
      expiry_date 0..1 MS and
      license_status 0..1 MS
* extension[registrationStatus].value[x] only Coding
* extension[registrationStatus].valueCoding ^label = "Registration Status"
* extension[registrationStatus].valueCoding from IhrisStatusValueSet (required)
* extension[certification].value[x] only string
* extension[certification].valueString ^label = "Certificate Name"
* extension[license_number].value[x] only string
* extension[license_number].valueString ^label = "License Number"
* extension[issue_date].value[x] only date
* extension[issue_date].valueDate ^label = "Issue Date"
* extension[expiry_date].value[x] only date
* extension[expiry_date].valueDate ^label = "Expiry Date"
* extension[license_status].value[x] only Coding
* extension[license_status].valueCoding ^label = "License Status"
* extension[license_status].valueCoding from IhrisStatusValueSet (required)

CodeSystem:      IhrisStatusCodesystem
Id:              ihris-status-codesystem
Title:           "Status Codesystem"
* ^date = "2020-12-04T08:41:04.362Z"
* ^version = "0.2.0"
* #Active "Active"
* #Student "Student"
* #Suspended "Suspended"
* #Terminated "Terminated"
* #Nullified "Nullified"
* #Pending "Pending"
* #Inactive "Inactive"
* #Expired "Expired"

ValueSet:         IhrisStatusValueSet
Id:               ihris-status-valueset
Title:            "Status Codes"
* ^date = "2020-12-04T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisStatusCodesystem


Instance:       ihris-page-professional
InstanceOf:     IhrisPage
Title:          "Professional License and Certification Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-professional)
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
* extension[display].extension[search][0].valueString = "Health Worker|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[search][1].valueString = "Registration Status|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-professional').extension.where(url='registrationStatus').valueCoding.display"
* extension[display].extension[search][2].valueString = "Certificate Name|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-professional').extension.where(url='certification').valueString"
* extension[display].extension[search][3].valueString = "License Number|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-professional').extension.where(url='license_number').valueString"
* extension[display].extension[search][4].valueString = "License Status|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-professional').extension.where(url='license_status').valueCoding.display"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Professional License and Certification"
* extension[section][0].extension[description].valueString = "Professional License and Certification details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:professional"

Instance:       ihris-page-status
InstanceOf:     IhrisPage
Title:          "iHRIS status CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-status-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Profession"
* extension[section][0].extension[description].valueString = "Profession"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Invariant:      ihris-age-18
Description:    "birthDate must be more than 18 years ago."
Expression:     "birthDate < today() - 18 years"
Severity:       #error

Profile:        IhrisPractitioner
Parent:         Practitioner
Id:             ihris-practitioner
Title:          "iHRIS Practitioner"
Description:    "iHRIS profile of Practitioner."
* identifier 0..* MS
* identifier ^label = "Identifier"
* identifier ^constraint[0].key = "ihris-search-identifier"
* identifier ^constraint[0].severity = #error
* identifier ^constraint[0].expression = "'Practitioner' | 'identifier' | iif(system.exists(), system & '|' & value, value)"
* identifier ^constraint[0].human = "The identifier must be unique and another record has this identifier"
* identifier.use MS
* identifier.use ^label = "Use"
* identifier.type MS
* identifier.type ^label = "Type"
* identifier.type.coding 1..1 MS
* identifier.type.coding ^label = "Type"
* identifier.system MS
* identifier.system ^label = "System"
* identifier.value MS
* identifier.value ^label = "Value"
* identifier.extension contains
    IhrisPractitionerDateofIssue named date 0..1 MS and
    IhrisPractitionerCountryofIssue named country 0..1 MS
* identifier.extension[date] MS
* identifier.extension[date] ^label = "Date of Issue"
* identifier.extension[date].valueDate MS
* identifier.extension[country] MS
* identifier.extension[country] ^label = "Country of Issuance"
* identifier.extension[country].valueCoding MS
* name 1..* MS
* name ^label = "Name"
* name.use MS
* name.use ^label = "Use"
* name.family 1..1 MS
* name.family ^label = "Surname"
* name.family ^constraint[0].key = "ihris-name-check"
* name.family ^constraint[0].severity = #error
* name.family ^constraint[0].expression = "matches('^[A-Za-z ]*$')"
* name.family ^constraint[0].human = "Name must be only text."
* name.given 1..* MS
* name.given ^label = "First Name "
* name.given ^constraint[0].key = "ihris-name-check"
* name.given ^constraint[0].severity = #error
* name.given ^constraint[0].expression = "matches('^[A-Za-z ]*$')"
* name.given ^constraint[0].human = "Name must be only text."
* name.prefix MS
* name.prefix ^label = "Prefix"
* name.suffix MS
* name.suffix ^label = "Suffix"
* telecom 0..* MS
* telecom ^label = "Telecom"
* telecom.system MS
* telecom.system ^label = "Contact Type"
* telecom.use MS
* telecom.use ^label = "Use"
* telecom.value MS
* telecom.value ^label = "Value"
* telecom ^constraint[0].key = "ihris-search-phone"
* telecom ^constraint[0].severity = #error
* telecom ^constraint[0].expression = "'Practitioner' | 'phonenumber' | iif(value.exists(), system & '|' & value, value)"
* telecom ^constraint[0].human = "The Phone number must be unique and another record has this Phone Number"
* address 0..0
* gender 1..1 MS
* gender ^label = "Gender"
* birthDate MS
* birthDate ^label = "Birth Date"
* birthDate obeys ihris-age-18
* birthDate ^minValueQuantity.system = "http://unitsofmeasure.org/"
* birthDate ^minValueQuantity.code = #a
* birthDate ^minValueQuantity.value = 100
* birthDate ^maxValueQuantity.system = "http://unitsofmeasure.org/"
* birthDate ^maxValueQuantity.code = #a
* birthDate ^maxValueQuantity.value = -18
* photo 0..1 MS
* photo ^label = "Photo"
* communication 0..* MS
* communication ^label = "Communication"
* communication.coding 1..1 MS
* communication.coding ^label = "Language"
* communication.extension contains
    IhrisPractitionerLanguageProficiency named proficiency 0..* MS
* communication.extension[proficiency] MS
* communication.extension[proficiency] ^label = "Language Proficiency"
* communication.extension[proficiency].extension[type].valueCoding MS
* extension contains
    IhrisPractitionerAddress named address 0..1 MS and
    IhrisPractitionerNationality named nationality 0..1 MS and
    IhrisPractitionerMaritalStatus named maritalStatus 0..1 MS and
    IhrisPractitionerFather named father 0..1 MS and
    IhrisPractitionerMother named mother 0..1 MS and
    IhrisPractitionerBirthPlace named birthPlace 0..1 MS and
    /*IhrisPractitionerEmail named email 0..* MS and
    IhrisPractitionerPhone named phone 0..* MS and*/
    IhrisPractitionerEmergency named emergency 0..1 MS
* extension[address].valueReference MS
* extension[address].valueReference ^label = "Address"
* extension[nationality].valueCoding MS
* extension[nationality].valueCoding ^label = "Nationality"
* extension[maritalStatus].valueCoding MS
* extension[maritalStatus].valueCoding ^label = "Marital Status"
* extension[father].valueString MS
* extension[father].valueString ^label = "Father's Name"
* extension[mother].valueString MS
* extension[mother].valueString ^label = "Mother's Name"
* extension[birthPlace].valueReference MS
* extension[birthPlace].valueReference ^label = "Birth Place"
* extension[emergency] ^label = "Emergency Contact"
* extension[emergency] MS
* extension[emergency].extension[name].valueString MS
* extension[emergency].extension[phone].valueString MS
* extension[emergency].extension[email].valueString MS

Extension:      IhrisPractitionerLanguageProficiency
Id:             ihris-practitioner-language-proficiency
Title:          "iHRIS Practitioner Language Proficiency"
Description:    "iHRIS extension for Practitioner Language Proficiency."
* ^context.type = #element
* ^context.expression = "Practitioner"
* extension contains
    type 0..* MS
* extension[type] ^label = "Proficiency Type"
* extension[type].value[x] only Coding
* extension[type].valueCoding 0..1 MS
* extension[type].valueCoding ^label = "Proficiency Type"
* extension[type].valueCoding from http://terminology.hl7.org/ValueSet/v3-LanguageAbilityMode

Extension:      IhrisPractitionerAddress
Id:             ihris-practitioner-address
Title:          "iHRIS Practitioner address"
Description:    "iHRIS extension for Practitioner address."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Reference
* valueReference 1..1 MS
* valueReference ^label = "Current Address"
* valueReference ^constraint[0].key = "ihris-location-address"
* valueReference ^constraint[0].severity = #warning
* valueReference ^constraint[0].expression = "reference.matches('^Location/')"
* valueReference ^constraint[0].human = "Must be a location"
* valueReference only Reference(Location)
* valueReference.reference 1..1 MS
* valueReference.reference ^label = "Location"
* valueReference.type 0..0
* valueReference.identifier 0..0
* valueReference.display 0..0

Extension:      IhrisPractitionerDateofIssue
Id:             ihris-practitioner-dateofissue
Title:          "iHRIS Practitioner Date of Issue"
Description:    "iHRIS extension for Practitioner date of issue."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only date
* valueDate 1..1 MS
* valueDate ^label = "Date of Issue"

Extension:      IhrisPractitionerCountryofIssue
Id:             ihris-practitioner-countryofissue
Title:          "iHRIS Practitioner Country of Issue"
Description:    "iHRIS extension for Practitioner Country of Issue."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Country of Issue"

Extension:      IhrisPractitionerFather
Id:             ihris-practitioner-father
Title:          "iHRIS Practitioner Father Detail"
Description:    "iHRIS extension for Practitioner Father Detail."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "Father's Name"

Extension:      IhrisPractitionerMother
Id:             ihris-practitioner-mother
Title:          "iHRIS Practitioner mother Detail"
Description:    "iHRIS extension for Practitioner Mother's Detail."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "Mother's Name"

Extension:      IhrisPractitionerNationality
Id:             ihris-practitioner-nationality
Title:          "iHRIS Practitioner Nationality"
Description:    "iHRIS extension for Practitioner nationality."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Nationality"
* valueCoding from http://hl7.org/fhir/ValueSet/iso3166-1-2 (required)

Extension:      IhrisPractitionerBirthPlace
Id:             ihris-practitioner-birthPlace
Title:          "iHRIS Practitioner Birth Place"
Description:    "iHRIS extension for Birth Place ."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Reference
* valueReference 1..1 MS
* valueReference ^label = "Birth Place (District, Sub county, parish and village)"
* valueReference ^constraint[0].key = "ihris-location-residence"
* valueReference ^constraint[0].severity = #warning
* valueReference ^constraint[0].expression = "reference.matches('^Location/')"
* valueReference ^constraint[0].human = "Must be a location"
* valueReference only Reference(IhrisJurisdiction)
* valueReference.reference 1..1 MS
* valueReference.reference ^label = "Location"
* valueReference.type 0..0
* valueReference.identifier 0..0
* valueReference.display 0..0

Extension:      IhrisPractitionerEmergency
Id:             ihris-practitioner-emergency
Title:          "iHRIS Practitioner Emergency"
Description:    "iHRIS extension for Practitioner Emergency."
* ^context.type = #element
* ^context.expression = "Practitioner"
* extension contains name 0..1 MS and
    phone 0..1 MS and
    email 0..1 MS 
* extension[name].value[x] only string
* extension[name].valueString 0..1 MS
* extension[name].valueString ^label = "Emergency Contact's Name"
* extension[name].valueString ^constraint[0].key = "ihris-name-check"
* extension[name].valueString ^constraint[0].severity = #error
* extension[name].valueString ^constraint[0].expression = "matches('^[A-Za-z ]*$')"
* extension[name].valueString ^constraint[0].human = "Name must be only text."
* extension[phone].value[x] only string
* extension[phone].valueString 0..1 MS
* extension[phone].valueString ^label = "Emergency Contact's Phone number"
* extension[phone].valueString ^constraint[0].key = "ihris-phone-check"
* extension[phone].valueString ^constraint[0].severity = #error
* extension[phone].valueString ^constraint[0].expression = "matches('^$|^(([+][2][5][6][7][0-9]{8})|([0][7][0-9]{8}))')"
* extension[phone].valueString ^constraint[0].human = "Phone Number is not properly formatted."
* extension[email].value[x] only string
* extension[email].valueString 0..1 MS
* extension[email].valueString ^label = "Emergency Contact's Phone number"
* extension[email].valueString ^constraint[0].key = "ihris-email-check"
* extension[email].valueString ^constraint[0].severity = #error
* extension[email].valueString ^constraint[0].expression = "matches('^$|^([0-9a-zA-Z_.]+@([0-9a-zA-Z]+[.])+[a-zA-Z]{2,4}$)')"
* extension[email].valueString ^constraint[0].human = "Work Email is not properly formatted."

Extension:      IhrisPractitionerMaritalStatus
Id:             ihris-practitioner-marital-status
Title:          "iHRIS Practitioner Marital Status"
Description:    "iHRIS extension for Practitioner marital status."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Marital Status"
* valueCoding from http://hl7.org/fhir/ValueSet/marital-status (required)

CodeSystem:      IhrisRelationCodesystem
Id:              ihris-relation-codesystem
Title:           "Relationship"
* ^date = "2020-10-29T08:41:04.362Z"
* ^version = "0.2.0"
* #spouse "Spouse" "Spouse"
* #mother "Mother" "Mother"
* #father "Father" "Father"
* #other "other" "other"

ValueSet:         IhrisRelationValueSet
Id:               ihris-relation-valueset
Title:            "iHRIS Relationship ValueSet"
* ^date = "2020-10-29T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisRelationCodesystem

Extension:      IhrisPractitionerPhone
Id:             ihris-personal-information-phone
Title:          "iHRIS Personal Information phone"
Description:    "iHRIS extension for Phone."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only string
* valueString ^label = "Phone Number"
* valueString 0..1 MS
* valueString ^constraint[0].key = "ihris-phone-check"
* valueString ^constraint[0].severity = #error
* valueString ^constraint[0].expression = "matches('^$|^(([+][2][5][6][7][0-9]{8})|([0][7][0-9]{8}))')"
* valueString ^constraint[0].human = "Phone Number is not properly formatted."

Extension:      IhrisPractitionerEmail
Id:             ihris-personal-information-email
Title:          "iHRIS Personal Information email"
Description:    "iHRIS extension for Email."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only string
* valueString ^label = "Email"
* valueString 0..1 MS
* valueString ^constraint[0].key = "ihris-email-check"
* valueString ^constraint[0].severity = #error
* valueString ^constraint[0].expression = "matches('^$|^([0-9a-zA-Z_.]+@([0-9a-zA-Z]+[.])+[a-zA-Z]{2,4}$)')"
* valueString ^constraint[0].human = "Work Email is not properly formatted."

/*Instance:       IhrisPractitionerQuestionnaire
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Practitioner Questionnaire"
* description = "iHRIS Practitioner initial data entry questionnaire."
* id = "ihris-practitioner"
* url = "http://ihris.org/fhir/Questionnaire/ihris-practitioner"
* name = "ihris-practitioner"
* status = #active
* date = 2020-06-22
* purpose = "Data entry page for practitioners."

* item[0].linkId = "Practitioner"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner"
* item[0].text = "Health Worker|Primary demographic details"
* item[0].type = #group

* item[0].item[0].linkId = "Practitioner.name[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name"
* item[0].item[0].text = "Name"
* item[0].item[0].type = #group

* item[0].item[0].item[0].linkId = "Practitioner.name[0].use"
* item[0].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name.use"
* item[0].item[0].item[0].text = "Name Usage"
* item[0].item[0].item[0].type = #choice
* item[0].item[0].item[0].required = true
* item[0].item[0].item[0].repeats = false
* item[0].item[0].item[0].readOnly = true
* item[0].item[0].item[0].answerOption.valueCoding = http://hl7.org/fhir/name-use#official
* item[0].item[0].item[0].answerOption.initialSelected = true

* item[0].item[0].item[1].linkId = "Practitioner.name[0].family"
* item[0].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name.family"
* item[0].item[0].item[1].text = "Family Name"
* item[0].item[0].item[1].type = #string
* item[0].item[0].item[1].required = true
* item[0].item[0].item[1].repeats = false

* item[0].item[0].item[2].linkId = "Practitioner.name[0].given[0]"
* item[0].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name.given"
* item[0].item[0].item[2].text = "Given Name(s)"
* item[0].item[0].item[2].type = #string
* item[0].item[0].item[2].required = true
* item[0].item[0].item[2].repeats = true

* item[0].item[0].item[3].linkId = "Practitioner.name[0].prefix[0]"
* item[0].item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name.prefix"
* item[0].item[0].item[3].text = "Prefix"
* item[0].item[0].item[3].type = #string
* item[0].item[0].item[3].required = false
* item[0].item[0].item[3].repeats = true

* item[0].item[0].item[4].linkId = "Practitioner.name[0].suffix[0]"
* item[0].item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name.suffix"
* item[0].item[0].item[4].text = "Suffix"
* item[0].item[0].item[4].type = #string
* item[0].item[0].item[4].required = false
* item[0].item[0].item[4].repeats = true

* item[0].item[1].linkId = "Practitioner.birthDate"
* item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.birthDate"
* item[0].item[1].text = "Date of Birth"
* item[0].item[1].type = #date
* item[0].item[1].required = false
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Practitioner.gender"
* item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.gender"
* item[0].item[2].text = "Gender"
* item[0].item[2].type = #choice
* item[0].item[2].answerValueSet = "http://hl7.org/fhir/ValueSet/administrative-gender"
* item[0].item[2].required = false
* item[0].item[2].repeats = false

* item[0].item[3].linkId = "Practitioner.extension[0]"
* item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:residence.value[x]:valueReference"
* item[0].item[3].text = "Residence"
* item[0].item[3].type = #reference
* item[0].item[3].required = false
* item[0].item[3].repeats = false

* item[1].linkId = "__Practitioner:contact"
* item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner"
* item[1].text = "Contact Details|Address, email, phone numbers"
* item[1].type = #group

* item[1].item[0].linkId = "Practitioner.address[0]"
* item[1].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.address"
* item[1].item[0].text = "Home Address"
* item[1].item[0].type = #group

* item[1].item[0].item[0].linkId = "Practitioner.address[0].use"
* item[1].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.address.use"
* item[1].item[0].item[0].text = "Address Use"
* item[1].item[0].item[0].type = #choice
* item[1].item[0].item[0].required = true
* item[1].item[0].item[0].repeats = false
* item[1].item[0].item[0].readOnly = true
* item[1].item[0].item[0].answerOption.valueCoding = http://hl7.org/fhir/address-use#home
* item[1].item[0].item[0].answerOption.initialSelected = true

* item[1].item[0].item[1].linkId = "Practitioner.address[0].type"
* item[1].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.address.type"
* item[1].item[0].item[1].text = "Address Type"
* item[1].item[0].item[1].type = #choice
* item[1].item[0].item[1].required = true
* item[1].item[0].item[1].repeats = false
* item[1].item[0].item[1].readOnly = true
* item[1].item[0].item[1].answerOption.valueCoding = http://hl7.org/fhir/address-type#physical
* item[1].item[0].item[1].answerOption.initialSelected = true

* item[1].item[0].item[2].linkId = "Practitioner.address[0].line"
* item[1].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.address.line"
* item[1].item[0].item[2].text = "Street Address"
* item[1].item[0].item[2].type = #string
* item[1].item[0].item[2].required = true
* item[1].item[0].item[2].repeats = true

* item[1].item[0].item[3].linkId = "Practitioner.address[0].city"
* item[1].item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.address.city"
* item[1].item[0].item[3].text = "City"
* item[1].item[0].item[3].type = #string
* item[1].item[0].item[3].required = false
* item[1].item[0].item[3].repeats = false

* item[1].item[0].item[4].linkId = "Practitioner.address[0].district"
* item[1].item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.address.district"
* item[1].item[0].item[4].text = "District"
* item[1].item[0].item[4].type = #string
* item[1].item[0].item[4].required = false
* item[1].item[0].item[4].repeats = false

* item[1].item[0].item[5].linkId = "Practitioner.address[0].state"
* item[1].item[0].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.address.state"
* item[1].item[0].item[5].text = "State"
* item[1].item[0].item[5].type = #string
* item[1].item[0].item[5].required = false
* item[1].item[0].item[5].repeats = false

* item[1].item[0].item[6].linkId = "Practitioner.address[0].postalCode"
* item[1].item[0].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.address.postalCode"
* item[1].item[0].item[6].text = "Postal Code"
* item[1].item[0].item[6].type = #string
* item[1].item[0].item[6].required = false
* item[1].item[0].item[6].repeats = false

* item[1].item[0].item[7].linkId = "Practitioner.address[0].country"
* item[1].item[0].item[7].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.address.country"
* item[1].item[0].item[7].text = "Country"
* item[1].item[0].item[7].type = #string
* item[1].item[0].item[7].required = false
* item[1].item[0].item[7].repeats = false

* item[1].item[1].linkId = "Practitioner.telecom[0].use"
* item[1].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.use"
* item[1].item[1].text = "Telecom Use"
* item[1].item[1].type = #choice
* item[1].item[1].required = true
* item[1].item[1].repeats = false
* item[1].item[1].readOnly = true
* item[1].item[1].answerOption.valueCoding = http://hl7.org/fhir/contact-point-use#mobile
* item[1].item[1].answerOption.initialSelected = true

* item[1].item[2].linkId = "Practitioner.telecom[0].system"
* item[1].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.system"
* item[1].item[2].text = "Telecom System"
* item[1].item[2].type = #choice
* item[1].item[2].required = true
* item[1].item[2].repeats = false
* item[1].item[2].readOnly = true
* item[1].item[2].answerOption.valueCoding = http://hl7.org/fhir/contact-point-system#phone
* item[1].item[2].answerOption.initialSelected = true

* item[1].item[3].linkId = "Practitioner.telecom[0].value"
* item[1].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.value"
* item[1].item[3].text = "Mobile Phone"
* item[1].item[3].type = #string
* item[1].item[3].required = false
* item[1].item[3].repeats = false

* item[1].item[4].linkId = "Practitioner.telecom[1].use"
* item[1].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.use"
* item[1].item[4].text = "Telecom Use"
* item[1].item[4].type = #choice
* item[1].item[4].required = true
* item[1].item[4].repeats = false
* item[1].item[4].readOnly = true
* item[1].item[4].answerOption.valueCoding = http://hl7.org/fhir/contact-point-use#work
* item[1].item[4].answerOption.initialSelected = true

* item[1].item[5].linkId = "Practitioner.telecom[1].system"
* item[1].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.system"
* item[1].item[5].text = "Telecom System"
* item[1].item[5].type = #choice
* item[1].item[5].required = true
* item[1].item[5].repeats = false
* item[1].item[5].readOnly = true
* item[1].item[5].answerOption.valueCoding = http://hl7.org/fhir/contact-point-system#email
* item[1].item[5].answerOption.initialSelected = true

* item[1].item[6].linkId = "Practitioner.telecom[1].value"
* item[1].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.value"
* item[1].item[6].text = "Work Email"
* item[1].item[6].type = #string
* item[1].item[6].required = false
* item[1].item[6].repeats = false

* item[2].linkId = "PractitionerRole"
* item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role"
* item[2].text = "Position|Position the person holds"
* item[2].type = #group
* item[2].extension[constraint][0].extension[key].valueId = "ihris-start-end-date"
* item[2].extension[constraint][0].extension[severity].valueCode = #error
* item[2].extension[constraint][0].extension[expression].valueString = "where(linkId='PractitionerRole.period.end').answer.first().valueDateTime.empty() or where(linkId='PractitionerRole.period.end').answer.first().valueDateTime >= where(linkId='PractitionerRole.period.start').answer.first().valueDateTime"
* item[2].extension[constraint][0].extension[human].valueString = "The end date must be after the start date."

* item[2].item[0].linkId = "PractitionerRole.practitioner"
* item[2].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.practitioner"
* item[2].item[0].text = "Practitioner"
* item[2].item[0].type = #string
* item[2].item[0].required = true
* item[2].item[0].repeats = false
* item[2].item[0].readOnly = true
* item[2].item[0].answerOption.valueString = "__REPLACE__Practitioner"
* item[2].item[0].answerOption.initialSelected = true

* item[2].item[1].linkId = "PractitionerRole.code"
* item[2].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.code"
* item[2].item[1].text = "Job Title"
* item[2].item[1].type = #choice
* item[2].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-job"
* item[2].item[1].required = true
* item[2].item[1].repeats = false

* item[2].item[2].linkId = "PractitionerRole.period.start"
* item[2].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.period.start"
* item[2].item[2].text = "Start Date"
* item[2].item[2].type = #dateTime
* item[2].item[2].required = true
* item[2].item[2].repeats = false

* item[2].item[3].linkId = "PractitionerRole.period.end"
* item[2].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.period.end"
* item[2].item[3].text = "End Date"
* item[2].item[3].type = #dateTime
* item[2].item[3].required = false
* item[2].item[3].repeats = false

* item[2].item[4].linkId = "PractitionerRole.location[0]"
* item[2].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.location"
* item[2].item[4].text = "Facility"
* item[2].item[4].type = #reference
* item[2].item[4].required = true
* item[2].item[4].repeats = false

* item[3].linkId = "Practitioner.identifier"
* item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier"
* item[3].text = "Identifiers|Identifiers for the practitioner"
* item[3].type = #group

* item[3].item[0].linkId = "Practitioner.identifier[0]"
* item[3].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier"
* item[3].item[0].text = "Identifier"
* item[3].item[0].type = #group
* item[3].item[0].repeats = true
* item[3].item[0].required = false

* item[3].item[0].item[0].linkId = "Practitioner.identifier[0].system"
* item[3].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.system"
* item[3].item[0].item[0].text = "System"
* item[3].item[0].item[0].type = #string
* item[3].item[0].item[0].repeats = false
* item[3].item[0].item[0].required = false

* item[3].item[0].item[1].linkId = "Practitioner.identifier[0].value"
* item[3].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.value"
* item[3].item[0].item[1].text = "ID Number"
* item[3].item[0].item[1].type = #string
* item[3].item[0].item[1].repeats = false
* item[3].item[0].item[1].required = false

* item[3].item[0].item[2].linkId = "Practitioner.identifier[0].type"
* item[3].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.type"
* item[3].item[0].item[2].text = "ID Type"
* item[3].item[0].item[2].type = #choice
* item[3].item[0].item[2].answerValueSet = "http://hl7.org/fhir/ValueSet/identifier-type"
* item[3].item[0].item[2].repeats = false
* item[3].item[0].item[2].required = false

Instance:       IhrisPractitionerWorkflowEndRole
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS End Role Workflow"
* description = "iHRIS workflow to end a current role/job"
* id = "ihris-endrole"
* url = "http://ihris.org/fhir/Questionnaire/ihris-endrole"
* name = "ihris-endrole"
* status = #active
* date = 2020-08-09
* purpose = "Workflow page for ending a role/job."

* item[0].linkId = "PractitionerRole"
* item[0].text = "Job End Date"
* item[0].type = #group

* item[0].item[0].linkId = "period.end"
* item[0].item[0].text = "End Date"
* item[0].item[0].type = #date
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "departure"
* item[0].item[1].text = "Reason For Depature"
* item[0].item[1].type = #choice
* item[0].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-reason-depature-valueset"
* item[0].item[1].required = true
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "status"
* item[0].item[2].text = "Position Status"
* item[0].item[2].type = #choice
* item[0].item[2].required = true
* item[0].item[2].repeats = false
* item[0].item[2].readOnly = true
* item[0].item[2].answerOption.valueCoding = http://ihris.org/fhir/CodeSystem/ihris-position-status#closed
* item[0].item[2].answerOption.initialSelected = true

Instance:       IhrisPractitionerWorkflowPromotion
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS End Role Workflow"
* description = "iHRIS workflow to record a promotion"
* id = "ihris-promotion"
* url = "http://ihris.org/fhir/Questionnaire/ihris-promotion"
* name = "ihris-promotion"
* status = #active
* date = 2020-08-09
* purpose = "Workflow page for recording a promotion."

* item[0].linkId = "PractitionerRole"
* item[0].text = "Promotion Details"
* item[0].type = #group

* item[0].item[0].linkId = "OldPractitionerRole"
* item[0].item[0].text = "Old Position Details"
* item[0].item[0].type = #group

* item[0].item[0].item[0].linkId = "period.end"
* item[0].item[0].item[0].text = "Position Change Date"
* item[0].item[0].item[0].type = #dateTime
* item[0].item[0].item[0].required = true
* item[0].item[0].item[0].repeats = false

* item[0].item[0].item[1].linkId = "reasonfordepature"
* item[0].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:reasonForDepature.value[x]:valueCoding"
* item[0].item[0].item[1].text = "Reason For Change"
* item[0].item[0].item[1].type = #choice
* item[0].item[0].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-reason-departure-valueset"
* item[0].item[0].item[1].required = true
* item[0].item[0].item[1].repeats = false

* item[0].item[0].item[2].linkId = "oldPositionStatus"
* item[0].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:positionStatus.value[x]:valueCoding"
* item[0].item[0].item[2].text = "Position Status"
* item[0].item[0].item[2].type = #choice
* item[0].item[0].item[2].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-position-status"
* item[0].item[0].item[2].required = true
* item[0].item[0].item[2].repeats = false
* item[0].item[0].item[2].answerOption.valueCoding = http://ihris.org/fhir/CodeSystem/ihris-position-status#closed
* item[0].item[0].item[2].answerOption.initialSelected = true

* item[0].item[1].linkId = "NewPractitionerRole"
* item[0].item[1].text = "New Position Details"
* item[0].item[1].type = #group

* item[0].item[1].item[0].linkId = "code"
* item[0].item[1].item[0].text = "New Job Title"
* item[0].item[1].item[0].type = #choice
* item[0].item[1].item[0].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-job"
* item[0].item[1].item[0].required = true
* item[0].item[1].item[0].repeats = false

* item[0].item[1].item[1].linkId = "salaryScale"
* item[0].item[1].item[1].text = "New Salary Scale"
* item[0].item[1].item[1].type = #choice
* item[0].item[1].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-salary-scale-valueset"
* item[0].item[1].item[1].required = false
* item[0].item[1].item[1].repeats = false

* item[0].item[1].item[2].linkId = "salary"
* item[0].item[1].item[2].text = "New Salary"
* item[0].item[1].item[2].type = #string
* item[0].item[1].item[2].required = true
* item[0].item[1].item[2].repeats = false

* item[0].item[1].item[3].linkId = "location"
* item[0].item[1].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.location"
* item[0].item[1].item[3].text = "Duty Post/Location"
* item[0].item[1].item[3].type = #reference
* item[0].item[1].item[3].required = true
* item[0].item[1].item[3].repeats = false

/* item[0].item[1].item[4].linkId = "PractitionerRole.extension[1]"
* item[0].item[1].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:shift.value[x]:valueCoding"
* item[0].item[1].item[4].text = "Shift"
* item[0].item[1].item[4].type = #choice
* item[0].item[1].item[4].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-shift-valueset"
* item[0].item[1].item[4].required = true
* item[0].item[1].item[4].repeats = false

* item[0].item[1].item[4].linkId = "employmentStatus"
* item[0].item[1].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:employmentStatus.value[x]:valueCoding"
* item[0].item[1].item[4].text = "Employment Status"
* item[0].item[1].item[4].type = #choice
* item[0].item[1].item[4].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-employment-status-valueset"
* item[0].item[1].item[4].required = true
* item[0].item[1].item[4].repeats = false

* item[0].item[1].item[5].linkId = "jobType"
* item[0].item[1].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:jobType.value[x]:valueCoding"
* item[0].item[1].item[5].text = "Job Type"
* item[0].item[1].item[5].type = #choice
* item[0].item[1].item[5].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-job-type-valueset"
* item[0].item[1].item[5].required = true
* item[0].item[1].item[5].repeats = false

* item[0].item[1].item[6].linkId = "newPositionStatus"
* item[0].item[1].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:positionStatus.value[x]:valueCoding"
* item[0].item[1].item[6].text = "Position Status"
* item[0].item[1].item[6].type = #choice
* item[0].item[1].item[6].required = true
* item[0].item[1].item[6].repeats = false
* item[0].item[1].item[6].readOnly = true
* item[0].item[1].item[6].answerOption.valueCoding = http://ihris.org/fhir/CodeSystem/ihris-position-status#occupied
* item[0].item[1].item[6].answerOption.initialSelected = true*/


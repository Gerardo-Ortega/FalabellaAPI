Feature: scenario outline using a dynamic table

Background:
   

Scenario Outline: : Give breed, <CasosDePruebas>
 
  * json jsonBreeds = {'request': {}}
  * eval jsonBreeds['request']['limit'] = <limit>
  * eval jsonBreeds['endpointPath'] = wsPath_breeds
  
  * def breedsResponse = call read('classpath:com/falabella/wsc/getClient.feature') jsonBreeds
  
  * assert breedsResponse.responseStatus == <operationCode>
  * print ">>>>>> RESPONSE: ", breedsResponse.responseStatus
  * print ">>>>>> RESPONSE: ", breedsResponse.response
  
	Examples:
	|CasosDePruebas              |limit |operationCode |
	|"Happy path"                | 2    |200           |
	|"limit 0"                   | 0    | 200          |
	|"limit vacio"               | ''   | 200          |
	|"limit null array"          | []   |  200         |
	|"limit espacio"             | ' '  |  200         |
	|"limit boundary"            |  9223372036854775808    |200|
	|"limit incorrect character" |  'a' |      200     |
 |"limit incorrect string"    |'Saldos'|     200     |
 |"limit especial character"    |'?'|        200     |



Feature: scenario outline using a dynamic table

Background:
   

Scenario Outline: : Give a CatFact, <CasosDePruebas>
 
  * json jsonCatFact = {'request': {}}
  * eval jsonCatFact['request']['max_length'] = <max_length>
  * eval jsonCatFact['endpointPath'] = wsPath_fact
  
  * def catFactResponse = call read('classpath:com/falabella/wsc/getClient.feature') jsonCatFact
  * assert catFactResponse.responseStatus == <operationCode>
  * print ">>>>>> RESPONSE: ", catFactResponse.responseStatus
  * print ">>>>>> RESPONSE: ", catFactResponse.response
  
	Examples:
	|CasosDePruebas                   |max_length |operationCode   |
  |"Happy path"                     | 20        |200             |
	|"max_length 0"                   | 100       | 200            |
	|"max_length vacio"               | ''        | 200            |
	|"max_length null array"          | []        |  200           |
	|"max_length espacio"             | ' '       |  200           |
	|"max_length boundary"            |  9223372036854775809  |200 |
	|"max_length incorrect character" |  'a'      |      200       |
  |"max_length incorrect string"    |'Saldos'   |     200        |
  |"max_length especial character"  |'?'        |        200     |

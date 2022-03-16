Feature: scenario outline using a dynamic table

Background:
   

Scenario Outline: : Give a CatFacts, <CasosDePruebas>
 
  * json jsonCatFacts = {'request': {}}
  * eval jsonCatFacts['request']['max_length'] = <max_length>
  * eval jsonCatFacts['request']['limit'] = <limit>
  * eval jsonCatFacts['endpointPath'] = wsPath_facts
  
  * def catFactsResponse = call read('classpath:com/falabella/wsc/getClient.feature') jsonCatFacts
  * assert catFactsResponse.responseStatus == <operationCode>
  * print ">>>>>> RESPONSE: ", catFactsResponse.response
  
	Examples:
	|CasosDePruebas                   |max_length  |limit         |operationCode   |
  |"Happy path"                     | 20         |1             |200             |
	|"max_length 0"                   | 0          |1             |200             |
	|"max_length vacio"               | ''         |1             |200             |
	|"max_length null array"          | []         |1             |200             |
	|"max_length espacio"             | ' '        |1             |200             |
	|"max_length boundary"            |  9223372036854775809    |1|200             |
	|"max_length incorrect character" |  'a'       |1             |200             |
  |"max_length incorrect string"    |'Saldos'    |1             |200             |
  |"max_length especial character"  |'?'         |1             |200             |
  |"limit on 20"                    |50          |20            |200             |
	|"limit 0"                        |50          |100           |200             |
	|"limit vacio"                    |50          |''            |200             |
	|"limit null array"               |50          |[]            |200             |
	|"limit espacio"                  |50          |' '           |200             |
	|"limit boundary"                 |50          |9223372036854775809|200        |
	|"limit incorrect character"      |50          |'a'           |200             |
  |"limit incorrect string"         |50          |'Saldos'      |200             |
  |"limit especial character"       |50          |'?'           |200             |

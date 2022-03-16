Feature: Get generico

Background:

    * url IPConnServer01 
    * def isError = function(m) { return m == 0 }
    
Scenario:	
	* def query = __arg['request'] 
  * print query

	Given url IPConnServer01
	And path __arg['endpointPath']
	And params query
	And header Accept = 'application/json'
	And header X-CSRF-TOKEN = 'hR6zq8wRquz6asZ5Echw8eXTRJq0zZnKadK6C2QO'	
	When method GET
	

	
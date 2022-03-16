function fn() {
  var env = karate.env; // get system property 'karate.env'
   karate.configure('connectTimeout', 3000);
  karate.configure('readTimeout', 3000); 
  karate.configure('ssl', true);
  
   karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
	IPConnServer01 : "https://catfact.ninja",
	wsPath_fact	:	"/fact",
	wsPath_facts: "/facts",
	wsPath_breeds: "/breeds"
	
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}
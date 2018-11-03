# converter-integration-app

Sample Integration App implemented with WSO2 Technologies.

In order to run it, https://github.com/NikolaSimeonov/converter-spring-boot should be started as it is used as back end to the integration flow.
You can find it here:
https://github.com/NikolaSimeonov/converter-spring-boot

The app has 2 major flows.
1. API Flow - When accessed it receives SOAP message , logs property, and calls final endpoint. On outbound it uses
XSLT transformations to add custom SOAP Message Header. The Header has 2 possible values
    <SOAP-ENV:Header>
        <ns3:Desciption>
	          Operation returns distance in miles
        </ns3:Desciptio>
     </SOAP-ENV:Header>
         <SOAP-ENV:Header>
        <ns3:Desciption>
	          Operation returns distance in kilometers
        </ns3:Desciptio>
     </SOAP-ENV:Header>
     
 URL for executing the flow:
 http://localhost:8280/distanceConverter/
 
 Sample request:
 
 <?xml version="1.0"?>
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns2="http://spring.io/guides/gs-producing-web-service">
    <SOAP-ENV:Header/>
    <SOAP-ENV:Body>
        <ns2:distanceInMilesRequest>
            <distanceInKm>10</distanceInKm>
        </ns2:distanceInMilesRequest>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>

Sample response:


<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns2="http://spring.io/guides/gs-producing-web-service" xmlns:ns3="http://www.reachit.co">
    <SOAP-ENV:Header>
        <ns3:Desciption>
	    Operation returns distance in miles
        </ns3:Desciption>
    </SOAP-ENV:Header>
    <SOAP-ENV:Body>
        <ns3:distanceInMilesResponse xmlns:ns3="http://spring.io/guides/gs-producing-web-service">
            <distanceInMiles>6.2137119210</distanceInMiles>
        </ns3:distanceInMilesResponse>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>

     
2. Proxy Flow, Here we have Service Proxy implemented with Logging.
     
      URL for executing the flow:
      http://localhost:8280/services/converter-proxy.converter-proxyHttpSoap12Endpoint
      
   Sample Request:
   
<?xml version="1.0"?>
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns2="http://spring.io/guides/gs-producing-web-service">
<SOAP-ENV:Header/>
<SOAP-ENV:Body>
    <ns2:distanceInKmRequest>
            <distanceInMiles>1500.0</distanceInMiles>
    </ns2:distanceInKmRequest>
</SOAP-ENV:Body>
</SOAP-ENV:Envelope>

  Sample Response:
  
  <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
    <SOAP-ENV:Header/>
    <SOAP-ENV:Body>
        <ns3:distanceInKmResponse xmlns:ns3="http://spring.io/guides/gs-producing-web-service">
            <distanceInKm>2414.01600015000</distanceInKm>
        </ns3:distanceInKmResponse>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
</SOAP-ENV:Envelope>
     
         

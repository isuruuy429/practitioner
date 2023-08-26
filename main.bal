import ballerina/http;

listener http:Listener httpListener = new (9090);

type IdNotFound record {|
    *http:NotFound;
    record {
        string message;
    } body;
|};

service / on httpListener {

    //This function returns a patient resource by its id. 
    isolated resource function get [string fhirType]/[string id]() returns @http:Payload {mediaType: ["application/fhir+json", "application/fhir+xml"]} json|error {
        http:Client clientEndpoint = check new ("https://run.mocky.io/v3");

        // Send the GET request 
        http:Response httpResponse = check clientEndpoint->get("/4989a9eb-e80a-4db0-9374-605432718d2e");

        // Get the response as a string
        json responseStr = check httpResponse.getJsonPayload();
        Practitioner practitioner = check responseStr.cloneWithType();

        return transform(practitioner).toJson();
    }
}

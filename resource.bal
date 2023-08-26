import xyz/pdexplannet;

public type Practitioner record {
    string id?;
    string lastName;
    string gender?;
    string birthDate?;
    boolean active;

};

isolated function transform(Practitioner practitioner) returns pdexplannet:PlannetPractitioner => {
    id: practitioner.id,
    active: practitioner.active,
    name: [
        {
            family: practitioner.lastName
        }
    ],
    identifier: [
        {
            id: practitioner.id,
            system: "http://www.acme.com/identifiers/patient",
            value: "123456"
        }
    ],
    birthDate: practitioner.birthDate
};

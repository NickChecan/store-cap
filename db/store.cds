namespace my.company;

using my.company.Transaction from './transaction';

type Address {
    streetName   : String;
    streetNumber : Integer;
    city         : String;
    state        : String;
    country      : String;
    postcode     : Integer;
}

entity Store {
    key ID       : Integer;
    name         : String not null;
    @Comment : 'Type of store'
    segment      : String;
    creationDate : Date;
    address      : Address;
    transactions : Association[*] to Transaction.Header on transactions.ID = ID;
}
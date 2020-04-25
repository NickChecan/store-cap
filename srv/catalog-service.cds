using my.company.Store as Store from '../db/store';
using my.company.Product as Product from '../db/product';
using my.company.Transaction.Item as Item from '../db/transaction';
using my.company.Transaction.Header as Header from '../db/transaction';

service CatalogService {
    
    // Tech Note: Annotations after entity declaration
    entity Stores @(title: '{i18n>storeService}') 
    as projection on Store;

    // Tech Note: Annotations before the entity declaration
    @readonly @(title: '{i18n>productService}') 
    entity Products as projection on Product;
    
    // Accessible through http://localhost:4004/catalog/hello(to='world')
    // The "function" command will generate a GET request on the Catalog services
    function hello (to:String) returns String;

}
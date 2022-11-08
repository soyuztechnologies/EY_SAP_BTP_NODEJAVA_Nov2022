using { anubhav.db.master, anubhav.db.transaction } from '../db/datamodel';


service CatalogService@(path:'/CatalogService') {

    @Capabilities : { Insertable,Updatable,Deletable }
    entity EmployeeSet as projection on master.employees;
    entity AddressSet as projection on master.address;
    entity ProductSet as projection on master.product;
    @readonly
    entity BPSet as projection on master.businesspartner;
    

    entity POs @(
        title: '{i18n>poHeader}'
    ) as projection on transaction.purchaseorder{
        *,
        Items: redirected to POItems
    }actions{
        function largestOrder() returns array of POs;
        action boost();
    }

    annotate POs with {
        GROSS_AMOUNT @title: '{i18n>GROSS_AMOUNT}';
    };
    

    entity POItems @( title : '{i18n>poItems}' )
    as projection on transaction.poitems{
        *,
        PARENT_KEY: redirected to POs,
        PRODUCT_GUID: redirected to ProductSet
    }

}
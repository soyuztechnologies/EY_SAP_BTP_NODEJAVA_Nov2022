using { anubhav.db } from '../db/datamodel';
using { anubhav.db.CDSViews } from '../db/CDSViews';

service CatalogService @(path: 'CatalogService') {

    entity BusinessPartnerSet as projection on db.master.businesspartner;
    entity AddressSet as projection on db.master.address;
    entity EmployeeSet as projection on db.master.employees;
    entity PurchaseOrderItems as projection on db.transaction.poitems;
    entity POs as projection on db.transaction.purchaseorder{
        *,
        Items: redirected to PurchaseOrderItems
    };
    entity CProductValuesView as projection on CDSViews.CProductValuesView;

}

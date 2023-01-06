using { anubhav.db } from '../db/datamodel';
using { anubhav.db.CDSViews } from '../db/CDSViews';

service CatalogService @(path: 'CatalogService') {
    
    entity BusinessPartnerSet as projection on db.master.businesspartner;
    entity AddressSet as projection on db.master.address;
    entity EmployeeSet as projection on db.master.employees;
    entity PurchaseOrderItems as projection on db.transaction.poitems;
    entity POs as projection on db.transaction.purchaseorder{
        *,
        Items: redirected to PurchaseOrderItems,
        case LIFECYCLE_STATUS
        when 'N' then 'New'
        when 'D' then 'Delivered'
        when 'B' then 'Blocked'
        end as LIFECYCLE_STATUS: String(20),
        case LIFECYCLE_STATUS
        when 'N' then 2
        when 'D' then 1
        when 'B' then 3
        end as Criticality: Integer
    }actions{
        action boost();
        function largestOrder() returns array of POs;
    };
    entity CProductValuesView as projection on CDSViews.CProductValuesView;

}

using CatalogService as service from '../../srv/CatalogService';

annotate service.POs with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Order Id',
            Value : PO_ID,
        },
        {
            $Type : 'UI.DataField',
            Label: 'Vendor',
            Value : PARTNER_GUID.COMPANY_NAME,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Amount',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Currency',
            Value : CURRENCY_CODE,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : LIFECYCLE_STATUS,
            Criticality: Criticality,
            CriticalityRepresentation: #WithIcon
        }
    ]
);
annotate service.POs with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'CURRENCY_CODE',
                Value : CURRENCY_CODE,
            },
            {
                $Type : 'UI.DataField',
                Label : 'GROSS_AMOUNT',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Label : 'NET_AMOUNT',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TAX_AMOUNT',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Label : 'NODE_KEY',
                Value : NODE_KEY,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PO_ID',
                Value : PO_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PARTNER_GUID_NODE_KEY',
                Value : PARTNER_GUID_NODE_KEY,
            },
            {
                $Type : 'UI.DataField',
                Label : 'LIFECYCLE_STATUS',
                Value : LIFECYCLE_STATUS,
            },
            {
                $Type : 'UI.DataField',
                Label : 'OVERALL_STATUS',
                Value : OVERALL_STATUS,
            },
            {
                $Type : 'UI.DataField',
                Label : 'NOTE',
                Value : NOTE,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);

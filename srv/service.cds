using { ust.jayakiran.yadlapalli.datamodel.transaction as t } from '../db/datamodels';

service PurchaseOrderservice {

    @Capabilities : {
        Insertable : true,
        Deletable  : true,
        Updatable  : true
    }

    @UI.HeaderInfo : {
        TypeName       : 'Purchase Order',
        TypeNamePlural : 'Purchase Orders',
        Title          : { Value : PO_ID }
    }

    @UI.LineItem : [
        { Value: ID,                Label: 'ID' },
        { Value: PO_ID,             Label: 'PO ID' },
        { Value: PARTNER_GUID_ID,   Label: 'Business Partner' },
        { Value: LIFECYCLE_STATUS,  Label: 'Lifecycle Status' },
         { Value: OVERALL_STATUS,    Label: 'Overall Status' },
          { Value: CURRENCY_CODE_code,     Label: 'Currency' },
      
        { Value: GROSS_AMOUNT,      Label: 'Gross Amount' },
        { Value: NET_AMOUNT,        Label: 'Net Amount' },
        { Value: TAX_AMOUNT,        Label: 'Tax Amount' }
        
       
    ]

    @UI.FieldGroup#PO : {
        Label : 'PO Details',
        Data  : [
            { Value: ID,               Label: 'ID' },
            { Value: PO_ID,            Label: 'PO ID' },
            { Value: PARTNER_GUID_ID,  Label: 'Business Partner' },
            { Value: CURRENCY_CODE_code,    Label: 'Currency' },
            { Value: GROSS_AMOUNT,     Label: 'Gross Amount' },
            { Value: NET_AMOUNT,       Label: 'Net Amount' },
            { Value: TAX_AMOUNT,       Label: 'Tax Amount' },
            { Value: LIFECYCLE_STATUS, Label: 'Lifecycle Status' }
        ]
    }

    @UI.Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'General Information',
            Target : '@UI.FieldGroup#PO'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Purchase Order Items',
            Target : 'Items/@UI.LineItem'
        }
    ]

    @UI.SelectionFields  : [PO_ID, LIFECYCLE_STATUS]

    @odata.draft.enabled
    entity purchaseorder as projection on t.purchaseorder;

    @UI.LineItem : [
        { Value: ID,              Label: 'ID' },
        { Value: PARENT_KEY_ID,   Label: 'PO Header ID' },
        { Value: PRODUCT_GUID_ID, Label: 'Product' },
        { Value: PO_ITEM_POS,     Label: 'Item Position' },
        { Value: CURRENCY_CODE_code,   Label: 'Currency' },
        { Value: GROSS_AMOUNT,    Label: 'Gross Amount' },
        { Value: NET_AMOUNT,      Label: 'Net Amount' },
        { Value: TAX_AMOUNT,      Label: 'Tax Amount' }
    ]
    entity poitems as projection on t.poitems;
}
tableextension 50106 "PurchaseHeader_Ext" extends "Purchase Header"
{
    fields
    {
        field(50000; "Kind Attention"; text[100])
        {
            DataClassification = CustomerContent;
        }
    }

}
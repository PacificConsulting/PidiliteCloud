tableextension 50108 "SalesInvHdr_Ext" extends "Sales Invoice Header"
{
    fields
    {
        field(50000; Retention; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50001; "Mobilisation Advance"; Decimal)
        {
            DataClassification = CustomerContent;
        }
    }

    var
        myInt: Integer;
}
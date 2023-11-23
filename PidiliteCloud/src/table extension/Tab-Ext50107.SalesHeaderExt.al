tableextension 50107 "SalesHeader_Ext" extends "Sales Header"
{
    fields
    {
        field(50000; Retention; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Retention (%)';
        }
        field(50001; "Mobilisation Advance"; Decimal)
        {
            DataClassification = CustomerContent;
        }
    }

}
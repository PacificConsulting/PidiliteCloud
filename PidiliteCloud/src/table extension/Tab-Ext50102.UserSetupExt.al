tableextension 50102 "UserSetup_Ext" extends "User Setup"
{
    fields
    {
        field(50000; "Purchase User"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50001; "Sales User"; Boolean)
        {
            DataClassification = CustomerContent;
        }

    }

}
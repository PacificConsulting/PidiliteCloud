tableextension 50100 "Location_Ext" extends Location
{
    fields
    {
        field(50000; "Project Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50001; "Project Name"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50002; "Project Location"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Client State"; code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = State;
        }
        field(50004; "Client GSTIN"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
}
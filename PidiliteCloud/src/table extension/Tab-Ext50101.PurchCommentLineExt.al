tableextension 50101 "Purch_Comment_Line_Ext" extends "Purch. Comment Line"
{
    fields
    {
        field(50000; Type; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Freight,Delivery,Payment,Others;
            OptionCaption = 'Freight,Delivery,Payment,Others';
        }
    }

}
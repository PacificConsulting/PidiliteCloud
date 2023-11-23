pageextension 50104 PurchCommentLineExt extends "Purch. Comment Sheet"
{
    layout
    {
        addafter(Date)
        {
            field(Type; Rec.Type)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}
pageextension 50001 PurchOrderSubform extends "Purchase Order Subform"
{
    layout
    {
        addafter("Location Code")
        {
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                Visible = true;
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
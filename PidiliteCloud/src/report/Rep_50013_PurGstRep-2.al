report 50013 "Purchase Register Lat. Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Purchase Register Document Wise Report';
    RDLCLayout = 'src\reportlayout\PurchaseRegisterGST_Test Report-Revise.rdl';

    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Posting Date";
            column(No_PIL; "No.")
            {

            }
            column(Location_Code_PIH; "Location Code")
            {

            }
            column(Posting_Date_PIL; "Posting Date")
            {

            }
            column(Buy_from_Vendor_No_PIH; "Buy-from Vendor No.")
            {

            }
            column(Buy_from_Vendor_Name_PIH; "Buy-from Vendor Name")
            {

            }
            column(Vendor_Invoice_No_PIH; "Vendor Invoice No.")
            {

            }
            column(Vendor_Posting_Group_PIH; "Vendor Posting Group")
            {

            }
            column(Location_State_Code_PIH; "Location State Code")
            {

            }
            column(BuyerSeller_State_Code_PIH; Buyer_Code_PIL)
            {

            }
            column(Invoice_Date_PIH; "Document Date")
            {

            }
            column(PAN_PIH; PAN_PIH)
            {

            }
            column(VenGSTNo_PIH; VenGSTNo_PIH)
            {

            }
            column(BuyerSellerRegNo_PIH; BuyerSellerRegNo_PIH)
            {

            }
            column(GSTDocumenttype_PIH; GSTDocumenttype_PIH)
            {

            }
            column(GSTVendorType_PIH; GSTVendorType_PIH)
            {

            }
            column(GSTGLAccNo_PIH; GSTGLAccNo_PIH)
            {

            }
            column(GSTBaseAmt_PIH; GSTBaseAmt_PIH)
            {

            }
            column(LocRegNo_PIH; LocRegNo_PIH)
            {

            }
            column(TotalGrossAmt_PIH; TotalGrossAmt_PIH)
            {

            }
            column(TotalGSTBase_PIH; TotalGSTBase_PIH)
            {

            }
            column(TDSAmt_PIL; TDSAmt_PIL)
            {

            }
            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = sorting("Document No.", "Line No.") where("No." = filter(<> ''));
                column(HSN_SAC_Code_PIL; "HSN/SAC Code")
                {

                }
                column(Amount_PIL; amount)
                {


                }
                column(SGST_PIL; SGST_PIL)
                {

                }
                column(CGST_PIL; CGST_PIL)
                {

                }
                column(IGST_PIL; IGST_PIL)
                {

                }
                column(GrossAmt_PIL; GrossAmt_PIL)
                {

                }
                column(DocNo_PIH; DocNo_PIH)
                {

                }
                column(DocType_PIH; 'Invoice')
                {

                }

                trigger OnAfterGetRecord() //PIL
                var
                    DGLE_PIL: Record "Detailed GST Ledger Entry";
                    TDS_PIL: Record "TDS Entry";
                begin
                    Clear(SGST_PIL);
                    Clear(CGST_PIL);
                    Clear(IGST_PIL);

                    DGLE_PIL.Reset();
                    DGLE_PIL.SetRange("Document No.", "Document No.");
                    DGLE_PIL.SetRange("Document Line No.", "Line No.");
                    //DGLE_PIL.SetRange("No.", "No.");
                    DGLE_PIL.SetRange("Transaction Type", DGLE_PIL."Transaction Type"::Purchase);
                    if DGLE_PIL.findset then begin
                        repeat
                            IF DGLE_PIL."GST Component Code" = 'SGST' THEN BEGIN
                                SGST_PIL := ABS(DGLE_PIL."GST Amount");
                            END

                            ELSE
                                IF DGLE_PIL."GST Component Code" = 'CGST' THEN BEGIN
                                    CGST_PIL := ABS(DGLE_PIL."GST Amount");
                                END

                                ELSE
                                    IF DGLE_PIL."GST Component Code" = 'IGST' THEN BEGIN
                                        IGST_PIL := ABS(DGLE_PIL."GST Amount");
                                    END
                        until DGLE_PIL.Next() = 0;
                    end;

                    PIL.Reset();
                    PIL.SetRange("Document No.", "Document No.");
                    if PIL.FindSet() then
                        repeat
                            GrossAmt_PIL += PIL.Amount;
                        until pil.Next() = 0;

                    // if (SGST_PIL <> 0) OR (IGST_PIL <> 0) then begin
                    //     GrossAmt_PIL += "Purch. Inv. Line".Amount + TDSAmt_PIL;
                    //     //TotalGrossAmt_PIH := GrossAmt_PIL;
                    // end;
                end;
            }
            trigger OnAfterGetRecord() //PIH
            var
                Vendor: Record 23;
                DGLE_: Record "Detailed GST Ledger Entry";
                Location_PIH: Record Location;
            begin
                if Vendor.GET("Buy-from Vendor No.") then
                    PAN_PIH := Vendor."P.A.N. No.";
                VenGSTNo_PIH := Vendor."GST Registration No.";

                Clear(GSTBaseAmt_PIH);

                DGLE_.Reset();
                DGLE_.SetRange("Document No.", "No.");
                if DGLE_.FindSet() then begin
                    repeat
                        BuyerSellerRegNo_PIH := DGLE_."Buyer/Seller Reg. No.";
                        GSTVendorType_PIH := DGLE_."GST Vendor Type";
                        GSTDocumenttype_PIH := DGLE_."Document Type";
                        if GSTBaseAmt_PIH = 0 then
                            GSTBaseAmt_PIH += DGLE_."GST Base Amount";
                        GSTGLAccNo_PIH := DGLE_."G/L Account No.";
                    until DGLE_.Next() = 0;
                end;
                if Location_PIH.GET(DGLE_."Location Code") then
                    LocRegNo_PIH := Location_PIH."GST Registration No.";


                //TotalGSTBase_PIH += GSTBaseAmt_PIH;
                //end;
                DGLE_.Reset();
                DGLE_.SetRange("Document No.", "No.");
                if DGLE_.FindFirst() then begin
                    PIL.Reset();
                    PIL.SetRange("Document No.", "No.");
                    PIL.SetFilter("No.", '<>%1', '');
                    if PIL.FindSet() then
                        repeat
                            TotalGrossAmt_PIH += PIL.Amount;
                        //Dec += PIL.Amount;
                        until PIL.Next() = 0;
                end;

                VLE.Reset();
                VLE.SetRange("Vendor No.", "Buy-from Vendor No.");
                if VLE.FindFirst() then
                    Buyer_Code_PIL := VLE."Buyer State Code";

                Clear(TDSAmt_PIL);
                TDS.Reset();
                TDS.SetRange("Document No.", "No.");
                if TDS.FindSet() then
                    repeat
                        TDSAmt_PIL += TDS."TDS Amount";
                    until TDS.Next() = 0;

                //TotalGrossAmt_PIH := Dec + TDSAmt_PIL;
            end;
        }
        dataitem("Purch. Cr. Memo Hdr."; "Purch. Cr. Memo Hdr.")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Posting Date";
            column(No_PCML; "No.")
            {

            }
            column(Vendor_Cr__Memo_No_PCML; "Vendor Cr. Memo No.")
            {

            }
            column(Vendor_Posting_Group_PCML; "Vendor Posting Group")
            {

            }
            column(Location_State_Code_PCML; "Location State Code")
            {

            }
            column(BuyerSeller_State_Code_PCML; Buyer_Code_PCML)
            {

            }
            column(Invoice_Date_PCML; "Document Date")
            {

            }
            column(PAN_PCMH; PAN_PCMH)
            {

            }
            column(VenGSTNo_PCMH; VenGSTNo_PCMH)
            {

            }
            column(BuyerSellerRegNo_PCML; BuyerSellerRegNo_PCML)
            {

            }
            column(GSTBaseAmt_PCML; GSTBaseAmt_PCML)
            {

            }
            column(GSTDocumenttype_PCML; GSTDocumenttype_PCML)
            {

            }
            column(GSTVendorType_PCML; GSTVendorType_PCML)
            {

            }
            column(GSTGLAccNo_PCML; GSTGLAccNo_PCML)
            {

            }
            column(LocRegNo_PCML; LocRegNo_PCML)
            {

            }
            column(Posting_Date_PCMH; "Posting Date")
            {

            }
            column(Location_Code_PCMH; "Location Code")
            {

            }
            column(Buy_from_Vendor_No_PCMH; "Buy-from Vendor No.")
            {

            }
            column(Buy_from_Vendor_Name_PCMH; "Buy-from Vendor Name")
            {

            }
            column(TotalGrossAmt_PCML; TotalGrossAmt_PCML)
            {

            }
            column(TDSAmt_PCML; TDSAmt_PCML)
            { }

            dataitem("Purch. Cr. Memo Line"; "Purch. Cr. Memo Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = sorting("Document No.", "Line No.") where("No." = filter(<> ''));
                column(HSN_SAC_Code_PCML; "HSN/SAC Code")
                {

                }
                column(Amount_PCML; Amount)
                {

                }
                column(SGST_PCML; SGST_PCML)
                {

                }
                column(CGST_PCML; CGST_PCML)
                {

                }
                column(IGST_PCML; IGST_PCML)
                {

                }
                column(GrossAmt_PCML; GrossAmt_PCML)
                {

                }
                column(DocNo_PCML; DocNo_PCML)
                {

                }
                column(DocType_PCML; 'Credit Memo')
                {

                }
                trigger OnAfterGetRecord() //PCML
                var
                    DGLE_PCML: Record "Detailed GST Ledger Entry";
                    TDS_PCML: Record "TDS Entry";
                begin
                    Clear(SGST_PCML);
                    Clear(CGST_PCML);
                    Clear(IGST_PCML);

                    DGLE_PCML.Reset();
                    DGLE_PCML.SetRange("Document No.", "Document No.");
                    DGLE_PCML.SetRange("Document Line No.", "Line No.");
                    DGLE_PCML.SetRange("No.", "No.");
                    DGLE_PCML.SetRange("Transaction Type", DGLE_PCML."Transaction Type"::Purchase);
                    if DGLE_PCML.findset then begin
                        repeat
                            IF DGLE_PCML."GST Component Code" = 'SGST' THEN BEGIN
                                SGST_PCML := ABS(DGLE_PCML."GST Amount");
                            END

                            ELSE
                                IF DGLE_PCML."GST Component Code" = 'CGST' THEN BEGIN
                                    CGST_PCML := ABS(DGLE_PCML."GST Amount");
                                END

                                ELSE
                                    IF DGLE_PCML."GST Component Code" = 'IGST' THEN BEGIN
                                        IGST_PCML := ABS(DGLE_PCML."GST Amount");
                                    END;
                        until DGLE_PCML.Next() = 0;
                    end;

                    Clear(TDSAmt_PCML);
                    TDS_PCML.Reset();
                    TDS_PCML.SetRange("Document No.", "Document No.");
                    if TDS_PCML.FindSet() then
                        repeat
                            TDSAmt_PCML += TDS_PCML."TDS Amount";
                        until TDS_PCML.Next() = 0;

                    GrossAmt_PCML += Amount + TDSAmt_PCML;

                end;
            }
            trigger OnAfterGetRecord() //PCMH
            Var
                Vendor_1: Record 23;
                DGLE1: Record "Detailed GST Ledger Entry";
                Location_PCML: Record Location;
            begin
                Vendor_1.GET("Buy-from Vendor No.");
                PAN_PCMH := Vendor_1."P.A.N. No.";
                VenGSTNo_PCMH := Vendor_1."GST Registration No.";
                DGLE1.Reset();
                DGLE1.SetRange("Document No.", "No.");
                if DGLE1.FindSet() then begin
                    repeat
                        BuyerSellerRegNo_PCML := DGLE1."Buyer/Seller Reg. No.";
                        GSTVendorType_PCML := DGLE1."GST Vendor Type";
                        GSTDocumenttype_PCML := DGLE1."Document Type";
                        GSTBaseAmt_PCML += DGLE1."GST Base Amount";
                        GSTGLAccNo_PCML := DGLE1."G/L Account No.";
                    until DGLE1.Next() = 0;
                end;
                if Location_PCML.GET(DGLE1."Location Code") then
                    LocRegNo_PCML := Location_PCML."GST Registration No.";

                DGLE1.Reset();
                DGLE1.SetRange("Document No.", "No.");
                if DGLE1.FindFirst() then begin
                    PCML.Reset();
                    PCML.SetRange("Document No.", "No.");
                    PCML.SetRange("No.", '<>%1', '');
                    if PCML.FindSet() then
                        repeat
                            TotalGrossAmt_PCML += PCML.Amount;
                        until PCML.Next() = 0;

                    VLE.Reset();
                    VLE.SetRange("Vendor No.", "Buy-from Vendor No.");
                    if VLE.FindFirst() then
                        Buyer_Code_PCML := VLE."Buyer State Code";
                end;
            end;
        }
    }

    var
        PAN_PIH: Code[20];
        VenGSTNo_PIH: Code[20];
        PAN_PCMH: Code[20];
        VenGSTNo_PCMH: Code[20];
        SGST_PIL: Decimal;
        CGST_PIL: Decimal;
        IGST_PIL: Decimal;
        SGST_PCML: Decimal;
        CGST_PCML: Decimal;
        IGST_PCML: Decimal;
        Total_CGST_PIL: Decimal;
        Total_ISGT_PIL: Decimal;
        Total_SGST_PIL: Decimal;
        Total_CGST_PCML: Decimal;
        Total_ISGT_PCML: Decimal;
        Total_SGST_PCML: Decimal;
        TDSEntry: Record "TDS Entry";
        BuyerSellerRegNo_PIH: Code[20];
        GSTVendorType_PIH: Enum "GST Vendor Type";
        GSTDocumenttype_PIH: Enum "GST Document Type";
        GSTGLAccNo_PIH: Code[20];
        GSTBaseAmt_PIH: Decimal;
        LocRegNo_PIH: Code[20];
        TDSAmt_PIL: Decimal;
        GrossAmt_PIL: Decimal;
        TDSAmt_PCML: Decimal;
        GrossAmt_PCML: Decimal;
        BuyerSellerRegNo_PCML: Code[20];
        GSTVendorType_PCML: Enum "GST Vendor Type";
        GSTDocumenttype_PCML: Enum "GST Document Type";
        GSTGLAccNo_PCML: Code[20];
        GSTBaseAmt_PCML: Decimal;
        LocRegNo_PCML: Code[20];
        DocNo_PIH: Code[20];
        DocNo_PCML: Code[20];
        TotalGrossAmt_PIH: Decimal;
        TotalGrossAmt_PCML: Decimal;
        TotalGSTBase_PIH: Decimal;
        PIL: Record "Purch. Inv. Line";
        PCML: Record "Purch. Cr. Memo Line";
        VLE: Record "Vendor Ledger Entry";
        Buyer_Code_PIL: code[10];
        Buyer_Code_PCML: Code[10];
        TDS: Record "TDS Entry";
        Dec: Decimal;
        Dec1: Decimal;
}
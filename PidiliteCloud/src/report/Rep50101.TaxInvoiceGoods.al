report 50101 "Tax Invoice-Goods"
{
    Caption = 'Tax Invoice-Goods';
    DefaultLayout = RDLC;
    RDLCLayout = 'src/reportlayout/SalesInvoice.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            column(InvoiceNo; "No.")
            {

            }
            column(DocDate_SalesInvoiceHeader; Format(SalesInvoiceHeader."Document Date", 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }
            column(TotGSTAmount; TotalGSTAmount)
            {

            }
            column(TotalAmount; TotalAmount)
            {

            }
            column(TotalGSTPercent; TotalGSTPercent)
            {

            }
            column(TCSPercent; TCSPercent)
            {

            }
            column(TCSAmount; TCSAmount)
            {

            }
            column(SGSTAmt; SGSTAmt)
            { }
            column(CGSTAmt; CGSTAmt)
            { }
            column(IGSTAmt; IGSTAmt)
            { }
            column(SGSTPercent; SGSTPercent)
            { }
            column(IGSTPercent; IGSTPercent)
            { }
            column(CGSTPercent; CGSTPercent)
            { }
            column(GrandTotal; GrandTotal)
            {

            }
            column(AmtInWords; RsLbl + NoText[1] + ' ' + NoText[2])
            {
            }
            column(CustomerGST; 'GST IN: ' + CustomerGST)
            {
            }
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3] + ',')
            {
            }
            column(CompanyAddress4; Staterec.Description + ',' + CompanyInfo."Post Code")
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }
            column(CompanyInfo_GST_RegistrationNo; 'GST IN : ' + CompanyInfo."GST Registration No.")
            {
            }
            column(CompanyHomePage; CompanyInfo."Home Page")
            {
            }
            column(CompanyEMail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column(CompanyPhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CustomerAddress1; CustAddr[1])
            {
            }
            column(CustomerAddress2; CustAddr[2])
            {
            }
            column(CustomerAddress3; CustAddr[3])
            {
            }
            column(CustomerAddress4; CustAddr[4])
            {
            }
            column(CustomerAddress5; CustAddr[5])
            {
            }
            column(CustomerAddress6; CustAddr[6])
            {
            }
            column(CustomerAddress7; CustAddr[7])
            {
            }
            column(CustomerAddress8; CustAddr[8])
            {
            }
            column(ShipToAddress1; ShipToAddr[1])
            {
            }
            column(ShipToAddress2; ShipToAddr[2])
            {
            }
            column(ShipToAddress3; ShipToAddr[3])
            {
            }
            column(ShipToAddress4; ShipToAddr[4])
            {
            }
            column(ShipToAddress5; ShipToAddr[5])
            {
            }
            column(ShipToAddress6; ShipToAddr[6])
            {
            }
            column(ShipToAddress7; ShipToAddr[7])
            {
            }
            column(ShipToAddress8; ShipToAddr[8])
            {
            }
            column(SellToContactPhoneNo; SellToContact."Phone No.")
            {
            }
            column(SellToContactMobilePhoneNo; SellToContact."Mobile Phone No.")
            {
            }
            column(SellToContactEmail; SellToContact."E-Mail")
            {
            }
            column(BillToContactPhoneNo; BillToContact."Phone No.")
            {
            }
            column(BillToContactMobilePhoneNo; BillToContact."Mobile Phone No.")
            {
            }
            column(BillToContactEmail; BillToContact."E-Mail")
            {
            }
            column(PaymentTermsDescription; PaymentTerms.Description)
            {
            }
            column(PlaceofSupply; SupplyStateRec.Description)
            { }
            dataitem(SalesInvoiceLine; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = SalesInvoiceHeader;
                DataItemTableView = sorting("Document No.", "Line No.");
                column(SerialNo; SerialNo)
                { }
                column(Document_No_; "Document No.")
                {

                }
                column(Description; Description)
                {

                }
                column(HSN_SAC_Code; "HSN/SAC Code")
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {

                }
                column(Unit_Cost; "Unit Price")
                { }
                column(Line_Amount; "Line Amount")
                {

                }
                trigger OnAfterGetRecord()
                var
                begin
                    SerialNo += 1;
                end;
            }
            trigger OnAfterGetRecord()
            var
            begin
                StateRec.Get(CompanyInfo."State Code");
                SupplyStateRec.Get(State);
                FormatAddressFields(SalesInvoiceHeader);
                if SellToContact.Get("Sell-to Contact No.") then;
                if BillToContact.Get("Bill-to Contact No.") then;
                Clear(TotalAmount);
                Clear(TotalGSTAmount);
                Clear(GrandTotal);
                Clear(CustomerGST);
                if CustomerRec.Get(SalesInvoiceHeader."Sell-to Customer No.") then
                    CustomerGST := CustomerRec."GST Registration No.";
                GetStatisticsAmountPostedInvoice(SalesInvoiceHeader, TCSAmount, TCSPercent);
                GetStatisticsPostedSalesInvAmount(SalesInvoiceHeader, TotalGSTAmount, TotalGSTPercent);
                TotalAmount := TotalAmount + TotalGSTAmount;
                GrandTotal := TotalAmount + TCSAmount;
                /* RepCheck.InitTextVariable;
                RepCheck.FormatNoText(NoText, ROUND(GrandTotal), SalesInvoiceHeader."Currency Code"); */
                AmtInWords.InitTextVariable();
                AmtInWords.FormatNoText(NoText, Abs(GrandTotal), SalesInvoiceHeader."Currency Code");
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }
    }
    trigger OnInitReport()
    var
    begin
        CompanyInfo.SetAutoCalcFields(Picture);
        CompanyInfo.Get();
        Clear(TCSAmount);
        Clear(TotalAmount);
        Clear(GrandTotal);
        Clear(TotalGSTAmount);
        SerialNo := 0;
    end;

    local procedure FormatAddressFields(var SalesInvoiceHeader: Record "Sales Invoice Header")
    var
        LocationRecL: Record Location;
    begin
        FormatAddr.GetCompanyAddr(SalesInvoiceHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.SalesInvBillTo(CustAddr, SalesInvoiceHeader);
        //ShowShippingAddr := FormatAddr.SalesInvShipTo(ShipToAddr, CustAddr, SalesInvoiceHeader);
        if LocationRecL.Get(SalesInvoiceHeader."Location Code") then begin
            ShipToAddr[1] := LocationRecL.Name;
            ShipToAddr[2] := LocationRecL.Address;
            ShipToAddr[3] := LocationRecL."Address 2";
            ShipToAddr[4] := LocationRecL.City + ', ' + LocationRecL."Post Code";
        end;
    end;

    procedure GetStatisticsPostedSalesInvAmount(
               SalesInvHeader: Record "Sales Invoice Header";
               var GSTAmount: Decimal; var GSTPercent: Decimal)
    var
        SalesInvLine: Record "Sales Invoice Line";
    begin
        Clear(GSTAmount);
        Clear(GSTPercent);
        Clear(TotalAmount);
        Clear(SGSTAmt);
        Clear(CGSTAmt);
        Clear(IGSTAmt);
        Clear(IGSTPercent);
        Clear(SGSTPercent);
        Clear(CGSTPercent);

        SalesInvLine.SetRange("Document No.", SalesInvHeader."No.");
        if SalesInvLine.FindSet() then
            repeat
                GSTAmount += GetGSTAmount(SalesInvLine.RecordId());
                GSTPercent += GetGSTPercent(SalesInvLine.RecordId());
                TotalAmount += SalesInvLine."Line Amount" - SalesInvLine."Line Discount Amount";
                GetGSTAmounts(SalesInvLine);
            until SalesInvLine.Next() = 0;
    end;

    local procedure GetGSTAmount(RecID: RecordID): Decimal
    var
        TaxTransactionValue: Record "Tax Transaction Value";
        GSTSetup: Record "GST Setup";
    begin
        if not GSTSetup.Get() then
            exit;

        TaxTransactionValue.SetRange("Tax Record ID", RecID);
        TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
        if GSTSetup."Cess Tax Type" <> '' then
            TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type", GSTSetup."Cess Tax Type")
        else
            TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
        TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
        if not TaxTransactionValue.IsEmpty() then begin
            TaxTransactionValue.CalcSums(Amount);
            TaxTransactionValue.CalcSums(Percent);
            /* if TaxTransactionValue."Value ID" = 6 then begin
                SGSTAmt += TaxTransactionValue.Amount;
                SGSTPercent += TaxTransactionValue.Percent;
            end;
            if TaxTransactionValue."Value ID" = 2 then begin
                CGSTAmt += TaxTransactionValue.Amount;
                CGSTPercent += TaxTransactionValue.Percent;
            end;
            if TaxTransactionValue."Value ID" = 3 then begin
                IGSTAmt += TaxTransactionValue.Amount;
                IGSTPercent += TaxTransactionValue.Percent;
            end; */
        end;

        exit(TaxTransactionValue.Amount);
    end;

    local procedure GetGSTPercent(RecID: RecordID): Decimal
    var
        TaxTransactionValue: Record "Tax Transaction Value";
        GSTSetup: Record "GST Setup";
    begin
        if not GSTSetup.Get() then
            exit;

        TaxTransactionValue.SetRange("Tax Record ID", RecID);
        TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
        if GSTSetup."Cess Tax Type" <> '' then
            TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type", GSTSetup."Cess Tax Type")
        else
            TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
        TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
        if not TaxTransactionValue.IsEmpty() then
            TaxTransactionValue.CalcSums(Percent);

        exit(TaxTransactionValue.Percent);
    end;

    procedure GetStatisticsAmountPostedInvoice(
        SalesInvoiceHeader: Record "Sales Invoice Header";
        var TCSAmount: Decimal; var TCSPercent: Decimal)
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
        TCSManagement: Codeunit "TCS Management";
        i: Integer;
        RecordIDList: List of [RecordID];
    begin
        Clear(TCSAmount);
        Clear(TCSPercent);

        SalesInvoiceLine.SetRange("Document no.", SalesInvoiceHeader."No.");
        if SalesInvoiceLine.FindSet() then
            repeat
                RecordIDList.Add(SalesInvoiceLine.RecordId());
            until SalesInvoiceLine.Next() = 0;

        for i := 1 to RecordIDList.Count() do begin
            TCSAmount += GetTCSAmount(RecordIDList.Get(i));
            TCSPercent += GetTCSPercent(RecordIDList.Get(i));
        end;

        TCSAmount := TCSManagement.RoundTCSAmount(TCSAmount);
    end;

    local procedure GetTCSAmount(RecID: RecordID): Decimal
    var
        TaxTransactionValue: Record "Tax Transaction Value";
        TCSSetup: Record "TCS Setup";
    begin
        if not TCSSetup.Get() then
            exit;

        TaxTransactionValue.SetRange("Tax Record ID", RecID);
        TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
        TaxTransactionValue.SetRange("Tax Type", TCSSetup."Tax Type");
        TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
        if not TaxTransactionValue.IsEmpty() then
            TaxTransactionValue.CalcSums(Amount);

        exit(TaxTransactionValue.Amount);
    end;

    local procedure GetTCSPercent(RecID: RecordID): Decimal
    var
        TaxTransactionValue: Record "Tax Transaction Value";
        TCSSetup: Record "TCS Setup";
    begin
        if not TCSSetup.Get() then
            exit;

        TaxTransactionValue.SetRange("Tax Record ID", RecID);
        TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
        TaxTransactionValue.SetRange("Tax Type", TCSSetup."Tax Type");
        TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
        if not TaxTransactionValue.IsEmpty() then
            TaxTransactionValue.CalcSums(Percent);

        exit(TaxTransactionValue.Percent);
    end;


    local procedure GetGSTAmounts(Salesline: Record "Sales Invoice Line")
    var
        ComponentName: Code[30];
        TaxTransactionValue: Record "Tax Transaction Value";
        GSTSetup: Record "GST Setup";
    begin
        if not GSTSetup.Get() then
            exit;

        ComponentName := GetComponentName(Salesline, GSTSetup);

        if (Salesline.Type <> Salesline.Type::" ") then begin
            TaxTransactionValue.Reset();
            TaxTransactionValue.SetRange("Tax Record ID", Salesline.RecordId);
            TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
            TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
            TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
            if TaxTransactionValue.FindSet() then
                repeat
                    case TaxTransactionValue."Value ID" of
                        6:
                            begin
                                SGSTAmt += Round(TaxTransactionValue.Amount, GetGSTRoundingPrecision(ComponentName));
                                SGSTPercent := TaxTransactionValue.Percent;
                            end;
                        2:
                            begin
                                CGSTAmt += Round(TaxTransactionValue.Amount, GetGSTRoundingPrecision(ComponentName));
                                CGSTPercent := TaxTransactionValue.Percent;
                            end;
                        3:
                            begin
                                IGSTAmt += Round(TaxTransactionValue.Amount, GetGSTRoundingPrecision(ComponentName));
                                IGSTPercent := TaxTransactionValue.Percent;
                            end;
                    end;
                until TaxTransactionValue.Next() = 0;
        end;
    end;

    procedure GetGSTRoundingPrecision(ComponentName: Code[30]): Decimal
    var
        TaxComponent: Record "Tax Component";
        GSTSetup: Record "GST Setup";
        GSTRoundingPrecision: Decimal;
    begin
        if not GSTSetup.Get() then
            exit;
        GSTSetup.TestField("GST Tax Type");

        TaxComponent.SetRange("Tax Type", GSTSetup."GST Tax Type");
        TaxComponent.SetRange(Name, ComponentName);
        TaxComponent.FindFirst();
        if TaxComponent."Rounding Precision" <> 0 then
            GSTRoundingPrecision := TaxComponent."Rounding Precision"
        else
            GSTRoundingPrecision := 1;
        exit(GSTRoundingPrecision);
    end;

    local procedure GetComponentName(SalesLine: Record "Sales Invoice Line";
        GSTSetup: Record "GST Setup"): Code[30]
    var
        ComponentName: Code[30];
    begin
        if GSTSetup."GST Tax Type" = GSTLbl then
            if SalesLine."GST Jurisdiction Type" = SalesLine."GST Jurisdiction Type"::Interstate then
                ComponentName := IGSTLbl
            else
                ComponentName := CGSTLbl
        else
            if GSTSetup."Cess Tax Type" = GSTCESSLbl then
                ComponentName := CESSLbl;
        exit(ComponentName)
    end;

    var
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RepCheck: Report 1401;
        CompanyInfo: Record "Company Information";
        PaymentTerms: Record "Payment Terms";
        SellToContact: Record Contact;
        BillToContact: Record Contact;
        RespCenter: Record "Responsibility Center";
        ShowShippingAddr: Boolean;

        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        NoText: array[2] of Text[500];
        TotalAmount: Decimal;
        TotalGSTAmount: Decimal;
        TotalGSTPercent: Decimal;
        TCSAmount: Decimal;
        GrandTotal: Decimal;
        SerialNo: Integer;
        TCSPercent: Decimal;
        CGSTAmt: Decimal;
        SGSTAmt: Decimal;
        IGSTAmt: Decimal;
        SGSTPercent: Decimal;
        CGSTPercent: Decimal;
        IGSTPercent: Decimal;
        CustomerRec: Record Customer;
        StateRec: Record State;
        CustomerGST: Code[20];
        IGSTLbl: Label 'IGST';
        SGSTLbl: Label 'SGST';
        CGSTLbl: Label 'CGST';
        CESSLbl: Label 'CESS';
        GSTLbl: Label 'GST';
        GSTCESSLbl: Label 'GST CESS';
        RsLbl: Label 'Rs. ';
        AmtInWords: Codeunit "Amount In Words";
        SupplyStateRec: Record State;
}
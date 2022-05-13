unit Economic;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Dialogs, Mask, Buttons,
  Math, DynamicSkinForm, SkinCtrls, SkinBoxCtrls, spMessages;

type
  TEcoForm = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinButton1: TspSkinButton;
    spSkinButton2: TspSkinButton;
    spSkinButton3: TspSkinButton;
    RzComboBox1: TspSkinComboBox;
    spSkinStdLabel1: TspSkinStdLabel;
    spSkinStdLabel2: TspSkinStdLabel;
    spSkinStdLabel3: TspSkinStdLabel;
    spSkinStdLabel4: TspSkinStdLabel;
    spSkinStdLabel5: TspSkinStdLabel;
    spSkinStdLabel6: TspSkinStdLabel;
    spSkinStdLabel7: TspSkinStdLabel;
    spSkinStdLabel8: TspSkinStdLabel;
    spSkinStdLabel9: TspSkinStdLabel;
    spSkinStdLabel10: TspSkinStdLabel;
    spSkinStdLabel11: TspSkinStdLabel;
    ComboBox1: TspSkinComboBox;
    ComboBox2: TspSkinComboBox;
    ComboBox3: TspSkinComboBox;
    ComboBox4: TspSkinComboBox;
    ComboBox5: TspSkinComboBox;
    ComboBox6: TspSkinComboBox;
    ComboBox7: TspSkinComboBox;
    ComboBox8: TspSkinComboBox;
    ComboBox9: TspSkinComboBox;
    ComboBox10: TspSkinComboBox;
    ComboBox11: TspSkinComboBox;
    MaskEdit1: TspSkinMaskEdit;
    MaskEdit2: TspSkinMaskEdit;
    MaskEdit3: TspSkinMaskEdit;
    MaskEdit4: TspSkinMaskEdit;
    MaskEdit5: TspSkinMaskEdit;
    MaskEdit6: TspSkinMaskEdit;
    MaskEdit7: TspSkinMaskEdit;
    MaskEdit8: TspSkinMaskEdit;
    MaskEdit9: TspSkinMaskEdit;
    MaskEdit10: TspSkinMaskEdit;
    MaskEdit11: TspSkinMaskEdit;
    MaskEdit12: TspSkinMaskEdit;
    MaskEdit13: TspSkinMaskEdit;
    MaskEdit14: TspSkinMaskEdit;
    MaskEdit15: TspSkinMaskEdit;
    MaskEdit16: TspSkinMaskEdit;
    MaskEdit17: TspSkinMaskEdit;
    MaskEdit18: TspSkinMaskEdit;
    MaskEdit19: TspSkinMaskEdit;
    MaskEdit20: TspSkinMaskEdit;
    MaskEdit21: TspSkinMaskEdit;
    MaskEdit22: TspSkinMaskEdit;
    MaskEdit23: TspSkinMaskEdit;
    MaskEdit24: TspSkinMaskEdit;
    MaskEdit25: TspSkinMaskEdit;
    MaskEdit26: TspSkinMaskEdit;
    MaskEdit27: TspSkinMaskEdit;
    MaskEdit28: TspSkinMaskEdit;
    MaskEdit29: TspSkinMaskEdit;
    MaskEdit30: TspSkinMaskEdit;
    MaskEdit31: TspSkinMaskEdit;
    MaskEdit32: TspSkinMaskEdit;
    MaskEdit33: TspSkinMaskEdit;
    spSkinLabel1: TspSkinLabel;
    spSkinLabel2: TspSkinLabel;
    spSkinLabel3: TspSkinLabel;
    spSkinLabel4: TspSkinLabel;
    spSkinLabel5: TspSkinLabel;
    spSkinMessage1: TspSkinMessage;
    spSkinStdLabel12: TspSkinStdLabel;
    spSkinStdLabel13: TspSkinStdLabel;
    ComboBox12: TspSkinComboBox;
    ComboBox13: TspSkinComboBox;
    MaskEdit34: TspSkinMaskEdit;
    MaskEdit35: TspSkinMaskEdit;
    MaskEdit36: TspSkinMaskEdit;
    MaskEdit37: TspSkinMaskEdit;
    MaskEdit38: TspSkinMaskEdit;
    MaskEdit39: TspSkinMaskEdit;
    procedure GetEconomicParameters;
    procedure GetDefaultEconomicParameters;
    procedure GetPriceData (var i: integer);
    procedure GetDefaultPriceData (var i: integer);
    procedure EditFile (var Treatment: Integer);
    procedure GetStuffFromDialog(var i: integer);
    procedure SetEconomicDefaults;
    procedure RzComboBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EcoForm : TEcoForm;
  CurrentTreatment : Integer;
  SkipGetStuff : boolean;

implementation

uses Main, GraphFr, DataModFr;

{$R *.DFM}

procedure TEcoForm.GetEconomicParameters;
var
  i,l,k : integer;
begin
  for i := 1 to NTreat do
  begin
    if FileExists (PriceFile) then
    begin
      l := i;
      GetPriceData (l);
      if i = 1 then
      begin
        for k := 1 to NTreat do
        begin
          idat[k,01]   := idat[i,01];
          idat[k,02]   := idat[i,02];
          idat[k,03]   := idat[i,03];
          idat[k,04]   := idat[i,04];
          idat[k,05]   := idat[i,05];
          idat[k,06]   := idat[i,06];
          idat[k,07]   := idat[i,07];
          idat[k,08]   := idat[i,08];
          idat[k,09]   := idat[i,09];
          idat[k,10]   := idat[i,10];
          idat[k,11]   := idat[i,11];
          idat[k,12]   := idat[i,12];
          idat[k,13]   := idat[i,13];
          pdat[k,01,1] := pdat[i,01,1];
          pdat[k,02,1] := pdat[i,02,1];
          pdat[k,03,1] := pdat[i,03,1];
          pdat[k,04,1] := pdat[i,04,1];
          pdat[k,05,1] := pdat[i,05,1];
          pdat[k,06,1] := pdat[i,06,1];
          pdat[k,07,1] := pdat[i,07,1];
          pdat[k,08,1] := pdat[i,08,1];
          pdat[k,09,1] := pdat[i,09,1];
          pdat[k,10,1] := pdat[i,10,1];
          pdat[k,11,1] := pdat[i,11,1];
          pdat[k,12,1] := pdat[i,12,1];
          pdat[k,13,1] := pdat[i,13,1];
          pdat[k,01,2] := pdat[i,01,2];
          pdat[k,02,2] := pdat[i,02,2];
          pdat[k,03,2] := pdat[i,03,2];
          pdat[k,04,2] := pdat[i,04,2];
          pdat[k,05,2] := pdat[i,05,2];
          pdat[k,06,2] := pdat[i,06,2];
          pdat[k,07,2] := pdat[i,07,2];
          pdat[k,08,2] := pdat[i,08,2];
          pdat[k,09,2] := pdat[i,09,2];
          pdat[k,10,2] := pdat[i,10,2];
          pdat[k,11,2] := pdat[i,11,2];
          pdat[k,12,2] := pdat[i,12,2];
          pdat[k,13,2] := pdat[i,13,2];
          pdat[k,01,3] := pdat[i,01,3];
          pdat[k,02,3] := pdat[i,02,3];
          pdat[k,03,3] := pdat[i,03,3];
          pdat[k,04,3] := pdat[i,04,3];
          pdat[k,05,3] := pdat[i,05,3];
          pdat[k,06,3] := pdat[i,06,3];
          pdat[k,07,3] := pdat[i,07,3];
          pdat[k,08,3] := pdat[i,08,3];
          pdat[k,09,3] := pdat[i,09,3];
          pdat[k,10,3] := pdat[i,10,3];
          pdat[k,11,3] := pdat[i,11,3];
          pdat[k,12,3] := pdat[i,12,3];
          pdat[k,13,3] := pdat[i,13,3];
        end;
      end;
    end;
  end;
end;

procedure TEcoForm.GetDefaultEconomicParameters;
var
  i,l : integer;
begin
  for i := 1 to NTreat do
  begin
    if FileExists (DefaultPriceFile) then
    begin
      l := i;
      GetDefaultPriceData (l);
    end;
  end;
end;

procedure TEcoForm.GetPriceData (var i: integer);
var
  f     : textfile;
  s     : string;
  acro  : string[4];
  j,k,m : integer;
  code  : integer;
begin
  assignfile (f,PriceFile);
  reset (f);

  while not eof (f) do
  begin
    readln (f,s);
    j := AnsiPos (':',s);
(*  k := AnsiPos (CCode[i],s); { maybe not i if not all treatments selected } *)
    k := AnsiPos (' '+CCode[i],s); { maybe not i if not all treatments selected }
    if k > 0 then
    begin
      Repeat
        Readln (f,s); { Treatment }
        if (copy (UpperCase (s),1,11) = '* TREATMENT') then
        begin
          val (copy (s,12,4),m,code);
          if m <= i then
          begin
            Readln (f,s); { @PRAM     }
            {$I-}
            Readln (f,acro,idat[m,01],idat[m,02],idat[m,03],idat[m,04],idat[m,05],idat[m,06],
                           idat[m,07],idat[m,08],idat[m,09],idat[m,10],idat[m,11],idat[m,12],idat[m,13]);
            if IOResult <> 0 then
            begin
              spSkinMessage1.MessageDlg('Error reading file treatment '+inttostr(i)+' line 1.', mtInformation,[mbOk], 0);
              Closefile (f); Exit;
            end;
            Readln (f,acro,pdat[m,01,1],pdat[m,02,1],pdat[m,03,1],pdat[m,04,1],pdat[m,05,1],pdat[m,06,1],
                           pdat[m,07,1],pdat[m,08,1],pdat[m,09,1],pdat[m,10,1],pdat[m,11,1],pdat[m,12,1],pdat[m,13,1]);
            if IOResult <> 0 then
            begin
              spSkinMessage1.MessageDlg('Error reading file treatment '+inttostr(i)+' line 2.', mtInformation,[mbOk], 0);
              Closefile (f); Exit;
            end;
            Readln (f,acro,pdat[m,01,2],pdat[m,02,2],pdat[m,03,2],pdat[m,04,2],pdat[m,05,2],pdat[m,06,2],
                           pdat[m,07,2],pdat[m,08,2],pdat[m,09,2],pdat[m,10,2],pdat[m,11,2],pdat[m,12,2],pdat[m,13,2]);
            if IOResult <> 0 then
            begin
              spSkinMessage1.MessageDlg('Error reading file treatment '+inttostr(i)+' line 3.', mtInformation,[mbOk], 0);
              Closefile (f); Exit;
            end;
            Readln (f,acro,pdat[m,01,3],pdat[m,02,3],pdat[m,03,3],pdat[m,04,3],pdat[m,05,3],pdat[m,06,3],
                           pdat[m,07,3],pdat[m,08,3],pdat[m,09,3],pdat[m,10,3],pdat[m,11,3],pdat[m,12,3],pdat[m,13,3]);
            if IOResult <> 0 then
            begin
              spSkinMessage1.MessageDlg('Error reading file treatment '+inttostr(i)+' line 4.', mtInformation,[mbOk], 0);
              Closefile (f); Exit;
            end;
            {$I+}
             {  done := true; }
            if m = i then
            begin
              CloseFile (f);
              exit;
            end;
          end;
        end;
      until eof(f);
     { CloseFile (f); }
    end;
  end;
  CloseFile (f);
end;

procedure TEcoForm.GetDefaultPriceData (var i: integer);
var
  f     : textfile;
  s     : string;
  acro  : string[4];
  j,k,m : integer;
  code  : integer;
begin
  assignfile (f,DefaultPriceFile);
  reset (f);
  while not eof (f) do
  begin
    readln (f,s);
    j := AnsiPos (':',s);
 (* k := AnsiPos (CCode[i],s); { maybe not i if not all treatments selected } *)
    k := AnsiPos (' '+CCode[i],s); { maybe not i if not all treatments selected }
    if (k > 0) and (j = 0) then
    begin
    {  done := false;  }
      Repeat
        Readln (f,s); { Treatment }
        if (copy (UpperCase (s),1,11) = '* TREATMENT') then
        begin
          val (copy (s,12,4),m,code);
          if m = 1 then
          begin   
            Readln (f,s); { @PRAM     }
            {$I-}
            Readln (f,acro,idat[i,01],idat[i,02],idat[i,03],idat[i,04],idat[i,05],idat[i,06],
                           idat[i,07],idat[i,08],idat[i,09],idat[i,10],idat[i,11],idat[i,12],idat[i,13]);
            if IOResult <> 0 then
            begin
              spSkinMessage1.MessageDlg('Error reading file treatment '+inttostr(m)+' line 1.', mtInformation,[mbOk], 0);
              Closefile (f); Exit;
            end;
            Readln (f,acro,pdat[i,01,1],pdat[i,02,1],pdat[i,03,1],pdat[i,04,1],pdat[i,05,1],pdat[i,06,1],
                           pdat[i,07,1],pdat[i,08,1],pdat[i,09,1],pdat[i,10,1],pdat[i,11,1],pdat[i,12,1],pdat[i,13,1]);
            if IOResult <> 0 then
            begin
              spSkinMessage1.MessageDlg('Error reading file treatment '+inttostr(m)+' line 1.', mtInformation,[mbOk], 0);
              Closefile (f); Exit;
            end;
            Readln (f,acro,pdat[i,01,2],pdat[i,02,2],pdat[i,03,2],pdat[i,04,2],pdat[i,05,2],pdat[i,06,2],
                           pdat[i,07,2],pdat[i,08,2],pdat[i,09,2],pdat[i,10,2],pdat[i,11,2],pdat[i,12,2],pdat[i,13,2]);
            if IOResult <> 0 then
            begin
              spSkinMessage1.MessageDlg('Error reading file treatment '+inttostr(m)+' line 1.', mtInformation,[mbOk], 0);
              Closefile (f); Exit;
            end;
            Readln (f,acro,pdat[i,01,3],pdat[i,02,3],pdat[i,03,3],pdat[i,04,3],pdat[i,05,3],pdat[i,06,3],
                           pdat[i,07,3],pdat[i,08,3],pdat[i,09,3],pdat[i,10,3],pdat[i,11,3],pdat[i,12,3],pdat[i,13,3]);
            if IOResult <> 0 then
            begin
              spSkinMessage1.MessageDlg('Error reading file treatment '+inttostr(m)+' line 1.', mtInformation,[mbOk], 0);
              Closefile (f); Exit;
            end;
            {$I+}
            CloseFile (f);
            exit;
          end;
        end;
      until eof(f);
      CloseFile (f);
    end;
  end;
end;

procedure TEcoForm.EditFile (var Treatment: Integer);
var
  dum : string;
  i : integer;
begin
  i := Treatment;
  combobox1.ItemIndex  := (idat[i,01] + 1);  combobox1.Text  := combobox1.Items.Strings [(idat[i,01]+1)];
  combobox2.ItemIndex  := (idat[i,02] + 1);  combobox2.Text  := combobox2.Items.Strings [(idat[i,02]+1)];
  combobox3.ItemIndex  := (idat[i,03] + 1);  combobox3.Text  := combobox3.Items.Strings [(idat[i,03]+1)];
  combobox4.ItemIndex  := (idat[i,04] + 1);  combobox4.Text  := combobox4.Items.Strings [(idat[i,04]+1)];
  combobox5.ItemIndex  := (idat[i,05] + 1);  combobox5.Text  := combobox5.Items.Strings [(idat[i,05]+1)];
  combobox6.ItemIndex  := (idat[i,06] + 1);  combobox6.Text  := combobox6.Items.Strings [(idat[i,06]+1)];
  combobox7.ItemIndex  := (idat[i,07] + 1);  combobox7.Text  := combobox7.Items.Strings [(idat[i,07]+1)];
  combobox8.ItemIndex  := (idat[i,08] + 1);  combobox8.Text  := combobox8.Items.Strings [(idat[i,08]+1)];
  combobox9.ItemIndex  := (idat[i,09] + 1);  combobox9.Text  := combobox9.Items.Strings [(idat[i,09]+1)];
  combobox10.ItemIndex := (idat[i,10] + 1);  combobox10.Text := combobox10.Items.Strings[(idat[i,10]+1)];
  combobox11.ItemIndex := (idat[i,11] + 1);  combobox11.Text := combobox11.Items.Strings[(idat[i,11]+1)];
  combobox12.ItemIndex := (idat[i,12] + 1);  combobox12.Text := combobox12.Items.Strings[(idat[i,12]+1)];
  combobox13.ItemIndex := (idat[i,13] + 1);  combobox13.Text := combobox13.Items.Strings[(idat[i,13]+1)];
  str (pdat[i,1, 1]:8:2,dum); maskedit1.text  := dum;    
  str (pdat[i,2, 1]:8:2,dum); maskedit2.text  := dum;
  str (pdat[i,3, 1]:8:2,dum); maskedit3.text  := dum;
  str (pdat[i,4, 1]:8:2,dum); maskedit4.text  := dum;
  str (pdat[i,5, 1]:8:2,dum); maskedit5.text  := dum;
  str (pdat[i,6, 1]:8:2,dum); maskedit6.text  := dum;
  str (pdat[i,7, 1]:8:2,dum); maskedit7.text  := dum;
  str (pdat[i,8, 1]:8:2,dum); maskedit8.text  := dum;
  str (pdat[i,9, 1]:8:2,dum); maskedit9.text  := dum;
  str (pdat[i,10,1]:8:2,dum); maskedit10.text := dum;
  str (pdat[i,11,1]:8:2,dum); maskedit11.text := dum;
  str (pdat[i,12,1]:8:2,dum); maskedit34.text := dum;
  str (pdat[i,13,1]:8:2,dum); maskedit35.text := dum;
  str (pdat[i,1, 2]:8:2,dum); maskedit12.text := dum;
  str (pdat[i,2, 2]:8:2,dum); maskedit13.text := dum;
  str (pdat[i,3, 2]:8:2,dum); maskedit14.text := dum;
  str (pdat[i,4, 2]:8:2,dum); maskedit15.text := dum;
  str (pdat[i,5, 2]:8:2,dum); maskedit16.text := dum;
  str (pdat[i,6, 2]:8:2,dum); maskedit17.text := dum;
  str (pdat[i,7, 2]:8:2,dum); maskedit18.text := dum;
  str (pdat[i,8, 2]:8:2,dum); maskedit19.text := dum;
  str (pdat[i,9, 2]:8:2,dum); maskedit20.text := dum;
  str (pdat[i,10,2]:8:2,dum); maskedit21.text := dum;
  str (pdat[i,11,2]:8:2,dum); maskedit22.text := dum;
  str (pdat[i,12,2]:8:2,dum); maskedit36.text := dum;
  str (pdat[i,13,2]:8:2,dum); maskedit37.text := dum;
  str (pdat[i,1, 3]:8:2,dum); maskedit23.text := dum;
  str (pdat[i,2, 3]:8:2,dum); maskedit24.text := dum;
  str (pdat[i,3, 3]:8:2,dum); maskedit25.text := dum;
  str (pdat[i,4, 3]:8:2,dum); maskedit26.text := dum;
  str (pdat[i,5, 3]:8:2,dum); maskedit27.text := dum;
  str (pdat[i,6, 3]:8:2,dum); maskedit28.text := dum;
  str (pdat[i,7, 3]:8:2,dum); maskedit29.text := dum;
  str (pdat[i,8, 3]:8:2,dum); maskedit30.text := dum;
  str (pdat[i,9, 3]:8:2,dum); maskedit31.text := dum;
  str (pdat[i,10,3]:8:2,dum); maskedit32.text := dum;
  str (pdat[i,11,3]:8:2,dum); maskedit33.text := dum;
  str (pdat[i,12,3]:8:2,dum); maskedit38.text := dum;
  str (pdat[i,13,3]:8:2,dum); maskedit39.text := dum;
end;

procedure TEcoForm.GetStuffFromDialog (var i: integer);
var
  code : integer;
begin
  if SkipGetStuff then Exit;
  idat[i,01] := combobox1.ItemIndex  - 1;
  idat[i,02] := combobox2.ItemIndex  - 1;
  idat[i,03] := combobox3.ItemIndex  - 1;
  idat[i,04] := combobox4.ItemIndex  - 1;
  idat[i,05] := combobox5.ItemIndex  - 1;
  idat[i,06] := combobox6.ItemIndex  - 1;
  idat[i,07] := combobox7.ItemIndex  - 1;
  idat[i,08] := combobox8.ItemIndex  - 1;
  idat[i,09] := combobox9.ItemIndex  - 1;
  idat[i,10] := combobox10.ItemIndex - 1;
  idat[i,11] := combobox11.ItemIndex - 1;
  idat[i,12] := combobox12.ItemIndex - 1;
  idat[i,13] := combobox13.ItemIndex - 1;

  val (maskedit1.text, pdat[i, 1,1],code);
  val (maskedit2.text, pdat[i, 2,1],code);
  val (maskedit3.text, pdat[i, 3,1],code);
  val (maskedit4.text, pdat[i, 4,1],code);
  val (maskedit5.text, pdat[i, 5,1],code);
  val (maskedit6.text, pdat[i, 6,1],code);
  val (maskedit7.text, pdat[i, 7,1],code);
  val (maskedit8.text, pdat[i, 8,1],code);
  val (maskedit9.text, pdat[i, 9,1],code);
  val (maskedit10.text,pdat[i,10,1],code);
  val (maskedit11.text,pdat[i,11,1],code);
  val (maskedit34.text,pdat[i,12,1],code);
  val (maskedit35.text,pdat[i,13,1],code);
  val (maskedit12.text,pdat[i, 1,2],code);
  val (maskedit13.text,pdat[i, 2,2],code);
  val (maskedit14.text,pdat[i, 3,2],code);
  val (maskedit15.text,pdat[i, 4,2],code);
  val (maskedit16.text,pdat[i, 5,2],code);
  val (maskedit17.text,pdat[i, 6,2],code);
  val (maskedit18.text,pdat[i, 7,2],code);
  val (maskedit19.text,pdat[i, 8,2],code);
  val (maskedit20.text,pdat[i, 9,2],code);
  val (maskedit21.text,pdat[i,10,2],code);
  val (maskedit22.text,pdat[i,11,2],code);
  val (maskedit36.text,pdat[i,12,2],code);
  val (maskedit37.text,pdat[i,13,2],code);
  val (maskedit23.text,pdat[i, 1,3],code);
  val (maskedit24.text,pdat[i, 2,3],code);
  val (maskedit25.text,pdat[i, 3,3],code);
  val (maskedit26.text,pdat[i, 4,3],code);
  val (maskedit27.text,pdat[i, 5,3],code);
  val (maskedit28.text,pdat[i, 6,3],code);
  val (maskedit29.text,pdat[i, 7,3],code);
  val (maskedit30.text,pdat[i, 8,3],code);
  val (maskedit31.text,pdat[i, 9,3],code);
  val (maskedit32.text,pdat[i,10,3],code);
  val (maskedit33.text,pdat[i,11,3],code);
  val (maskedit38.text,pdat[i,12,3],code);
  val (maskedit39.text,pdat[i,13,3],code);
end;

procedure TEcoForm.SetEconomicDefaults;
begin
  combobox1.ItemIndex  := 4; combobox1.Text  := combobox1.Items.Strings[4];
  combobox2.ItemIndex  := 1; combobox2.Text  := combobox2.Items.Strings[1];
  combobox3.ItemIndex  := 1; combobox3.Text  := combobox3.Items.Strings[1];
  combobox4.ItemIndex  := 1; combobox4.Text  := combobox4.Items.Strings[1];
  combobox5.ItemIndex  := 1; combobox5.Text  := combobox5.Items.Strings[1];
  combobox6.ItemIndex  := 1; combobox6.Text  := combobox6.Items.Strings[1];
  combobox7.ItemIndex  := 1; combobox7.Text  := combobox7.Items.Strings[1];
  combobox8.ItemIndex  := 1; combobox8.Text  := combobox8.Items.Strings[1];
  combobox9.ItemIndex  := 0; combobox9.Text  := combobox9.Items.Strings[0];
  combobox10.ItemIndex := 0; combobox10.Text := combobox10.Items.Strings[0];
  combobox11.ItemIndex := 0; combobox11.Text := combobox11.Items.Strings[0];
  combobox12.ItemIndex := 0; combobox12.Text := combobox12.Items.Strings[0];
  combobox13.ItemIndex := 0; combobox13.Text := combobox13.Items.Strings[0];
end;

procedure TEcoForm.RzComboBox1Click(Sender: TObject);
var
  i : integer;
begin
  if rzComboBox1.ItemIndex = -1 then rzComboBox1.ItemIndex := 0;
  GetStuffFromDialog (CurrentTreatment);
  CurrentTreatment := RzComboBox1.Itemindex + 1;
  i := RzComboBox1.Itemindex + 1;
  CurrentTreatment := i;
  EditFile (i);
end;

procedure TEcoForm.FormShow(Sender: TObject);
begin
  CurrentTreatment := 1;
  SkipGetStuff := false;
end;

procedure TEcoForm.BitBtn1Click(Sender: TObject);
begin
  GetStuffFromDialog (CurrentTreatment);
end;

procedure TEcoForm.SpeedButton1Click(Sender: TObject);
var
  i,code : integer;
begin
  if spSkinMessage1.MessageDlg('This will apply the current values to ALL treatments.  Continue?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    for i := 1 to NTreat do
    begin
      idat[i,01] := combobox1.ItemIndex  - 1;
      idat[i,02] := combobox2.ItemIndex  - 1;
      idat[i,03] := combobox3.ItemIndex  - 1;
      idat[i,04] := combobox4.ItemIndex  - 1;
      idat[i,05] := combobox5.ItemIndex  - 1;
      idat[i,06] := combobox6.ItemIndex  - 1;
      idat[i,07] := combobox7.ItemIndex  - 1;
      idat[i,08] := combobox8.ItemIndex  - 1;
      idat[i,09] := combobox9.ItemIndex  - 1;
      idat[i,10] := combobox10.ItemIndex - 1;
      idat[i,11] := combobox11.ItemIndex - 1;
      idat[i,12] := combobox12.ItemIndex - 1;
      idat[i,13] := combobox13.ItemIndex - 1;

      val (maskedit1.text, pdat[i, 1,1],code);
      val (maskedit2.text, pdat[i, 2,1],code);
      val (maskedit3.text, pdat[i, 3,1],code);
      val (maskedit4.text, pdat[i, 4,1],code);
      val (maskedit5.text, pdat[i, 5,1],code);
      val (maskedit6.text, pdat[i, 6,1],code);
      val (maskedit7.text, pdat[i, 7,1],code);
      val (maskedit8.text, pdat[i, 8,1],code);
      val (maskedit9.text, pdat[i, 9,1],code);
      val (maskedit10.text,pdat[i,10,1],code);
      val (maskedit11.text,pdat[i,11,1],code);
      val (maskedit34.text,pdat[i,12,1],code);
      val (maskedit35.text,pdat[i,13,1],code);
      val (maskedit12.text,pdat[i, 1,2],code);
      val (maskedit13.text,pdat[i, 2,2],code);
      val (maskedit14.text,pdat[i, 3,2],code);
      val (maskedit15.text,pdat[i, 4,2],code);
      val (maskedit16.text,pdat[i, 5,2],code);
      val (maskedit17.text,pdat[i, 6,2],code);
      val (maskedit18.text,pdat[i, 7,2],code);
      val (maskedit19.text,pdat[i, 8,2],code);
      val (maskedit20.text,pdat[i, 9,2],code);
      val (maskedit21.text,pdat[i,10,2],code);
      val (maskedit22.text,pdat[i,11,2],code);
      val (maskedit36.text,pdat[i,12,2],code);
      val (maskedit37.text,pdat[i,13,2],code);
      val (maskedit23.text,pdat[i, 1,3],code);
      val (maskedit24.text,pdat[i, 2,3],code);
      val (maskedit25.text,pdat[i, 3,3],code);
      val (maskedit26.text,pdat[i, 4,3],code);
      val (maskedit27.text,pdat[i, 5,3],code);
      val (maskedit28.text,pdat[i, 6,3],code);
      val (maskedit29.text,pdat[i, 7,3],code);
      val (maskedit30.text,pdat[i, 8,3],code);
      val (maskedit31.text,pdat[i, 9,3],code);
      val (maskedit32.text,pdat[i,10,3],code);
      val (maskedit33.text,pdat[i,11,3],code);
      val (maskedit38.text,pdat[i,12,3],code);
      val (maskedit39.text,pdat[i,13,3],code);
    end;
  end;
end;

procedure TEcoForm.FormCreate(Sender: TObject);
begin
  CurrentTreatment := 1;
  SkipGetStuff := true;
end;

end.

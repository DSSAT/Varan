unit Multi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SkinCtrls, SkinBoxCtrls, DynamicSkinForm, StdCtrls, Mask,
  spSkinShellCtrls, ComCtrls;

type
  TMultiTrt = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinCheckListBox1: TspSkinCheckListBox;
    spSkinStdLabel1: TspSkinStdLabel;
    spSkinButton1: TspSkinButton;
    spSkinButton2: TspSkinButton;
    Options: TspSkinCheckListBox;
    spSkinStatusBar1: TspSkinStatusBar;
    spSkinStatusPanel1: TspSkinStatusPanel;
    spSkinGroupBox1: TspSkinGroupBox;
    spSkinScrollBar1: TspSkinScrollBar;
    spSkinListView1: TspSkinListView;
    spSkinFileEdit1: TspSkinEdit;
    procedure FormShow(Sender: TObject);
    procedure spSkinButton2Click(Sender: TObject);
    procedure spSkinButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MultiTrt: TMultiTrt;

implementation

uses Main, uExportExcel, DataModFr;

{$R *.DFM}

procedure TMultiTrt.FormShow(Sender: TObject);
var
  s,t : string;
  f   : TextFile;
begin
  if spSkinCheckListBox1.Items.Count > 0 then
  begin
    s := ExtractFileName (spSkinCheckListBox1.Items.Strings[0]);
    if FileExists (spSkinCheckListBox1.Items.Strings[0]) then
    begin
      AssignFile (f,spSkinCheckListBox1.Items.Strings[0]);
      reset (f);
      Readln (f,t);
      spSkinFileEdit1.Text := ChangeFileExt (copy (t,23,8),'.dbf');
    end else
      spSkinFileEdit1.Text := ChangeFileExt(s,'.dbf');
  end;
  Options.Checked[4] := true;
end;

procedure TMultiTrt.spSkinButton2Click(Sender: TObject);
begin
  Exit;
end;

procedure TMultiTrt.spSkinButton1Click(Sender: TObject);
var   
  i,j        : integer;
  ReportFile : string;
  fname      : string;
  EffTrt,ET  : string;
  EffVal,EV  : double;
  FirstTime  : Integer;
begin
  FirstTime     := 0;
  Screen.Cursor := crHourGlass;
  spSkinStatusBar1.Visible := true;

  for i := 0 to spSkinCheckListBox1.Items.Count - 1 do
  begin
    spSkinStatuspanel1.Caption := ExtractFileName (spSkinCheckListBox1.Items.Strings[i]) +' '+
                                  inttostr (i)+' of '+ inttostr (spSkinCheckListBox1.Items.Count - 1);
    spSkinStatusPanel1.Refresh;
    if spSkinCheckListBox1.Checked[i] then
    begin
      Inc (FirstTime);
      fName      := spSkinCheckListBox1.Items.Strings[i];
      FileLoaded := true;
      SNSFile    := fName;

      MainForm.ReadSNSHeader (SNSFile);
      MainForm.ReadSNSFile (SNSFile);
      MainForm.Caption := 'Seasonal Analysis : '+SNSFile;
      MainForm.LMDMruList1.Add (SNSFile);
      MainForm.LoadPriceFile;
      MainForm.SpeedButton11Click (self);


      if FirstTime = 1 then
      begin
        ReportFile := spSkinFileEdit1.Text;
        MainForm.CreateOutputTable (ReportFile);
        MainForm.Table1.Active := true;
        MainForm.Table1.First;
        MainForm.ReadSNSHeader (SNSFile);
        MainForm.ReadSNSFile (SNSFile);
      end;

      MainForm.Table1.Edit;
      MainForm.Table1.Fields[0].AsString := ExtractFileName (fName);
      MainForm.Table1.Edit;
      MainForm.Table1.Fields[1].AsString := WSTA;
      MainForm.Table1.Edit;
      MainForm.Table1.Fields[2].AsString := IDSOIL;

      EffVal := -1000.0;
      for j := 1 to NTreat do
      begin
        if Effish[j] = 'Yes' then
        begin
          ET := tnam[j];
          EV := adj[j];
          if EV > EffVal then
          begin
            EffVal := EV;
            EffTrt := tnam[j];
          end;
        end;
      end;

      MainForm.Table1.Edit;
      MainForm.Table1.Fields[3].AsString  := trim(EffTrt);
      MainForm.Table1.Append;
    end;
  end;

  MainForm.Table1.Active := false;    

  spSkinStatusBar1.Visible := false;
  Screen.Cursor := crDefault;
  if MainForm.ABSDatabase1.TableExists (ReportFile) then
     ExportToExcel(MainForm.DataSource1,  Options.Checked[5], spSkinStatusBar1);
end;

end.

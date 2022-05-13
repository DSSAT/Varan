unit SummaryFr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, DynamicSkinForm, SkinCtrls, SkinGrids;

type
  TSummary = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinButton1: TspSkinButton;
    spSkinPanel1: TspSkinPanel;
    spSkinScrollBar1: TspSkinScrollBar;
    rzListView2: TspSkinListView;
    spSkinStringGrid1: TspSkinStringGrid;
    procedure SetupListView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Summary: TSummary;

implementation

uses  Main, GraphFr, DataModFr;

{$R *.DFM}

procedure TSummary.SetupListView;
var
  ListItem : TListItem;
  i : integer;
  g : TDateTime;
  s : string;
begin
  RzListView2.Items.Clear;
  for i := 0 to NTreat - 1 do
  begin
    with RzListView2 do
    begin
      ListItem := items.Add;
      listitem.Caption := Inttostr (MTR[i+1]);
      ListItem.SubItems.Add (TNAM[i+1]);
      ListItem.SubItems.Add (FNAM[i+1]);
      ListItem.SubItems.Add (IntToStr (NReps));
      ListItem.SubItems.Add (CCODE[i+1]);
    end;
  end;
  
  spSkinStringGrid1.ColWidths[1] := 306;
  spSkinStringGrid1.Cells[0,0] := 'Experiment Title';
  spSkinStringGrid1.Cells[1,0] :=  TrimLeft(ExpTitle);
  spSkinStringGrid1.Cells[0,1] := 'Experiment Code';
  spSkinStringGrid1.Cells[1,1] :=  ExpCode;
  spSkinStringGrid1.Cells[0,2] := 'Crop Group';
  spSkinStringGrid1.Cells[1,2] :=  CG;
  spSkinStringGrid1.Cells[0,3] := 'Runs';
  spSkinStringGrid1.Cells[1,3] :=  IntToStr (NRuns);
  spSkinStringGrid1.Cells[0,4] := 'Replications';
  spSkinStringGrid1.Cells[1,4] :=  IntToStr (NReps);
  g := FileDateToDateTime (FileAge(SNSFile));
  s := FormatDateTime('hh:mm:ss, ddd, d mmmm yyyy', g);
  spSkinStringGrid1.Cells[0,5] := 'File Creation date';
  spSkinStringGrid1.Cells[1,5] :=  s;

  RzListView2.Update;

  MainForm.RzCheckList1.Clear;
  MainForm.RzCheckList3.Clear;

  for i := 0 to NTreat - 1 do
  begin
    MainForm.RzCheckList1.Items.Add (TNAM[i+1]);
    MainForm.RzCheckList1.Checked[i] := true;
    MainForm.RzCheckList3.Items.Add (TNAM[i+1]);
    MainForm.RzCheckList3.Checked[i] := true;
  end;
end;

end.

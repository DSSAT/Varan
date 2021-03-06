unit uFieldSelection;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, CheckLst, Menus, DynamicSkinForm, SkinCtrls,
  SkinBoxCtrls;

type
  TfrmFieldSelection = class(TForm)
    ButtonsPnl: TPanel;
    MainPnl: TPanel;
    SelectAllBtn: TButton;
    UnselectAllBtn: TButton;
    OkBtn: TButton;
    CancelBtn: TButton;
    ExportLimitCB: TComboBox;
    OptionsMenu: TPopupMenu;
    Invertselection1: TMenuItem;
    spDynamicSkinForm1: TspDynamicSkinForm;
    FieldList: TspSkinCheckListBox;
    spSkinStdLabel1: TspSkinStdLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectAllBtnClick(Sender: TObject);
    procedure UnselectAllBtnClick(Sender: TObject);
    procedure Invertselection1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SetChecks( status : integer );
  public
    { Public declarations }
end;

var
   frmFieldSelection: TfrmFieldSelection;

implementation

{$R *.DFM}

Uses Main;

procedure TfrmFieldSelection.FormClose(Sender: TObject;
	var Action: TCloseAction);
begin
//	KrqSetFormPosition(self, fp_ALL);
end;

procedure TfrmFieldSelection.SetChecks( status : integer );
var
  HlpCnt : integer;
  Stat   : boolean;
begin
  for HlpCnt := 0 to FieldList.Items.Count-1 do
  begin
    Stat := FieldList.Checked[HlpCnt];
    case status of
      0 : Stat := True;
      1 : Stat := False;
      2 : Stat := not(Stat);
    end;
    FieldList.Checked[HlpCnt] := Stat;
  end;
end;

procedure TfrmFieldSelection.SelectAllBtnClick(Sender: TObject);
begin
  SetChecks(0);
end;

procedure TfrmFieldSelection.UnselectAllBtnClick(Sender: TObject);
begin
  SetChecks(1);
end;

procedure TfrmFieldSelection.Invertselection1Click(Sender: TObject);
begin
  SetChecks(2);
end;

end.

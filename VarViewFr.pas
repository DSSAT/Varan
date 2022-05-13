unit VarViewFr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, DynamicSkinForm, SkinCtrls;

type
  TVarViewFrm = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinButton1: TspSkinButton;
    spSkinPanel1: TspSkinPanel;
    spSkinScrollBar1: TspSkinScrollBar;
    rzListView2: TspSkinListView;
    procedure SetupListView;
    procedure SetupEcoView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VarViewFrm: TVarViewFrm;

implementation

uses Main, DataModFr;

{$R *.DFM}

procedure TVarViewFrm.SetupListView;
var
  ListItem : TListItem;
  i : integer;
begin
  RzListView2.Items.Clear;
  for i := 0 to NTreat - 1 do
  begin
    with RzListView2 do
    begin
      ListItem := items.Add;
      listitem.Caption := Inttostr (MTR[i+1]);
      ListItem.SubItems.Add (Tnam [i+1]);
      ListItem.SubItems.Add (Fnam [i+1]);
      ListItem.SubItems.Add (Ccode[i+1]);
      ListItem.SubItems.Add (Format ('%9.1f',[pardat[1,i+1]]));
      ListItem.SubItems.Add (Format ('%9.1f',[pardat[2,i+1]]));
      ListItem.SubItems.Add (Format ('%9.1f',[pardat[3,i+1]]));
      ListItem.SubItems.Add (Format ('%9.1f',[pardat[9,i+1]]));
    end;
  end;
  RzListView2.Update;
end;

procedure TVarViewFrm.SetupEcoView;
var
  ListItem : TListItem;
  i : integer;
begin
  RzListView2.Items.Clear;
  for i := 0 to NTreat - 1 do
  begin
    with RzListView2 do
    begin
      ListItem := items.Add;
      listitem.Caption := Inttostr (MTR[i+1]);
      ListItem.SubItems.Add (Tnam [i+1]);
      ListItem.SubItems.Add (Fnam [i+1]);
      ListItem.SubItems.Add (Ccode[i+1]);
      ListItem.SubItems.Add (Format ('%9.1f',[xmu[1,i+1]]));
      ListItem.SubItems.Add (Format ('%9.1f',[xmu[2,i+1]]));
      ListItem.SubItems.Add (Format ('%9.1f',[xmu[3,i+1]]));
      ListItem.SubItems.Add (Format ('%9.1f',[xmu[9,i+1]]));
    end;
  end;
  RzListView2.Update;
end;

end.

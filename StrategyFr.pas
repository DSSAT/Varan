unit StrategyFr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, DynamicSkinForm, SkinCtrls;

type
  TStrategy = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinButton1: TspSkinButton;
    spSkinStdLabel1: TspSkinStdLabel;
    spSkinStdLabel2: TspSkinStdLabel;
    spSkinPanel1: TspSkinPanel;
    spSkinScrollBar1: TspSkinScrollBar;
    RzListView2: TspSkinListView;
    procedure SetupListView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Strategy: TStrategy;

implementation

uses  Main, DataModFr;

{$R *.DFM}

procedure TStrategy.SetupListView;
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
      ListItem.SubItems.Add (Tnam[i+1]);
      ListItem.SubItems.Add (Fnam[i+1]);
      ListItem.SubItems.Add (Format ('%9.1f',[xmu[1,i+1]]));
      ListItem.SubItems.Add (Format ('%9.1f',[adj[i+1]]));
      ListItem.SubItems.Add (Effish[i+1]);
    end;
  end;
  RzListView2.Update;
end;

end.

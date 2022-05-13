unit SequenceViewFr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SkinCtrls, ComCtrls, DynamicSkinForm, SkinBoxCtrls, Vcl.StdCtrls;

type
  TComboBox = class(vcl.StdCtrls.TComboBox)
  protected
    procedure WndProc(var Message: TMessage); override;
  end;

  TSequenceView = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinButton1: TspSkinButton;
    spSkinButton2: TspSkinButton;
    spSkinPanel1: TspSkinPanel;
    spSkinScrollBar1: TspSkinScrollBar;
    rzListView2: TspSkinListView;
    spSkinPanel2: TspSkinPanel;
    spSkinScrollBar2: TspSkinScrollBar;
    rzListView3: TspSkinListView;
    Mode: TspSkinRadioGroup;
    XCombo: TComboBox;
    YCombo: TComboBox;
    procedure InitListView;
    procedure FormShow(Sender: TObject);
    procedure spSkinButton2Click(Sender: TObject);
    procedure XComboChange(Sender: TObject);
    procedure YComboChange(Sender: TObject);
    procedure ModeClick(Sender: TObject);
    procedure XComboDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure XComboCloseUp(Sender: TObject);
    procedure YComboCloseUp(Sender: TObject);
    procedure YComboDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SequenceView: TSequenceView;

implementation

uses Main, Frmcfit, Stats, DataModFr;

{$R *.DFM}

procedure TSequenceView.InitListView;
begin
  RzListView2.Items.Clear;
  XCombo.Items.Clear;
  YCombo.Items.Clear;
end;

procedure TSequenceView.FormShow(Sender: TObject);
begin
  rzListView2.AlphaSort;
  SequenceView.XCombo.ItemIndex := 0;
  SequenceView.XComboChange(Sender);
  SequenceView.YCombo.ItemIndex := 0;
  SequenceView.YComboChange(Sender);
end;

procedure TSequenceView.spSkinButton2Click(Sender: TObject);
begin
  frmMain.Caption   := 'Regression of '+ Trim (XCombo.Text) + ' on '+ Trim (YCombo.Text);
  frmMain.RChart1.Scale1X.Caption :=  Trim (XCombo.Text);
  frmMain.RChart2.Scale1X.Caption :=  Trim (XCombo.Text);
  frmMain.Showmodal;
end;

procedure TSequenceView.XComboChange(Sender: TObject);
var
  i,j,k,x,l,d : integer;
  index,km    : integer;
  code        : integer;
  ListItem    : TListItem;
  Daily       : array[0..5000] of real;
begin
   {
   Show analysis file
   }
   d := 0;
   j := XCombo.Items.Count;
   for index := 0 to j - 1 do
   begin
     x := 1;
     for i := 0 to j-1 do
     begin
       k := HeaderOrd[index + 1];
       if HeaderOrd[i+1] < k then inc (x);
     end;

     if Index = XCombo.ItemIndex then
     begin
       for km := 1 to NTreat do
       begin
         for l := 1 to ParVars do Pars[l] := 0.0;

         for l := 1 to NReps do
         begin
           TukDat[l] := OutDat[x,l+(km-1)*Nreps];
           Daily[d]  := OutDat[x,l+(km-1)*Nreps];
           inc (d);
         end;
         Stats.Tukey (TukDat,NReps,Pars,Code);

         for l := 1 to ParVars do
           ParDat [l,km] := Pars[l];
       end;

       RzListView2.Items.Clear;
        if MainForm.rzchecklist2.ItemEnabled[index] then
           begin
           for i := 0 to NTreat - 1 do
           begin
             with RzListView2 do
             begin
              ListItem := items.Add;
              listitem.Caption := Format ('%9.1f',[pardat[1,i+1]]);
            end;
          end;
       end;

      RzListView2.Update;
      {
      Daily Data
      }
      if Mode.ItemIndex = 1 then
      begin
        RzListView2.Items.Clear;
        for i := 0 to d - 1 do
        begin
          with RzListView2 do
          begin
            ListItem := items.Add;
            listitem.Caption := Format ('%9.1f',[daily[i]]);
          end;
        end;
      end;
    end;
  end;
end;

procedure TSequenceView.XComboCloseUp(Sender: TObject);
begin
  with TComboBox(Sender) do
    if (ItemIndex <> -1) and not boolean(Items.Objects[ItemIndex]) then
    begin
      beep;
      Perform(CB_SHOWDROPDOWN, integer(true), 0);
    end;
end;

procedure TSequenceView.XComboDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
const
  INDENT = 3;
begin
  with TComboBox(Control) do
  begin
    FillRect(Canvas.Handle, Rect, GetStockObject(WHITE_BRUSH));
    inc(Rect.Left, INDENT);
    if boolean(Items.Objects[Index]) then
      SetTextColor(Canvas.Handle, clBlack)
    else
      SetTextColor(Canvas.Handle, clGray);
    DrawText(Canvas.Handle,
      PChar(Items[Index]),
      length(Items[Index]),
      Rect,
      DT_SINGLELINE or DT_LEFT or DT_VCENTER or DT_END_ELLIPSIS)
  end;
end;

procedure TSequenceView.YComboChange(Sender: TObject);
var
  i,j,k,x,l,d : integer;
  index,km    : integer;
  code        : integer;   
  ListItem    : TListItem;
  Daily       : array[0..5000] of real;
begin
 {
  Show analysis file
  }
  d := 0;
  j := yCombo.Items.Count;
  for index := 0 to j - 1 do
  begin
    x := 1;
    for i := 0 to j-1 do
    begin
      k := HeaderOrd[index + 1];
      if HeaderOrd[i+1] < k then inc (x);
    end;

    if Index = yCombo.ItemIndex then
    begin
      for km := 1 to NTreat do
      begin
        for l := 1 to ParVars do Pars[l] := 0.0;

        for l := 1 to NReps do
        begin
          TukDat[l] := OutDat[x,l+(km-1)*Nreps];
          Daily[d]  := OutDat[x,l+(km-1)*Nreps];
          inc (d);
        end;

        Stats.Tukey (TukDat,NReps,Pars,Code);

        for l := 1 to ParVars do
          ParDat [l,km] := Pars[l];
    end;

    RzListView3.Items.Clear;
    for i := 0 to NTreat - 1 do
    begin
      with RzListView3 do
      begin
        ListItem := items.Add;
        listitem.Caption := Format ('%9.1f',[pardat[1,i+1]]);
      end;
    end;
    RzListView3.Update;
    {
     Daily Data
     }
     if Mode.ItemIndex = 1 then
     begin
       RzListView3.Items.Clear;
       for i := 0 to d - 1 do
       begin
         with RzListView3 do
         begin
           ListItem := items.Add;
           listitem.Caption := Format ('%9.1f',[daily[i]]);
         end;
       end;
      end;
    end;
  end;
end;

procedure TSequenceView.YComboCloseUp(Sender: TObject);
begin
  with TComboBox(Sender) do
    if (ItemIndex <> -1) and not boolean(Items.Objects[ItemIndex]) then
    begin
      beep;
      Perform(CB_SHOWDROPDOWN, integer(true), 0);
    end;
end;

procedure TSequenceView.YComboDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
const
  INDENT = 3;
begin
  with TComboBox(Control) do
  begin
    FillRect(Canvas.Handle, Rect, GetStockObject(WHITE_BRUSH));
    inc(Rect.Left, INDENT);
    if boolean(Items.Objects[Index]) then
      SetTextColor(Canvas.Handle, clBlack)
    else
      SetTextColor(Canvas.Handle, clGray);
    DrawText(Canvas.Handle,
      PChar(Items[Index]),
      length(Items[Index]),
      Rect,
      DT_SINGLELINE or DT_LEFT or DT_VCENTER or DT_END_ELLIPSIS)
  end;
end;

procedure TSequenceView.ModeClick(Sender: TObject);
begin
  XComboChange (self);
  YComboChange (self);
end;

procedure TComboBox.WndProc(var Message: TMessage);

  function NextItemIsDisabled: boolean;
  begin
    result := (ItemIndex < Items.Count - 1) and
      not boolean(Items.Objects[ItemIndex + 1]);
  end;

  procedure SelectNextEnabledItem;
  var
    i: Integer;
  begin
    for i := ItemIndex + 1 to Items.Count - 1 do
      if boolean(Items.Objects[i]) then
      begin
        ItemIndex := i;
        Exit;
      end;
    beep;
  end;

  procedure KillMessages;
  var
    msg: TMsg;
  begin
    while PeekMessage(msg,
      Handle,
      WM_KEYFIRST,
      WM_KEYLAST,
      PM_REMOVE) do;
  end;

  function PrevItemIsDisabled: boolean;
  begin
    result := (ItemIndex > 0) and
      not boolean(Items.Objects[ItemIndex - 1]);
  end;

  procedure SelectPrevEnabledItem;
  var
    i: Integer;
  begin
    for i := ItemIndex - 1 downto 0 do
      if boolean(Items.Objects[i]) then
      begin
        ItemIndex := i;
        Exit;
      end;
    beep;
  end;

begin
  case Message.Msg of
    WM_KEYDOWN:
      case Message.WParam of
        VK_DOWN:
          if NextItemIsDisabled then
          begin
            SelectNextEnabledItem;
            KillMessages;
            Exit;
          end;
        VK_UP:
          if PrevItemIsDisabled then
          begin
            SelectPrevEnabledItem;
            KillMessages;
            Exit;
          end;
      end;
  end;
  inherited;
end;

end.

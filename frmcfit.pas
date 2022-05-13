unit Frmcfit;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Buttons, StdCtrls, ExtCtrls, SDL_rchart,
  SDL_stringl, SDL_math2, SDL_numlab, Spin, DynamicSkinForm, SkinBoxCtrls, SkinCtrls,
  Menus, spMessages, ComCtrls, SkinTabs;
type
  TFrmMain = class(TForm)
    Stats1: TCurveFit;
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinMainMenu1: TspSkinMainMenu;
    File1: TMenuItem;
    spSkinMainMenuBar1: TspSkinMainMenuBar;
    Exit1: TMenuItem;
    Regression1: TMenuItem;
    Linear1: TMenuItem;
    Parabolic1: TMenuItem;
    Polynomial1: TMenuItem;
    Firstorder1: TMenuItem;
    SecondOrder1: TMenuItem;
    Thirdorder1: TMenuItem;
    Fourthorder1: TMenuItem;
    spSkinMessage1: TspSkinMessage;
    spSkinPageControl1: TspSkinPageControl;
    spSkinTabSheet1: TspSkinTabSheet;
    spSkinTabSheet2: TspSkinTabSheet;
    RChart1: TRChart;
    RChart2: TRChart;
    Stats2: TCurveFit;
    procedure SBNewPntsClick(Sender: TObject);
    procedure BButParabolFitClick(Sender: TObject);
    procedure BButLinFitClick(Sender: TObject);
    procedure SBClearClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure BButPolynomialClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure ResClearClick;
    procedure LoadData;
    procedure LoadResiduals;
  private
    procedure ShowSpline;
  public
    { Public declarations }
  end;

var
  FrmMain : TFrmMain;
  PolyMax : Integer;
  Residuals : array[0..600,0..1] of double;
  PredVal : array[0..600] of double;

implementation

uses Main, DataModFr, RegDetailsFr, SequenceViewFr;

{$R *.DFM}

const
  ChartXRes = 200;

procedure TFrmMain.SBClearClick(Sender: TObject);
begin
  Stats1.Init;
  RChart1.ClearGraf;
  RChart1.ShowGraf;
end;

procedure TFrmMain.ResClearClick;
begin
  Stats2.Init;
  RChart2.ClearGraf;
  RChart2.ShowGraf;
end;

procedure TFrmMain.SBNewPntsClick(Sender: TObject);
begin
  while (RChart1.TypeOfLastItem <> tkMarkAt) and
        (RChart1.TypeOfLastItem <> tkNone) do { remove any curve from graph }
    RChart1.RemoveLastItem;
end;

procedure TFrmMain.BButParabolFitClick(Sender: TObject);
var
  k0, k1, k2 : double;
  FitQUal    : double;
  xstep      : double;
  i, j       : integer;
  x          : double;
  rx, ry, rz : double;
begin
  spSkinPageControl1.ActivePageIndex := 0;
  while (RChart2.TypeOfLastItem <> tkMarkAt) and
        (RChart2.TypeOfLastItem <> tkNone) do { remove any curve from graph }
  RChart2.RemoveLastItem;
  RChart2.ShowGraf;

  while (RChart1.TypeOfLastItem <> tkMarkAt) and
        (RChart1.TypeOfLastItem <> tkNone) do { remove any curve from graph }
  RChart1.RemoveLastItem;

  Stats1.CalcParabolFit (k0, k1, k2, FitQual);

  RChart1.MoveTo (RChart1.Scale1X.RangeLow,k0+k1*RChart1.Scale1X.RangeLow+k2*sqr(RChart1.Scale1X.RangeLow));
  xstep := (RChart1.Scale1X.RangeHigh-RChart1.Scale1X.RangeLow) / ChartXRes;
  for i := 1 to ChartXRes do
  begin
    x := RChart1.Scale1X.RangeLow+i*xstep;
    RChart1.DrawTo (x,k0+k1*x+k2*sqr(x));
  end;

  RChart1.ShowGraf;

  RegDetails.spSkinStringGrid1.Cells[1,0] := 'y = k0 + k1*x + k2*sqr(x)';
  RegDetails.spSkinStringGrid1.Cells[1,1] := 'k0 = '+strff(k0,1,3)+'    k1 = '+strff(k1,1,3)+'    k2 = '+strff(k2,1,3);
  RegDetails.spSkinStringGrid1.Cells[1,2] := FloatToStrF (FitQual,ffFixed,9,6);

  RegDetails.ShowModal;

  for i := 0 to MaxYrs do
    for j := 0 to 1 do Residuals[i,j] := 0.0;

  for i := 1 to SequenceView.rzListView2.Items.Count do
  begin
    rz := StrToFloat (SequenceView.rzListView2.Items.Item[i-1].Caption);
    rz := rz/1000.00;
    rx := StrToFloat (SequenceView.rzListView2.Items.Item[i-1].Caption);
    ry := StrToFloat (SequenceView.rzListView3.Items.Item[i-1].Caption);
    Residuals[i,0] := rx;
    Residuals[i,1] := ry - (k0 + k1*rx + k2*sqr(rx));
    PredVal[i]     := k0 + k1*rx + k2*sqr(rx);
  end;
  LoadResiduals;
end;

procedure TFrmMain.BButLinFitClick(Sender: TObject);
var
  i,j      : integer;
  k,d      : double;
  FitQUal  : double;
  rx,ry,rz : double;
begin
  spSkinPageControl1.ActivePageIndex := 0;
  while (RChart2.TypeOfLastItem <> tkMarkAt) and
        (RChart2.TypeOfLastItem <> tkNone) do { remove any curve from graph }
  RChart2.RemoveLastItem;
  RChart2.ShowGraf;

  while (RChart1.TypeOfLastItem <> tkMarkAt) and
        (RChart1.TypeOfLastItem <> tkNone) do { remove any curve from graph }
  RChart1.RemoveLastItem;

  Stats1.CalcLinFit (k, d, FitQual);

  RChart1.MoveTo (RChart1.Scale1X.RangeLow,k*RChart1.Scale1X.RangeLow+d);
  RChart1.DrawTo (RChart1.Scale1X.RangeHigh,k*RChart1.Scale1X.RangeHigh+d);
  RChart1.ShowGraf;

  RegDetails.spSkinStringGrid1.Cells[1,0] := 'y = k*x + d';
  RegDetails.spSkinStringGrid1.Cells[1,1] := 'k = '+strff(k,1,3)+'    d = '+strff(d,1,3);
  RegDetails.spSkinStringGrid1.Cells[1,2] := FloatToStrF (FitQual,ffFixed,9,6);
  RegDetails.ShowModal;

  for i := 0 to MaxYrs do
    for j := 0 to 1 do Residuals[i,j] := 0.0;

  for i := 1 to SequenceView.rzListView2.Items.Count do
  begin
    rz := StrToFloat (SequenceView.rzListView2.Items.Item[i-1].Caption);
    rz := rz/1000.00;
    rx := StrToFloat (SequenceView.rzListView2.Items.Item[i-1].Caption);
    ry := StrToFloat (SequenceView.rzListView3.Items.Item[i-1].Caption);
    Residuals[i,0] :=  rx;
    Residuals[i,1] :=  ry - (rx*k+d);
    PredVal[i]     :=  rx*k+d;
  end;
  LoadResiduals;
end;

procedure TFrmMain.FormMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
begin
  Screen.cursor := crDefault;
end;

procedure TFrmMain.BButPolynomialClick(Sender: TObject);
var
  k          : array[0..MaxPolyFitOrder] of double;
  FitQUal    : double;
  xstep      : double;
  i,j        : integer;
  x, xprod   : double;
  sum        : double;
  astr       : string;
  PolyOrder  : byte;
  rx, ry, rz : double;
  Result     : Boolean;
begin
  spSkinPageControl1.ActivePageIndex := 0;
  while (RChart2.TypeOfLastItem <> tkMarkAt) and
        (RChart2.TypeOfLastItem <> tkNone) do { remove any curve from graph }
    RChart2.RemoveLastItem;
  RChart2.ShowGraf;

  PolyOrder := TComponent(Sender).Tag;

  if Stats1.NumData <=9 then
    PolyMax   := Stats1.NumData-1;
  if PolyOrder > PolyMax then
    PolyOrder := PolyMax;

  if PolyOrder > PolyMax then
  begin
    spSkinMessage1.MessageDlg ('The maximum polynomial is '+inttostr (PolyMax)+'.', mtInformation,[mbOk], 0);
    PolyOrder := PolyMax;
  end;

  while (RChart1.TypeOfLastItem <> tkMarkAt) and
        (RChart1.TypeOfLastItem <> tkNone) do
    RChart1.RemoveLastItem;

  if not Result then
    spSkinMessage1.MessageDlg ('Could not calculate polynomial fit.', mtInformation,[mbOk], 0)
  else
  begin
    xstep := (RChart1.Scale1X.RangeHigh-RChart1.Scale1X.RangeLow) / ChartXRes;
    x     :=  RChart1.Scale1X.RangeLow + xstep;
    xprod := 1.0;
    sum   := 0.0;
    for j := 0 to PolyOrder do
    begin
      sum   := sum + k[j]*Xprod;
      xprod := xprod*x;
    end;

    RChart1.MoveTo (x,sum);

    for i := 1 to ChartXRes do
    begin
      x     := RChart1.Scale1X.RangeLow+i*xstep;
      xprod := 1.0;
      sum   := 0.0;
      for j := 0 to PolyOrder do
      begin
        sum   := sum + k[j]*Xprod;
        xprod := xprod*x;
      end;
      RChart1.DrawTo (x,sum);
    end;

    RChart1.ShowGraf;

    astr := 'y = k0+k1*x';
    for i := 2 to PolyOrder do
       astr := astr + '+k'+intToStr(i)+'*x^'+intToStr(i)+' ';
    RegDetails.spSkinStringGrid1.Cells[1,0] := astr;

    astr := '';
    for i := 0 to PolyOrder do
      astr := astr + 'k'+intToStr(i)+'='+strff(k[i],1,3)+'  ';

    RegDetails.spSkinStringGrid1.Cells[1,1] := astr;
    RegDetails.spSkinStringGrid1.Cells[1,2] := FloatToStrF (FitQual,ffFixed,9,6);
    RegDetails.ShowModal;

    for i := 0 to MaxYrs do
      for j := 0 to 1 do Residuals[i,j] := 0.0;

    for i := 1 to SequenceView.rzListView2.Items.Count do
    begin
      rz    := StrToFloat(SequenceView.rzListView2.Items.Item[i-1].Caption);
      rz    := rz/1000.00;
      rx    := StrToFloat (SequenceView.rzListView2.Items.Item[i-1].Caption);
      ry    := StrToFloat (SequenceView.rzListView3.Items.Item[i-1].Caption);
      xprod := 1;
      sum   := 0;
      for j := 0 to PolyOrder do
      begin
        sum   := sum + k[j]*Xprod;
        xprod := xprod*rx;
      end;
      Residuals[i,0] := rx;
      Residuals[i,1] := ry - sum;
      PredVal[i]     := sum;
    end;
    LoadResiduals;
  end;
end;

procedure TFrmMain.ShowSpline;
var
  FitQUal : double;
  xstep   : double;
  i       : integer;
  x, y    : double;
  valid   : boolean;
begin
  while (RChart1.TypeOfLastItem <> tkMarkAt) and
        (RChart1.TypeOfLastItem <> tkNone) do { remove any curve from graph }
  RChart1.RemoveLastItem;

  xstep := (RChart1.Scale1X.RangeHigh-RChart1.Scale1X.RangeLow) / ChartXRes;
  x     := Stats1.MinX;
  y     := Stats1.SmoothedSpline (x, FitQual, valid);
  RChart1.MoveTo (x,y);
  for i := 1 to ChartXRes do
  begin
    x := RChart1.Scale1X.RangeLow+i*xstep;
    y := Stats1.SmoothedSpline (x, FitQual, valid);
    if valid then
      RChart1.DrawTo (x,y);
  end;
  RChart1.ShowGraf;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  spSKinPageControl1.ActivePageIndex := 0;
  LoadData;
  ResClearClick;
end;

procedure TFrmMain.LoadData;
var
  i : integer;
  rx, ry, rz : double;
begin
  SBClearClick (Self);
  for i := 1 to SequenceView.rzListView2.Items.Count do
  begin
    rz := StrToFloat(SequenceView.rzListView2.Items.Item[i-1].Caption);
    rz := rz/1000.00;
    rx := StrToFloat(SequenceView.rzListView2.Items.Item[i-1].Caption);
    ry := StrToFloat(SequenceView.rzListView3.Items.Item[i-1].Caption);
    RChart1.MarkAt (rx, ry, 26);
    Stats1.EnterStatValue (rx,ry);
  end;
  PolyMax := Stats1.NumData-1;
  {
  if Stats1.NumData <=9 then
    SEPolyOrder.MaxValue := Stats1.NumData-1;
  if SEPolyOrder.Value > SEPolyOrder.MaxValue then
    SEPolyOrder.Value := SEPolyOrder.MaxValue;
  }
  RChart1.AutoRange (1,5);
  RChart1.ShowGraf;
end;

procedure TFrmMain.LoadResiduals;
var
  i : integer;
  rx, ry : double;
  f : textfile;
begin
  ResClearClick;
  for i := 1 to SequenceView.rzListView2.Items.Count do
  begin
    rx := Residuals[i,0];
    ry := Residuals[i,1];
    RChart2.MarkAt (rx, ry, 26);
    Stats2.EnterStatValue (rx,ry);
  end;
  RChart2.AutoRange (1,5);
  RChart2.ShowGraf;
  if FileExists (SNRFile) then
  begin
    AssignFile (f,SNRFile);
    Append (f);
    writeln (f);
    writeln (f,frmMain.Caption);
    writeln (f);
    writeln (f, RegDetails.spSkinStringGrid1.Cells[0,0] +' = '+ RegDetails.spSkinStringGrid1.Cells[1,0]);
    writeln (f, RegDetails.spSkinStringGrid1.Cells[0,1] +' = '+ RegDetails.spSkinStringGrid1.Cells[1,1]);
    writeln (f, RegDetails.spSkinStringGrid1.Cells[0,2] +' = '+ RegDetails.spSkinStringGrid1.Cells[1,2]);
    writeln (f);
    writeln (f,'       Year       Mean    Residual  Estimate');
    for i := 1 to SequenceView.rzListView2.Items.Count do
    begin
      writeln (f,Format ('%14.2f%10s%10.1f%10.1f',[Residuals[i,0],SequenceView.rzListView2.Items.Item[i-1].Caption,
                  Residuals[i,1], PredVal[i]]));
    end;
    CloseFile (f);
  end;
end;

procedure TFrmMain.Exit1Click(Sender: TObject);
begin
  Close;
end;

end.

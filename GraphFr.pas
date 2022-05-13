unit GraphFr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, TeeProcs, TeEngine, Chart, ComCtrls, ToolWin, Series,
  ImgList, Menus,  GanttCh, ArrowCha, Buttons,
  DynamicSkinForm, SkinCtrls, SkinMenus, spSkinShellCtrls, StdCtrls,
  VclTee.TeeGDIPlus, System.ImageList;
type
  TGraphForm = class(TForm)
    ImageList2: TImageList;
    Notebook1: TNotebook;
    Chart1: TChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    Chart2: TChart;
    Series6: TPointSeries;
    Chart3: TChart;
    Series7: TLineSeries;
    Series8: TLineSeries;
    Series9: TLineSeries;
    Series10: TLineSeries;
    Series11: TLineSeries;
    Series12: TLineSeries;
    Series13: TLineSeries;
    Series14: TLineSeries;
    Series15: TLineSeries;
    Series16: TLineSeries;
    Chart4: TChart;
    PointSeries1: TPointSeries;
    ArrowSeries1: TArrowSeries;
    PointSeries2: TPointSeries;
    PointSeries3: TPointSeries;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinToolBar1: TspSkinToolBar;
    spSkinMenuSpeedButton1: TspSkinMenuSpeedButton;
    spSkinBevel1: TspSkinBevel;
    spSkinSpeedButton1: TspSkinSpeedButton;
    spSkinBevel2: TspSkinBevel;
    spSkinSpeedButton2: TspSkinSpeedButton;
    spSkinSpeedButton3: TspSkinSpeedButton;
    spSkinSpeedButton4: TspSkinSpeedButton;
    spSkinBevel3: TspSkinBevel;
    spSkinSpeedButton5: TspSkinSpeedButton;
    spSkinSpeedButton6: TspSkinSpeedButton;
    spSkinSpeedButton7: TspSkinSpeedButton;
    spSkinSpeedButton8: TspSkinSpeedButton;
    spSkinBevel4: TspSkinBevel;
    spSkinSpeedButton9: TspSkinSpeedButton;
    spSkinPopupMenu1: TspSkinPopupMenu;
    Print2: TMenuItem;
    N3: TMenuItem;
    SaveasBitmap2: TMenuItem;
    Savetometafile2: TMenuItem;
    N4: TMenuItem;
    Copytoclipboard2: TMenuItem;
    Copytoclipboardenhancedmetafile2: TMenuItem;
    SaveDialog1: TspSkinSavePictureDialog;
    Series5: TPointSeries;
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure SaveasBitmap1Click(Sender: TObject);
    procedure Savetometafile1Click(Sender: TObject);
    procedure Copytoclipboard1Click(Sender: TObject);
    procedure Copytoclipboardenhancedmetafile1Click(Sender: TObject);
    procedure ScrollAxis(Axis:TChartAxis; Const Percent:Double);
    procedure HorizScroll(Const Percent:Double);
    Procedure VertScroll(Const Percent:Double);
    procedure ToolButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Chart2GetLegendText(Sender: TCustomAxisPanel;
      LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ToolButton14Click(Sender: TObject);
    procedure Chart1GetAxisLabel(Sender: TChartAxis; Series: TChartSeries;
      ValueIndex: Integer; var LabelText: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GraphForm: TGraphForm;

implementation

uses Main, DataModFr, PlotFr, DataGridFr;

{$R *.DFM}

procedure TGraphForm.ScrollAxis(Axis:TChartAxis; Const Percent:Double);
var Amount:Double;
begin
  With Axis do
  begin
    Amount:=-((Maximum-Minimum)/(100.0/Percent));
    SetMinMax(Minimum-Amount,Maximum-Amount);
  end;
end;

Procedure TGraphForm.HorizScroll(Const Percent:Double);
begin
  case NoteBook1.PageIndex of
    0 : begin
          ScrollAxis (Chart1.TopAxis,Percent);
          ScrollAxis (Chart1.BottomAxis,Percent);
        end;
    1 : begin
          ScrollAxis (Chart2.TopAxis,Percent);
          ScrollAxis (Chart2.BottomAxis,Percent);
        end;
    2 : begin
          ScrollAxis (Chart3.TopAxis,Percent);
          ScrollAxis (Chart3.BottomAxis,Percent);
        end;
    3 : begin
          ScrollAxis (Chart4.TopAxis,Percent);
          ScrollAxis (Chart4.BottomAxis,Percent);
        end;
  end;
end;

Procedure TGraphForm.VertScroll(Const Percent:Double);
begin
  case NoteBook1.PageIndex of
    0 : begin
          ScrollAxis (Chart1.LeftAxis,Percent);
          ScrollAxis (Chart1.RightAxis,Percent);
        end;
    1 : begin
          ScrollAxis (Chart2.LeftAxis,Percent);
          ScrollAxis (Chart2.RightAxis,Percent);
        end;
    2 : begin
          ScrollAxis (Chart3.LeftAxis,Percent);
          ScrollAxis (Chart3.RightAxis,Percent);
        end;
    3 : begin
          ScrollAxis (Chart4.LeftAxis,Percent);
          ScrollAxis (Chart4.RightAxis,Percent);
        end;
   end;
end;

procedure TGraphForm.ToolButton9Click(Sender: TObject);
begin
   VertScroll (-10.0);
end;

procedure TGraphForm.ToolButton8Click(Sender: TObject);
begin
   VertScroll (10.0);
end;

procedure TGraphForm.ToolButton7Click(Sender: TObject);
begin
  HorizScroll (10.0);
end;

procedure TGraphForm.ToolButton6Click(Sender: TObject);
begin
  HorizScroll (-10.0);
end;

procedure TGraphForm.ToolButton5Click(Sender: TObject);
begin
  case NoteBook1.PageIndex of
    0 : Chart1.UndoZoom;
    1 : Chart2.UndoZoom;
    2 : Chart3.UndoZoom;
    3 : Chart4.UndoZoom;
  end;
end;

procedure TGraphForm.ToolButton4Click(Sender: TObject);
begin
  case NoteBook1.PageIndex of
    0 : Chart1.ZoomPercent (80);
    1 : Chart2.ZoomPercent (80);
    2 : Chart3.ZoomPercent (80);
    3 : Chart4.ZoomPercent (80);
  end;
end;

procedure TGraphForm.ToolButton3Click(Sender: TObject);
begin
  case NoteBook1.PageIndex of
    0 : Chart1.ZoomPercent (120);
    1 : Chart2.ZoomPercent (120);
    2 : Chart3.ZoomPercent (120);
    3 : Chart4.ZoomPercent (120);
  end;
end;

procedure TGraphForm.SaveasBitmap1Click(Sender: TObject);
begin
  SaveDialog1.InitialDir :=  ExtractFilePath(ParamStr(0));
  Savedialog1.Filter     := 'Bitmap file|*.BMP';
  SaveDialog1.Title      := 'Save as a bitmap';
  SaveDialog1.FileName   := 'SNS.bmp';

  if SaveDialog1.Execute then
  begin
    case NoteBook1.PageIndex of
      0 : Chart1.SaveToBitmapFile (SaveDialog1.FileName);
      1 : Chart2.SaveToBitmapFile (SaveDialog1.FileName);
      2 : Chart3.SaveToBitmapFile (SaveDialog1.FileName);
      3 : Chart4.SaveToBitmapFile (SaveDialog1.FileName);
    end;
  end;
end;

procedure TGraphForm.Savetometafile1Click(Sender: TObject);
begin
  SaveDialog1.InitialDir :=  ExtractFilePath(ParamStr(0));
  Savedialog1.Filter     := 'Metafile file|*.WMF';
  SaveDialog1.Title      := 'Save as a Windows metafile';
  SaveDialog1.FileName   := 'SNS.wmf';

  if SaveDialog1.Execute then
  begin
    case NoteBook1.PageIndex of
      0 : Chart1.SaveToMetafileEnh (SaveDialog1.Filename);
      1 : Chart2.SaveToMetafileEnh (SaveDialog1.Filename);
      2 : Chart3.SaveToMetafileEnh (SaveDialog1.Filename);
      3 : Chart4.SaveToMetafileEnh (SaveDialog1.Filename);
    end;
  end;
end;

procedure TGraphForm.Copytoclipboard1Click(Sender: TObject);
begin
  case NoteBook1.PageIndex of
    0 : Chart1.CopyToClipboardBitmap;
    1 : Chart2.CopyToClipboardBitmap;
    2 : Chart3.CopyToClipboardBitmap;
    3 : Chart4.CopyToClipboardBitmap;
  end;
end;

procedure TGraphForm.Copytoclipboardenhancedmetafile1Click(
  Sender: TObject);
begin
  case NoteBook1.PageIndex of
    0 : Chart1.CopyToClipboardMetafile (true);
    1 : Chart2.CopyToClipboardMetafile (true);
    2 : Chart3.CopyToClipboardMetafile (true);
    3 : Chart4.CopyToClipboardMetafile (true);
  end;
end;

procedure TGraphForm.ToolButton2Click(Sender: TObject);
begin
  case NoteBook1.PageIndex of
    0 : begin
          PlotForm.Notebook1.PageIndex := 0;
          PlotForm.XMax.Value       := Chart1.LeftAxis.Maximum;
          PlotForm.XMaxAuto.Checked := Chart1.LeftAxis.AutomaticMaximum;
          PlotForm.XMin.Value       := Chart1.LeftAxis.Minimum;
          PlotForm.XMinAuto.Checked := Chart1.LeftAxis.AutomaticMinimum;

          PlotForm.YMax.Value       := Chart1.BottomAxis.Maximum;
          PlotForm.YMaxAuto.Checked := Chart1.BottomAxis.AutomaticMaximum;
          PlotForm.YMin.Value       := Chart1.BottomAxis.Minimum;
          PlotForm.YMinAuto.Checked := Chart1.BottomAxis.AutomaticMinimum;
          PlotForm.ShowModal;
        end;
    1 : begin
          PlotForm.Notebook1.PageIndex := 1;
          PlotForm.XMax.Value       := Chart2.LeftAxis.Maximum;
          PlotForm.XMaxAuto.Checked := Chart2.LeftAxis.AutomaticMaximum;
          PlotForm.XMin.Value       := Chart2.LeftAxis.Minimum;
          PlotForm.XMinAuto.Checked := Chart2.LeftAxis.AutomaticMinimum;

          PlotForm.YMax.Value       := Chart2.BottomAxis.Maximum;
          PlotForm.YMaxAuto.Checked := Chart2.BottomAxis.AutomaticMaximum;
          PlotForm.YMin.Value       := Chart2.BottomAxis.Minimum;
          PlotForm.YMinAuto.Checked := Chart2.BottomAxis.AutomaticMinimum;
          PlotForm.ShowModal;
        end;
    2 : begin
          PlotForm.Notebook1.PageIndex := 2;
          PlotForm.XMax.Value       := Chart3.LeftAxis.Maximum;
          PlotForm.XMaxAuto.Checked := Chart3.LeftAxis.AutomaticMaximum;
          PlotForm.XMin.Value       := Chart3.LeftAxis.Minimum;
          PlotForm.XMinAuto.Checked := Chart3.LeftAxis.AutomaticMinimum;

          PlotForm.YMax.Value       := Chart3.BottomAxis.Maximum;
          PlotForm.YMaxAuto.Checked := Chart3.BottomAxis.AutomaticMaximum;
          PlotForm.YMin.Value       := Chart3.BottomAxis.Minimum;
          PlotForm.YMinAuto.Checked := Chart3.BottomAxis.AutomaticMinimum;
          PlotForm.ShowModal;
        end;
  end;
end;

procedure TGraphForm.FormShow(Sender: TObject);
begin
  case NoteBook1.PageIndex of
    0: begin
         PlotForm.CheckBox1.Checked  := true;
         PlotForm.CheckBox5.Checked  := false;
         PlotForm.CheckBox4.Checked  := true;
         PlotForm.CheckBox6.Checked  := false;
         PlotForm.CheckBox7.Checked  := true;
         PlotForm.CheckBox8.Checked  := false;
         PlotForm.CheckBox9.Checked  := true;
         PlotForm.CheckBox10.Checked := false;

         if Chart1.View3D then PlotForm.Checkbox11.Checked := true else
                               PlotForm.Checkbox11.Checked := false;
         if Chart1.View3DOptions.Orthogonal then PlotForm.CheckBox12.Checked := true else
                                            PlotForm.CheckBox12.Checked := false;
         PlotForm.SpinEdit1.Value           := Chart1.Chart3DPercent;
         PlotForm.TrackBar1.Value           := Chart1.View3DOptions.Rotation;
         PlotForm.TrackBar2.Value           := Chart1.View3DOptions.Elevation;
         PlotForm.TrackBar3.Value           := Chart1.View3DOptions.Perspective;
         PlotForm.RzColorCombobox1.Selected := Series2.SeriesColor;
         PlotForm.RzColorCombobox3.Selected := Series3.SeriesColor;
         PlotForm.RzColorCombobox4.Selected := Series4.SeriesColor;
         PlotForm.RzColorCombobox5.Selected := Series5.SeriesColor;
         PlotForm.Edit1.text                := Chart1.Title.Text.Strings[0];
         PlotForm.Edit2.Text                := Chart1.LeftAxis.Title.Caption;
         PlotForm.Edit3.Text                := Chart1.BottomAxis.Title.Caption;
       end;
    1: begin
         PlotForm.CheckBox2.Checked := true;
         PlotForm.CheckBox3.Checked := true;

         if Chart2.View3D then PlotForm.Checkbox11.Checked := true else
                               PlotForm.Checkbox11.Checked := false;
         if Chart2.View3DOptions.Orthogonal then PlotForm.CheckBox12.Checked := true else
                                            PlotForm.CheckBox12.Checked := false;
         PlotForm.SpinEdit1.Value           := Chart2.Chart3DPercent;
         PlotForm.TrackBar1.Value           := Chart2.View3DOptions.Rotation;
         PlotForm.TrackBar2.Value           := Chart2.View3DOptions.Elevation;
         PlotForm.TrackBar3.Value           := Chart2.View3DOptions.Perspective;
         PlotForm.RzColorCombobox2.Selected := Series6.SeriesColor;
         PlotForm.Edit1.text                := Chart2.Title.Text.Strings[0];
         PlotForm.Edit2.Text                := Chart2.LeftAxis.Title.Caption;
         PlotForm.Edit3.Text                := Chart2.BottomAxis.Title.Caption;
       end;
    2: begin
         PlotForm.CheckBox13.Checked := true;
         PlotForm.CheckBox14.Checked := false;
         PlotForm.SpinEdit2.Value    := 1;

         if Chart3.View3D then PlotForm.Checkbox11.Checked := true else
                               PlotForm.Checkbox11.Checked := false;
         if Chart3.View3DOptions.Orthogonal then PlotForm.CheckBox12.Checked := true else
                                            PlotForm.CheckBox12.Checked := false;
         PlotForm.SpinEdit1.Value          := Chart3.Chart3DPercent;
         PlotForm.TrackBar1.Value       := Chart3.View3DOptions.Rotation;
         PlotForm.TrackBar2.Value       := Chart3.View3DOptions.Elevation;
         PlotForm.TrackBar3.Value       := Chart3.View3DOptions.Perspective;
         PlotForm.RzColorCombobox6.Selected:= Series7.SeriesColor;
         PlotForm.Edit1.text               := Chart3.Title.Text.Strings[0];
         PlotForm.Edit2.Text               := Chart3.LeftAxis.Title.Caption;
         PlotForm.Edit3.Text               := Chart3.BottomAxis.Title.Caption;
       end;
    end;
end;

procedure TGraphForm.Chart2GetLegendText(Sender: TCustomAxisPanel;
  LegendStyle: TLegendStyle; Index: Integer; var LegendText: String);
var
  i,code : integer;
begin
  val (legendtext,i,code);
  LegendText := LegendText +  ' - '+TNAM[i];
end;


procedure TGraphForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if MainForm.spSkinNotebook1.PageIndex = 2 then
 begin
   if (key=VK_F8) then DataGrid.Showmodal;
   if (key=VK_F9) then
   begin
     if NoteBook1.PageIndex = 0 then
     begin
       NoteBook1.PageIndex := 3;
       exit;
     end;
     if NoteBook1.PageIndex = 3 then
     begin
       NoteBook1.PageIndex := 0;
       exit;
     end;
   end;
 end;
end;

procedure TGraphForm.ToolButton14Click(Sender: TObject);
begin
  GraphForm.Close;
end;

procedure TGraphForm.Chart1GetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  code : integer;
  i    : real;
begin
  if (ValueIndex = -1) and (Offset <> 0.0) then
  begin
    Val(LabelText, I, Code);
    str (trunc(OffSet+i),LabelText);
  end;
end;

end.

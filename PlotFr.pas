unit PlotFr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Spin, ExtCtrls, DynamicSkinForm,
  SkinTabs, spDialogs, SkinCtrls, SkinBoxCtrls, Mask, spMessages;

type
  TPlotForm = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    PageControl1: TspSkinPageControl;
    spSkinTabSheet1: TspSkinTabSheet;
    spSkinTabSheet2: TspSkinTabSheet;
    spSkinTabSheet3: TspSkinTabSheet;
    Notebook1: TspSkinNotebook;
    spSkinButton1: TspSkinButton;
    FontDialog1: TspSkinFontDialog;
    spSkinGroupBox1: TspSkinGroupBox;
    spSkinStdLabel1: TspSkinStdLabel;
    spSkinStdLabel2: TspSkinStdLabel;
    spSkinStdLabel3: TspSkinStdLabel;
    spSkinStdLabel4: TspSkinStdLabel;
    CheckBox11: TspSkinCheckRadioBox;
    CheckBox12: TspSkinCheckRadioBox;
    SpinEdit1: TspSkinSpinEdit;
    TrackBar1: TspSkinTrackBar;
    TrackBar2: TspSkinTrackBar;
    TrackBar3: TspSkinTrackBar;
    spSkinGroupBox2: TspSkinGroupBox;
    spSkinStdLabel5: TspSkinStdLabel;
    spSkinStdLabel6: TspSkinStdLabel;
    spSkinStdLabel7: TspSkinStdLabel;
    spSkinSpeedButton1: TspSkinSpeedButton;
    spSkinSpeedButton2: TspSkinSpeedButton;
    spSkinSpeedButton3: TspSkinSpeedButton;
    Edit1: TspSkinEdit;
    Edit2: TspSkinEdit;
    Edit3: TspSkinEdit;
    spSkinGroupBox3: TspSkinGroupBox;
    CheckBox13: TspSkinCheckRadioBox;
    CheckBox14: TspSkinCheckRadioBox;
    RzColorComboBox6: TspSkinColorComboBox;
    spSkinStdLabel8: TspSkinStdLabel;
    SpinEdit2: TspSkinSpinEdit;
    spSkinGroupBox4: TspSkinGroupBox;
    CheckBox2: TspSkinCheckRadioBox;
    CheckBox3: TspSkinCheckRadioBox;
    RzColorComboBox2: TspSkinColorComboBox;
    spSkinGroupBox5: TspSkinGroupBox;
    CheckBox1: TspSkinCheckRadioBox;
    CheckBox5: TspSkinCheckRadioBox;
    RzColorComboBox1: TspSkinColorComboBox;
    spSkinGroupBox6: TspSkinGroupBox;
    CheckBox4: TspSkinCheckRadioBox;
    CheckBox6: TspSkinCheckRadioBox;
    RzColorComboBox3: TspSkinColorComboBox;
    spSkinGroupBox7: TspSkinGroupBox;
    CheckBox7: TspSkinCheckRadioBox;
    CheckBox8: TspSkinCheckRadioBox;
    RzColorComboBox4: TspSkinColorComboBox;
    spSkinGroupBox8: TspSkinGroupBox;
    CheckBox9: TspSkinCheckRadioBox;
    CheckBox10: TspSkinCheckRadioBox;
    RzColorComboBox5: TspSkinColorComboBox;
    spSkinMessage1: TspSkinMessage;
    spSkinGroupBox9: TspSkinGroupBox;
    spSkinStdLabel9: TspSkinStdLabel;
    spSkinStdLabel10: TspSkinStdLabel;
    spSkinStdLabel11: TspSkinStdLabel;
    spSkinStdLabel12: TspSkinStdLabel;
    XMax: TspSkinSpinEdit;
    XMaxAuto: TspSkinCheckRadioBox;
    spSkinSpinEdit1: TspSkinSpinEdit;
    XMin: TspSkinSpinEdit;
    YMax: TspSkinSpinEdit;
    YMin: TspSkinSpinEdit;
    XMinAuto: TspSkinCheckRadioBox;
    YMaxAuto: TspSkinCheckRadioBox;
    YMinAuto: TspSkinCheckRadioBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure CheckBox14Click(Sender: TObject);
    procedure RzColorComboBox1Change(Sender: TObject);
    procedure RzColorComboBox2Change(Sender: TObject);
    procedure RzColorComboBox3Change(Sender: TObject);
    procedure RzColorComboBox4Change(Sender: TObject);
    procedure RzColorComboBox5Change(Sender: TObject);
    procedure RzColorComboBox6Change(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure CheckBox12Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure TrackBar1Enter(Sender: TObject);
    procedure TrackBar2Enter(Sender: TObject);
    procedure TrackBar3Enter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure XMaxChange(Sender: TObject);
    procedure XMaxAutoClick(Sender: TObject);
    procedure XMinChange(Sender: TObject);
    procedure YMaxChange(Sender: TObject);
    procedure YMinChange(Sender: TObject);
    procedure XMinAutoClick(Sender: TObject);
    procedure YMaxAutoClick(Sender: TObject);
    procedure YMinAutoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PlotForm: TPlotForm;

implementation

uses
  Main, GraphFr;

{$R *.DFM}

procedure TPlotForm.CheckBox1Click(Sender: TObject);
begin
  if Checkbox1.Checked = true then
     GraphForm.Series2.Active := true
  else
     GraphForm.Series2.Active := false;
end;

procedure TPlotForm.CheckBox9Click(Sender: TObject);
begin
  if Checkbox9.Checked = true then
     GraphForm.Series5.Active := true
  else
     GraphForm.Series5.Active := false;
end;

procedure TPlotForm.CheckBox13Click(Sender: TObject);
begin
  if Checkbox13.Checked = true then
  begin
    case Trunc(Spinedit2.Value) of
      1 : GraphForm.Series7.Active  := true;
      2 : GraphForm.Series8.Active  := true;
      3 : GraphForm.Series9.Active  := true;
      4 : GraphForm.Series10.Active := true;
      5 : GraphForm.Series11.Active := true;
      6 : GraphForm.Series12.Active := true;
      7 : GraphForm.Series13.Active := true;
      8 : GraphForm.Series14.Active := true;
      9 : GraphForm.Series15.Active := true;
     10 : GraphForm.Series16.Active := true;
    end;
  end else
  begin
    case Trunc(Spinedit2.Value) of
      1 : GraphForm.Series7.Active  := false;
      2 : GraphForm.Series8.Active  := false;
      3 : GraphForm.Series9.Active  := false;
      4 : GraphForm.Series10.Active := false;
      5 : GraphForm.Series11.Active := false;
      6 : GraphForm.Series12.Active := false;
      7 : GraphForm.Series13.Active := false;
      8 : GraphForm.Series14.Active := false;
      9 : GraphForm.Series15.Active := false;
     10 : GraphForm.Series16.Active := false;
    end;
  end;
end;

procedure TPlotForm.CheckBox7Click(Sender: TObject);
begin
  if Checkbox7.Checked = true then
    GraphForm.Series4.Active := true
  else
    GraphForm.Series4.Active := false;
end;

procedure TPlotForm.CheckBox4Click(Sender: TObject);
begin
  if Checkbox4.Checked = true then
    GraphForm.Series3.Active := true
  else
    GraphForm.Series3.Active := false;
end;

procedure TPlotForm.CheckBox2Click(Sender: TObject);
begin
  if Checkbox2.Checked = true then
    GraphForm.Series6.Active := true
  else
    GraphForm.Series6.Active := false;
end;

procedure TPlotForm.CheckBox5Click(Sender: TObject);
begin
  if Checkbox5.Checked = true then
    GraphForm.Series2.Marks.Visible := true
  else
    GraphForm.Series2.Marks.Visible := false;
end;

procedure TPlotForm.CheckBox10Click(Sender: TObject);
begin
  if Checkbox10.Checked = true then
    GraphForm.Series5.Marks.Visible := true
  else
    GraphForm.Series5.Marks.Visible := false;
end;

procedure TPlotForm.CheckBox14Click(Sender: TObject);
begin
if Checkbox14.Checked = true then
  begin
    case Trunc(Spinedit2.Value) of
      1 : GraphForm.Series7.Marks.Visible  := true;
      2 : GraphForm.Series8.Marks.Visible  := true;
      3 : GraphForm.Series9.Marks.Visible  := true;
      4 : GraphForm.Series10.Marks.Visible := true;
      5 : GraphForm.Series11.Marks.Visible := true;
      6 : GraphForm.Series12.Marks.Visible := true;
      7 : GraphForm.Series13.Marks.Visible := true;
      8 : GraphForm.Series14.Marks.Visible := true;
      9 : GraphForm.Series15.Marks.Visible := true;
     10 : GraphForm.Series16.Marks.Visible := true;
    end;
  end else
  begin
    case Trunc(Spinedit2.Value) of
      1 : GraphForm.Series7.Marks.Visible  := false;
      2 : GraphForm.Series8.Marks.Visible  := false;
      3 : GraphForm.Series9.Marks.Visible  := false;
      4 : GraphForm.Series10.Marks.Visible := false;
      5 : GraphForm.Series11.Marks.Visible := false;
      6 : GraphForm.Series12.Marks.Visible := false;
      7 : GraphForm.Series13.Marks.Visible := false;
      8 : GraphForm.Series14.Marks.Visible := false;
      9 : GraphForm.Series15.Marks.Visible := false;
     10 : GraphForm.Series16.Marks.Visible := false;
    end;
  end;
end;

procedure TPlotForm.CheckBox8Click(Sender: TObject);
begin
  if Checkbox8.Checked = true then
    GraphForm.Series4.Marks.Visible := true
  else
    GraphForm.Series4.Marks.Visible := false;
end;

procedure TPlotForm.CheckBox6Click(Sender: TObject);
begin
  if Checkbox6.Checked = true then
    GraphForm.Series3.Marks.Visible := true
  else
    GraphForm.Series3.Marks.Visible := false;
end;

procedure TPlotForm.CheckBox3Click(Sender: TObject);
begin
  if Checkbox3.Checked = true then
    GraphForm.Series6.Marks.Visible := true
  else
    GraphForm.Series6.Marks.Visible := false;
end;

procedure TPlotForm.RzColorComboBox1Change(Sender: TObject);
begin
  GraphForm.Series2.SeriesColor := RzColorComboBox1.Selected;
end;

procedure TPlotForm.RzColorComboBox5Change(Sender: TObject);
begin
  GraphForm.Series5.SeriesColor := RzColorComboBox5.Selected;
end;

procedure TPlotForm.RzColorComboBox6Change(Sender: TObject);
begin
  case Trunc(Spinedit2.Value) of
      1 : GraphForm.Series7.SeriesColor  := RzColorComboBox6.Selected;
      2 : GraphForm.Series8.SeriesColor  := RzColorComboBox6.Selected;
      3 : GraphForm.Series9.SeriesColor  := RzColorComboBox6.Selected;
      4 : GraphForm.Series10.SeriesColor := RzColorComboBox6.Selected;
      5 : GraphForm.Series11.SeriesColor := RzColorComboBox6.Selected;
      6 : GraphForm.Series12.SeriesColor := RzColorComboBox6.Selected;
      7 : GraphForm.Series13.SeriesColor := RzColorComboBox6.Selected;
      8 : GraphForm.Series14.SeriesColor := RzColorComboBox6.Selected;
      9 : GraphForm.Series15.SeriesColor := RzColorComboBox6.Selected;
     10 : GraphForm.Series16.SeriesColor := RzColorComboBox6.Selected;
  end;
end;

procedure TPlotForm.RzColorComboBox4Change(Sender: TObject);
begin
  GraphForm.Series4.SeriesColor := RzColorComboBox4.Selected;
end;

procedure TPlotForm.RzColorComboBox3Change(Sender: TObject);
begin
  GraphForm.Series3.SeriesColor := RzColorComboBox3.Selected;
end;

procedure TPlotForm.RzColorComboBox2Change(Sender: TObject);
begin
  GraphForm.Series6.SeriesColor := RzColorComboBox2.Selected;
end;

procedure TPlotForm.CheckBox11Click(Sender: TObject);
begin
  case GraphForm.NoteBook1.PageIndex of
    0 : if Checkbox11.Checked = true then
          GraphForm.chart1.View3D := true
        else
          GraphForm.chart1.View3D := false;
    1 : if Checkbox11.Checked = true then
          GraphForm.chart2.View3D := true
        else
          GraphForm.chart2.View3D := false;
    2 : if Checkbox11.Checked = true then
          GraphForm.chart3.View3D := true
        else
          GraphForm.chart3.View3D := false;
  end;
end;

procedure TPlotForm.SpinEdit1Change(Sender: TObject);
begin
  case GraphForm.NoteBook1.PageIndex of
    0 : GraphForm.chart1.Chart3DPercent := Trunc(Spinedit1.Value);
    1 : GraphForm.chart2.Chart3DPercent := Trunc(Spinedit1.Value);
    2 : GraphForm.chart3.Chart3DPercent := Trunc(Spinedit1.Value);
  end;
end;

procedure TPlotForm.CheckBox12Click(Sender: TObject);
begin
   case GraphForm.NoteBook1.PageIndex of
     0 : if Checkbox12.Checked = true then
           GraphForm.chart1.View3DOptions.Orthogonal := true
         else
           GraphForm.chart1.View3DOptions.Orthogonal := false;
     1 : if Checkbox12.Checked = true then
           GraphForm.chart2.View3DOptions.Orthogonal := true
         else
           GraphForm.chart2.View3DOptions.Orthogonal := false;
     3 : if Checkbox12.Checked = true then
           GraphForm.chart3.View3DOptions.Orthogonal := true
         else
           GraphForm.chart3.View3DOptions.Orthogonal := false;
   end;
end;

procedure TPlotForm.TrackBar1Change(Sender: TObject);
begin
  case GraphForm.NoteBook1.PageIndex of
    0 : GraphForm.chart1.View3DOptions.Rotation := trackbar1.Value;
    1 : GraphForm.chart2.View3DOptions.Rotation := trackbar1.Value;
    2 : GraphForm.chart3.View3DOptions.Rotation := trackbar1.Value;
  end;
end;

procedure TPlotForm.TrackBar2Change(Sender: TObject);
begin
  case GraphForm.NoteBook1.PageIndex of
    0 : GraphForm.chart1.View3DOptions.Elevation := trackbar2.Value;
    1 : GraphForm.chart2.View3DOptions.Elevation := trackbar2.Value;
    2 : GraphForm.chart3.View3DOptions.Elevation := trackbar2.Value;
  end;
end;

procedure TPlotForm.TrackBar3Change(Sender: TObject);
begin
  case GraphForm.NoteBook1.PageIndex of
    0 : GraphForm.chart1.View3DOptions.Perspective := trackbar3.Value;
    1 : GraphForm.chart2.View3DOptions.Perspective := trackbar3.Value;
    2 : GraphForm.chart3.View3DOptions.Perspective := trackbar3.Value;
  end;
end;

procedure TPlotForm.Edit1Change(Sender: TObject);
begin
  case GraphForm.NoteBook1.PageIndex of
    0 : GraphForm.chart1.Title.Text[0] := Edit1.Text;
    1 : GraphForm.chart2.Title.Text[0] := Edit1.Text;
    2 : GraphForm.chart3.Title.Text[0] := Edit1.Text;
  end;
end;

procedure TPlotForm.Edit2Change(Sender: TObject);
begin
  case GraphForm.NoteBook1.PageIndex of
    0 : GraphForm.chart1.LeftAxis.Title.Caption := Edit2.Text;
    1 : GraphForm.chart2.LeftAxis.Title.Caption := Edit2.Text;
    2 : GraphForm.chart3.LeftAxis.Title.Caption := Edit2.Text;
  end;
end;

procedure TPlotForm.Edit3Change(Sender: TObject);
begin
  case GraphForm.NoteBook1.PageIndex of
    0 : GraphForm.chart1.BottomAxis.Title.Caption := Edit3.Text;
    1 : GraphForm.chart2.BottomAxis.Title.Caption := Edit3.Text;
    2 : GraphForm.chart3.BottomAxis.Title.Caption := Edit3.Text;
  end;
end;

procedure TPlotForm.TrackBar1Enter(Sender: TObject);
begin
  case GraphForm.NoteBook1.PageIndex of
    0 : if (GraphForm.chart1.View3DOptions.Orthogonal = true) then
             spSkinMessage1.MessageDlg('Orthogonal must be set to false for this to act on chart.', mtInformation,[mbOk], 0);
    1 : if (GraphForm.chart2.View3DOptions.Orthogonal = true) then
             spSkinMessage1.MessageDlg('Orthogonal must be set to false for this to act on chart.', mtInformation,[mbOk], 0);
    2 : if (GraphForm.chart3.View3DOptions.Orthogonal = true) then
             spSkinMessage1.MessageDlg('Orthogonal must be set to false for this to act on chart.', mtInformation,[mbOk], 0);
  end;
end;

procedure TPlotForm.TrackBar2Enter(Sender: TObject);
begin
  case GraphForm.NoteBook1.PageIndex of
    0 : if (GraphForm.chart1.View3DOptions.Orthogonal = true) then
            spSkinMessage1.MessageDlg('Orthogonal must be set to false for this to act on chart.', mtInformation,[mbOk], 0);
    1 : if (GraphForm.chart2.View3DOptions.Orthogonal = true) then
            spSkinMessage1.MessageDlg('Orthogonal must be set to false for this to act on chart.', mtInformation,[mbOk], 0);
    2 : if (GraphForm.chart3.View3DOptions.Orthogonal = true) then
            spSkinMessage1.MessageDlg('Orthogonal must be set to false for this to act on chart.', mtInformation,[mbOk], 0);
  end;
end;

procedure TPlotForm.TrackBar3Enter(Sender: TObject);
begin
  case GraphForm.NoteBook1.PageIndex of
    0 : if (GraphForm.chart1.View3DOptions.Orthogonal = true) then
            spSkinMessage1.MessageDlg('Orthogonal must be set to false for this to act on chart.', mtInformation,[mbOk], 0);
    1 : if (GraphForm.chart2.View3DOptions.Orthogonal = true) then
            spSkinMessage1.MessageDlg('Orthogonal must be set to false for this to act on chart.', mtInformation,[mbOk], 0);
    2 : if (GraphForm.chart3.View3DOptions.Orthogonal = true) then
            spSkinMessage1.MessageDlg('Orthogonal must be set to false for this to act on chart.', mtInformation,[mbOk], 0);
  end;
end;

procedure TPlotForm.SpeedButton1Click(Sender: TObject);
begin
  case GraphForm.NoteBook1.PageIndex of
    0 : begin
          FontDialog1.Font.Color  := GraphForm.chart1.Title.Font.Color;
          FontDialog1.Font.Name   := GraphForm.chart1.Title.Font.Name;
          FontDialog1.Font.Size   := GraphForm.chart1.Title.Font.Size;
          FontDialog1.Font.Style  := GraphForm.chart1.Title.Font.Style;
          FontDialog1.Font.Pitch  := GraphForm.chart1.Title.Font.Pitch;
          FontDialog1.Font.Height := GraphForm.chart1.Title.Font.Height;
          if FontDialog1.Execute then
          begin
            GraphForm.chart1.Title.Font.Color  := FontDialog1.Font.Color;
            GraphForm.chart1.Title.Font.Name   := FontDialog1.Font.Name;
            GraphForm.chart1.Title.Font.Size   := FontDialog1.Font.Size;
            GraphForm.chart1.Title.Font.Style  := FontDialog1.Font.Style;
            GraphForm.chart1.Title.Font.Pitch  := FontDialog1.Font.Pitch;
            GraphForm.chart1.Title.Font.Height := FontDialog1.Font.Height;
          end;
        end;
     1 : begin
          FontDialog1.Font.Color  := GraphForm.chart2.Title.Font.Color;
          FontDialog1.Font.Name   := GraphForm.chart2.Title.Font.Name;
          FontDialog1.Font.Size   := GraphForm.chart2.Title.Font.Size;
          FontDialog1.Font.Style  := GraphForm.chart2.Title.Font.Style;
          FontDialog1.Font.Pitch  := GraphForm.chart2.Title.Font.Pitch;
          FontDialog1.Font.Height := GraphForm.chart2.Title.Font.Height;
          if FontDialog1.Execute then
          begin
            GraphForm.chart2.Title.Font.Color  := FontDialog1.Font.Color;
            GraphForm.chart2.Title.Font.Name   := FontDialog1.Font.Name;
            GraphForm.chart2.Title.Font.Size   := FontDialog1.Font.Size;
            GraphForm.chart2.Title.Font.Style  := FontDialog1.Font.Style;
            GraphForm.chart2.Title.Font.Pitch  := FontDialog1.Font.Pitch;
            GraphForm.chart2.Title.Font.Height := FontDialog1.Font.Height;
          end;
        end;
      2 : begin
          FontDialog1.Font.Color  := GraphForm.chart3.Title.Font.Color;
          FontDialog1.Font.Name   := GraphForm.chart3.Title.Font.Name;
          FontDialog1.Font.Size   := GraphForm.chart3.Title.Font.Size;
          FontDialog1.Font.Style  := GraphForm.chart3.Title.Font.Style;
          FontDialog1.Font.Pitch  := GraphForm.chart3.Title.Font.Pitch;
          FontDialog1.Font.Height := GraphForm.chart3.Title.Font.Height;
          if FontDialog1.Execute then
          begin
            GraphForm.chart3.Title.Font.Color  := FontDialog1.Font.Color;
            GraphForm.chart3.Title.Font.Name   := FontDialog1.Font.Name;
            GraphForm.chart3.Title.Font.Size   := FontDialog1.Font.Size;
            GraphForm.chart3.Title.Font.Style  := FontDialog1.Font.Style;
            GraphForm.chart3.Title.Font.Pitch  := FontDialog1.Font.Pitch;
            GraphForm.chart3.Title.Font.Height := FontDialog1.Font.Height;
          end;
        end;
    end;
end;

procedure TPlotForm.SpeedButton2Click(Sender: TObject);
begin
  case GraphForm.NoteBook1.PageIndex of
    0 : begin
          FontDialog1.Font.Color  := GraphForm.chart1.LeftAxis.Title.Font.Color;
          FontDialog1.Font.Name   := GraphForm.chart1.LeftAxis.Title.Font.Name;
          FontDialog1.Font.Size   := GraphForm.chart1.LeftAxis.Title.Font.Size;
          FontDialog1.Font.Style  := GraphForm.chart1.LeftAxis.Title.Font.Style;
          FontDialog1.Font.Pitch  := GraphForm.chart1.LeftAxis.Title.Font.Pitch;
          FontDialog1.Font.Height := GraphForm.chart1.LeftAxis.Title.Font.Height;
          if FontDialog1.Execute then
          begin
            GraphForm.chart1.LeftAxis.Title.Font.Color  := FontDialog1.Font.Color;
            GraphForm.chart1.LeftAxis.Title.Font.Name   := FontDialog1.Font.Name;
            GraphForm.chart1.LeftAxis.Title.Font.Size   := FontDialog1.Font.Size;
            GraphForm.chart1.LeftAxis.Title.Font.Style  := FontDialog1.Font.Style;
            GraphForm.chart1.LeftAxis.Title.Font.Pitch  := FontDialog1.Font.Pitch;
            GraphForm.chart1.LeftAxis.Title.Font.Height := FontDialog1.Font.Height;
          end;
        end;
    1 : begin
          FontDialog1.Font.Color  := GraphForm.chart2.LeftAxis.Title.Font.Color;
          FontDialog1.Font.Name   := GraphForm.chart2.LeftAxis.Title.Font.Name;
          FontDialog1.Font.Size   := GraphForm.chart2.LeftAxis.Title.Font.Size;
          FontDialog1.Font.Style  := GraphForm.chart2.LeftAxis.Title.Font.Style;
          FontDialog1.Font.Pitch  := GraphForm.chart2.LeftAxis.Title.Font.Pitch;
          FontDialog1.Font.Height := GraphForm.chart2.LeftAxis.Title.Font.Height;
          if FontDialog1.Execute then
          begin
            GraphForm.chart2.LeftAxis.Title.Font.Color  := FontDialog1.Font.Color;
            GraphForm.chart2.LeftAxis.Title.Font.Name   := FontDialog1.Font.Name;
            GraphForm.chart2.LeftAxis.Title.Font.Size   := FontDialog1.Font.Size;
            GraphForm.chart2.LeftAxis.Title.Font.Style  := FontDialog1.Font.Style;
            GraphForm.chart2.LeftAxis.Title.Font.Pitch  := FontDialog1.Font.Pitch;
            GraphForm.chart2.LeftAxis.Title.Font.Height := FontDialog1.Font.Height;
          end;
        end;
    2 : begin
          FontDialog1.Font.Color  := GraphForm.chart3.LeftAxis.Title.Font.Color;
          FontDialog1.Font.Name   := GraphForm.chart3.LeftAxis.Title.Font.Name;
          FontDialog1.Font.Size   := GraphForm.chart3.LeftAxis.Title.Font.Size;
          FontDialog1.Font.Style  := GraphForm.chart3.LeftAxis.Title.Font.Style;
          FontDialog1.Font.Pitch  := GraphForm.chart3.LeftAxis.Title.Font.Pitch;
          FontDialog1.Font.Height := GraphForm.chart3.LeftAxis.Title.Font.Height;
          if FontDialog1.Execute then
          begin
            GraphForm.chart3.LeftAxis.Title.Font.Color  := FontDialog1.Font.Color;
            GraphForm.chart3.LeftAxis.Title.Font.Name   := FontDialog1.Font.Name;
            GraphForm.chart3.LeftAxis.Title.Font.Size   := FontDialog1.Font.Size;
            GraphForm.chart3.LeftAxis.Title.Font.Style  := FontDialog1.Font.Style;
            GraphForm.chart3.LeftAxis.Title.Font.Pitch  := FontDialog1.Font.Pitch;
            GraphForm.chart3.LeftAxis.Title.Font.Height := FontDialog1.Font.Height;
          end;
        end;
     end;
end;

procedure TPlotForm.SpeedButton3Click(Sender: TObject);
begin
  case GraphForm.NoteBook1.PageIndex of
    0 : begin
          FontDialog1.Font.Color  := GraphForm.chart1.BottomAxis.Title.Font.Color;
          FontDialog1.Font.Name   := GraphForm.chart1.BottomAxis.Title.Font.Name;
          FontDialog1.Font.Size   := GraphForm.chart1.BottomAxis.Title.Font.Size;
          FontDialog1.Font.Style  := GraphForm.chart1.BottomAxis.Title.Font.Style;
          FontDialog1.Font.Pitch  := GraphForm.chart1.BottomAxis.Title.Font.Pitch;
          FontDialog1.Font.Height := GraphForm.chart1.BottomAxis.Title.Font.Height;
          if FontDialog1.Execute then
          begin
            GraphForm.chart1.BottomAxis.Title.Font.Color  := FontDialog1.Font.Color;
            GraphForm.chart1.BottomAxis.Title.Font.Name   := FontDialog1.Font.Name;
            GraphForm.chart1.BottomAxis.Title.Font.Size   := FontDialog1.Font.Size;
            GraphForm.chart1.BottomAxis.Title.Font.Style  := FontDialog1.Font.Style;
            GraphForm.chart1.BottomAxis.Title.Font.Pitch  := FontDialog1.Font.Pitch;
            GraphForm.chart1.BottomAxis.Title.Font.Height := FontDialog1.Font.Height;
          end;
        end;
    1 : begin
          FontDialog1.Font.Color  := GraphForm.chart2.BottomAxis.Title.Font.Color;
          FontDialog1.Font.Name   := GraphForm.chart2.BottomAxis.Title.Font.Name;
          FontDialog1.Font.Size   := GraphForm.chart2.BottomAxis.Title.Font.Size;
          FontDialog1.Font.Style  := GraphForm.chart2.BottomAxis.Title.Font.Style;
          FontDialog1.Font.Pitch  := GraphForm.chart2.BottomAxis.Title.Font.Pitch;
          FontDialog1.Font.Height := GraphForm.chart2.BottomAxis.Title.Font.Height;
          if FontDialog1.Execute then
          begin
            GraphForm.chart2.BottomAxis.Title.Font.Color  := FontDialog1.Font.Color;
            GraphForm.chart2.BottomAxis.Title.Font.Name   := FontDialog1.Font.Name;
            GraphForm.chart2.BottomAxis.Title.Font.Size   := FontDialog1.Font.Size;
            GraphForm.chart2.BottomAxis.Title.Font.Style  := FontDialog1.Font.Style;
            GraphForm.chart2.BottomAxis.Title.Font.Pitch  := FontDialog1.Font.Pitch;
            GraphForm.chart2.BottomAxis.Title.Font.Height := FontDialog1.Font.Height;
          end;
        end;
    2 : begin
          FontDialog1.Font.Color  := GraphForm.chart3.BottomAxis.Title.Font.Color;
          FontDialog1.Font.Name   := GraphForm.chart3.BottomAxis.Title.Font.Name;
          FontDialog1.Font.Size   := GraphForm.chart3.BottomAxis.Title.Font.Size;
          FontDialog1.Font.Style  := GraphForm.chart3.BottomAxis.Title.Font.Style;
          FontDialog1.Font.Pitch  := GraphForm.chart3.BottomAxis.Title.Font.Pitch;
          FontDialog1.Font.Height := GraphForm.chart3.BottomAxis.Title.Font.Height;
          if FontDialog1.Execute then
          begin
            GraphForm.chart3.BottomAxis.Title.Font.Color  := FontDialog1.Font.Color;
            GraphForm.chart3.BottomAxis.Title.Font.Name   := FontDialog1.Font.Name;
            GraphForm.chart3.BottomAxis.Title.Font.Size   := FontDialog1.Font.Size;
            GraphForm.chart3.BottomAxis.Title.Font.Style  := FontDialog1.Font.Style;
            GraphForm.chart3.BottomAxis.Title.Font.Pitch  := FontDialog1.Font.Pitch;
            GraphForm.chart3.BottomAxis.Title.Font.Height := FontDialog1.Font.Height;
          end;
        end;
     end;
end;

procedure TPlotForm.SpinEdit2Change(Sender: TObject);
begin
  case Trunc(Spinedit2.Value) of
    1 : begin
          PlotForm.RzColorCombobox6.Selected := GraphForm.Series7.SeriesColor;
          CheckBox13.Checked := GraphForm.Series7.Active;
          CheckBox14.Checked := GraphForm.Series7.Marks.Visible;
        end;
    2 : begin
          PlotForm.RzColorCombobox6.Selected := GraphForm.Series8.SeriesColor;
          CheckBox13.Checked := GraphForm.Series8.Active;
          CheckBox14.Checked := GraphForm.Series8.Marks.Visible;
        end;
    3 : begin
          PlotForm.RzColorCombobox6.Selected := GraphForm.Series9.SeriesColor;
          CheckBox13.Checked := GraphForm.Series9.Active;
          CheckBox14.Checked := GraphForm.Series9.Marks.Visible;
        end;
    4 : begin
          PlotForm.RzColorCombobox6.Selected := GraphForm.Series10.SeriesColor;
          CheckBox13.Checked := GraphForm.Series10.Active;
          CheckBox14.Checked := GraphForm.Series10.Marks.Visible;
        end;
    5 : begin
          PlotForm.RzColorCombobox6.Selected := GraphForm.Series11.SeriesColor;
          CheckBox13.Checked := GraphForm.Series11.Active;
          CheckBox14.Checked := GraphForm.Series11.Marks.Visible;
        end;
    6 : begin
          PlotForm.RzColorCombobox6.Selected := GraphForm.Series12.SeriesColor;
          CheckBox13.Checked := GraphForm.Series12.Active;
          CheckBox14.Checked := GraphForm.Series12.Marks.Visible;
        end;
    7 : begin
          PlotForm.RzColorCombobox6.Selected := GraphForm.Series13.SeriesColor;
          CheckBox13.Checked := GraphForm.Series13.Active;
          CheckBox14.Checked := GraphForm.Series13.Marks.Visible;
        end;
    8 : begin
          PlotForm.RzColorCombobox6.Selected := GraphForm.Series14.SeriesColor;
          CheckBox13.Checked := GraphForm.Series14.Active;
          CheckBox14.Checked := GraphForm.Series14.Marks.Visible;
        end;
    9 : begin
          PlotForm.RzColorCombobox6.Selected := GraphForm.Series15.SeriesColor;
          CheckBox13.Checked := GraphForm.Series15.Active;
          CheckBox14.Checked := GraphForm.Series15.Marks.Visible;
        end;
   10 : begin
          PlotForm.RzColorCombobox6.Selected := GraphForm.Series16.SeriesColor;
          CheckBox13.Checked := GraphForm.Series16.Active;
          CheckBox14.Checked := GraphForm.Series16.Marks.Visible;
        end;
  end;
end;

procedure TPlotForm.FormShow(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

procedure TPlotForm.XMaxChange(Sender: TObject);
begin
  case NoteBook1.PageIndex of
    0 : GraphForm.Chart1.LeftAxis.Maximum := XMax.Value;
    1 : GraphForm.Chart2.LeftAxis.Maximum := XMax.Value;
    2 : GraphForm.Chart3.LeftAxis.Maximum := XMax.Value;
  end;
end;

procedure TPlotForm.XMaxAutoClick(Sender: TObject);
begin
  case NoteBook1.PageIndex of
    0 : GraphForm.Chart1.LeftAxis.AutomaticMaximum := XMaxAuto.Checked;
    1 : GraphForm.Chart2.LeftAxis.AutomaticMaximum := XMaxAuto.Checked;
    2 : GraphForm.Chart2.LeftAxis.AutomaticMaximum := XMaxAuto.Checked;
  end;
end;

procedure TPlotForm.XMinChange(Sender: TObject);
begin
  case NoteBook1.PageIndex of
    0 : GraphForm.Chart1.LeftAxis.Minimum := XMin.Value;
    1 : GraphForm.Chart2.LeftAxis.Minimum := XMin.Value;
    2 : GraphForm.Chart3.LeftAxis.Minimum := XMin.Value;
  end;
end;

procedure TPlotForm.YMaxChange(Sender: TObject);
begin
  case NoteBook1.PageIndex of
    0 : GraphForm.Chart1.BottomAxis.Maximum := YMax.Value;
    1 : GraphForm.Chart2.BottomAxis.Maximum := YMax.Value;
    2 : GraphForm.Chart3.BottomAxis.Maximum := YMax.Value;
  end;
end;

procedure TPlotForm.YMinChange(Sender: TObject);
begin
  case NoteBook1.PageIndex of
    0 : GraphForm.Chart1.BottomAxis.Minimum := YMin.Value;
    1 : GraphForm.Chart2.BottomAxis.Minimum := YMin.Value;
    2 : GraphForm.Chart3.BottomAxis.Minimum := YMin.Value;
  end;
end;

procedure TPlotForm.XMinAutoClick(Sender: TObject);
begin
  case NoteBook1.PageIndex of
    0 : GraphForm.Chart1.LeftAxis.AutomaticMinimum := XMinAuto.Checked;
    1 : GraphForm.Chart2.LeftAxis.AutomaticMinimum := XMinAuto.Checked;
    2 : GraphForm.Chart3.LeftAxis.AutomaticMinimum := XMinAuto.Checked;
  end;
end;

procedure TPlotForm.YMaxAutoClick(Sender: TObject);
begin
  case NoteBook1.PageIndex of
    0 : GraphForm.Chart1.BottomAxis.AutomaticMaximum := YMaxAuto.Checked;
    1 : GraphForm.Chart2.BottomAxis.AutomaticMaximum := YMaxAuto.Checked;
    2 : GraphForm.Chart3.BottomAxis.AutomaticMaximum := YMaxAuto.Checked;
  end;
end;

procedure TPlotForm.YMinAutoClick(Sender: TObject);
begin
  case NoteBook1.PageIndex of
    0 : GraphForm.Chart1.BottomAxis.AutomaticMinimum := YMinAuto.Checked;
    1 : GraphForm.Chart2.BottomAxis.AutomaticMinimum := YMinAuto.Checked;
    2 : GraphForm.Chart3.BottomAxis.AutomaticMinimum := YMinAuto.Checked;
  end;
end;

end.

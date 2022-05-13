unit DataGridFr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, Menus, DynamicSkinForm, SkinCtrls,
  SkinGrids, Printers;

type
  TDataGrid = class(TForm)
    PopupMenu1: TPopupMenu;
    Printgrid1: TMenuItem;
    spDynamicSkinForm1: TspDynamicSkinForm;
    advStringGrid1: TspSkinStringGrid;
    procedure Printgrid1Click(Sender: TObject);
    procedure PrintStringGrid(Grid: TspSkinStringGrid; Title: string;
      Orientation: TPrinterOrientation);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataGrid: TDataGrid;

implementation

uses Main, DataModFr;

{$R *.DFM}

procedure TDataGrid.Printgrid1Click(Sender: TObject);
begin
{  PrintGrid(advStringGrid1, 'Print Stringgrid');}
{  PrintStringGrid(advStringGrid1, SNSFile, poLandscape);}
  //Drucken im Hochformat
  if MainForm.spSkinPrintDialog1.Execute then
    PrintStringGrid(advStringGrid1, SNSFile, poPortrait);
end;

procedure TDataGrid.PrintStringGrid(Grid: TspSkinStringGrid; Title: string;
  Orientation: TPrinterOrientation);
var
  P, I, J, YPos, XPos, HorzSize, VertSize: Integer;
  AnzSeiten, Seite, Zeilen, HeaderSize, FooterSize, ZeilenSize, FontHeight: Integer;
  mmx, mmy: Extended;
  Footer: string;
begin
  //Kopfzeile, Fußzeile, Zeilenabstand, Schriftgröße festlegen
  HeaderSize := 100;
  FooterSize := 200;
  ZeilenSize := 36;
  FontHeight := 36;
  //Printer initializieren
  Printer.Orientation := Orientation;
  Printer.Title  := Title;
  Printer.BeginDoc;
  //Druck auf mm einstellen
  mmx := GetDeviceCaps(Printer.Canvas.Handle, PHYSICALWIDTH) /
    GetDeviceCaps(Printer.Canvas.Handle, LOGPIXELSX) * 25.4;
  mmy := GetDeviceCaps(Printer.Canvas.Handle, PHYSICALHEIGHT) /
    GetDeviceCaps(Printer.Canvas.Handle, LOGPIXELSY) * 25.4;

  VertSize := Trunc(mmy) * 10;
  HorzSize := Trunc(mmx) * 10;
  SetMapMode(Printer.Canvas.Handle, MM_LOMETRIC);

  //Zeilenanzahl festlegen
  Zeilen := (VertSize - HeaderSize - FooterSize) div ZeilenSize;
  //Seitenanzahl ermitteln
  if Grid.RowCount mod Zeilen <> 0 then
    AnzSeiten := Grid.RowCount div Zeilen + 1
  else
    AnzSeiten := Grid.RowCount div Zeilen;

  Seite := 1;
  //Grid Drucken
  for P := 1 to AnzSeiten do
  begin
    //Kopfzeile
    Printer.Canvas.Font.Height := 48;
    Printer.Canvas.TextOut((HorzSize div 2 - (Printer.Canvas.TextWidth(Title) div 2)),
      - 20,Title);
    Printer.Canvas.Pen.Width := 5;
    Printer.Canvas.MoveTo(0, - HeaderSize);
    Printer.Canvas.LineTo(HorzSize, - HeaderSize);
    //Fußzeile
    Printer.Canvas.MoveTo(0, - VertSize + FooterSize);
    Printer.Canvas.LineTo(HorzSize, - VertSize + FooterSize);
    Printer.Canvas.Font.Height := 36;
    Footer := 'Page: ' + IntToStr(Seite) + ' of ' + IntToStr(AnzSeiten);
    Printer.Canvas.TextOut((HorzSize div 2 - (Printer.Canvas.TextWidth(Footer) div 2)),
      - VertSize + 150,Footer);
    //Zeilen drucken
    Printer.Canvas.Font.Height := FontHeight;
    YPos := HeaderSize + 10;
    for I := 1 to Zeilen do
    begin
      if Grid.RowCount >= I + (Seite - 1) * Zeilen then
      begin
        XPos := 0;
        for J := 0 to Grid.ColCount - 1 do
        begin
          Printer.Canvas.TextOut(XPos, - YPos,
            Grid.Cells[J, I + (Seite - 1) * Zeilen - 1]);
          XPos := XPos + Grid.ColWidths[J] * 3;
        end;
        YPos := YPos + ZeilenSize;
      end;
    end;
    //Seite hinzufügen
    Inc(Seite);
    if Seite <= AnzSeiten then Printer.NewPage;
  end;
  Printer.EndDoc;
end;

end.

unit RegDetailsFr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SkinCtrls, StdCtrls, DynamicSkinForm, SDL_numlab, SkinGrids;
type
  TRegDetails = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinButton1: TspSkinButton;
    spSkinStringGrid1: TspSkinStringGrid;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegDetails: TRegDetails;

implementation

uses Main;

{$R *.DFM}


procedure TRegDetails.FormShow(Sender: TObject);
begin
  spSkinStringGrid1.Cells[0,0] := 'Equation';
  spSkinStringGrid1.Cells[0,1] := 'Coefficients';
  spSkinStringGrid1.Cells[0,2] := 'Goodness of Fit';
  spSkinStringGrid1.ColWidths[1] := 283;
end;

end.

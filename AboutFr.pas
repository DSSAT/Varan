unit AboutFr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ShellAPI, Buttons, ComCtrls, ExtCtrls,
  Menus, ImgList, GIFImage,DynamicSkinForm, SkinCtrls,
  Registry, SkinTabs, jpeg, spButtonGroup, Vcl.Imaging.GIFImg;

type
  TAboutFrm = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinExPanel1: TspSkinExPanel;
    spSkinStdLabel1: TspSkinStdLabel;
    spSkinStdLabel2: TspSkinStdLabel;
    spSkinStdLabel3: TspSkinStdLabel;
    spSkinNotebook1: TspSkinNotebook;
    spSkinStdLabel4: TspSkinStdLabel;
    spSkinButton1: TspSkinButton;
    spSkinButton2: TspSkinButton;
    Image2: TImage;
    Image3: TImage;
    spSkinPageControl1: TspSkinPageControl;
    spSkinTabSheet1: TspSkinTabSheet;
    spSkinTextLabel1: TspSkinTextLabel;
    spSkinTabSheet2: TspSkinTabSheet;
    spSkinButtonGroup1: TspSkinButtonGroup;

    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ICASA1Click(Sender: TObject);
    function  Get_MSInfo : String;
    procedure spSkinButtonGroup1Items0Click(Sender: TObject);
    procedure spSkinButtonGroup1Items1Click(Sender: TObject);
    procedure spSkinButtonGroup1Items2Click(Sender: TObject);
    procedure spSkinButtonGroup1Items3Click(Sender: TObject);
    procedure spSkinButtonGroup1Items4Click(Sender: TObject);
    procedure spSkinButtonGroup1Items5Click(Sender: TObject);
    procedure spSkinButtonGroup1Items6Click(Sender: TObject);
    procedure spSkinButtonGroup1Items7Click(Sender: TObject);
    procedure spSkinButtonGroup1Items8Click(Sender: TObject);
    procedure ShExe(const s : string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutFrm: TAboutFrm;

implementation

Uses FMXUtils, Main, DataModFr;

{$R *.DFM}

procedure TAboutFrm.ShExe(const s : string);
var
  ErrCode : integer;
begin
  ErrCode := ShellExecute (Application.Handle, PChar('open'),
             PChar (s),PCHar(''),nil,SW_NORMAL);
  MainForm.HandleError (ErrCode,s);
end;

procedure TAboutFrm.SpeedButton1Click(Sender: TObject);

begin
  ShExe(Get_MSINFO);
end;

function TAboutFrm.Get_MSInfo : String;
var
  Regist: TRegistry;
begin
  Regist := TRegistry.Create;
  Regist.RootKey := HKEY_LOCAL_MACHINE;
  if Regist.OpenKeyReadOnly('Software\Microsoft\Shared Tools\MSInfo') then
    Result := Regist.ReadString('Path')
  else
    Result := '';
  Regist.CloseKey;
  Regist.Free;
end;

procedure TAboutFrm.SpeedButton2Click(Sender: TObject);
begin
  Close;
  AboutFrm := nil;
end;

procedure TAboutFrm.FormShow(Sender: TObject);
begin
  spSkinPageControl1.ActivePageIndex := 0;
  spSkinNotebook1.PageIndex := 0;
  AboutFrm.Caption := 'About '+ MainForm.rzVersionInfo1.FileDescription;
  with spSkinTextLabel1 do
  begin
    Lines.Clear;
    Lines.Add ('');
    Lines.Add (MainForm.rzVersionInfo1.FileDescription+' ('+ MainForm.rzVersionInfo1.FileVersion+')');
    Lines.Add ('Program executed '+IntToStr(ProgramStarts)+' times.');
    Lines.Add ('Legal Copyright © '+ MainForm.rzVersionInfo1.Copyright);
    Lines.Add ('Internal Filename: '+MainForm.rzVersionInfo1.InternalName);
    Lines.Add ('');
    Lines.Add ('DSSAT v4.8 Software');
    Lines.Add ('');
    Lines.Add ('G. Hoogenboom, C.H. Porter, V. Shelia, K.J. Boote, U. Singh,');
    Lines.Add ('J.W. White, W. Pavan, F.A.A. Oliveira, L.P. Moreno-Cadena,');
    Lines.Add ('J.I. Lizaso, S. Asseng, D.N.L. Pequeno, B.A. Kimball, P.D. Alderman,');
    Lines.Add ('K.R. Thorp, M.R. Jones, S.V. Cuadra, M.S. Vianna, F.J. Villalobos,');
    Lines.Add ('T.B. Ferreira, W.D. Batchelor, J. Koo, L.A. Hunt, and J.W. Jones. 2021');
    Lines.Add ('');
    Lines.Add ('Decision Support System for Agrotechnology Transfer(DSSAT)');
    Lines.Add ('Version 4.8 (www.DSSAT.net)');
    Lines.Add ('DSSAT Foundation, Gainesville, Florida, USA.');
  end;

  spSkinStdLabel1.Caption := 'Serial Number '+RegNo;
  spSkinStdLabel2.Caption := 'Registered to Company '+Company;
  spSkinStdLabel3.Caption := 'Registered to User '+RegUser;
end;

procedure TAboutFrm.ICASA1Click(Sender: TObject);
begin
  ShExe('http://www.DSSAT.net/');
end;

procedure TAboutFrm.spSkinButtonGroup1Items0Click(Sender: TObject);
begin
  ShExe('http://www.DSSAT.net');
end;

procedure TAboutFrm.spSkinButtonGroup1Items1Click(Sender: TObject);
begin
  ShExe('http://www.IFDC.org');
end;

procedure TAboutFrm.spSkinButtonGroup1Items2Click(Sender: TObject);
begin
  ShExe('http://www.ifas.ufl.edu/');
end;

procedure TAboutFrm.spSkinButtonGroup1Items3Click(Sender: TObject);
begin
  ShExe('http://www.ifpri.org/');
end;

procedure TAboutFrm.spSkinButtonGroup1Items4Click(Sender: TObject);
begin
  ShExe('http://www.uoguelph.ca/');
end;

procedure TAboutFrm.spSkinButtonGroup1Items5Click(Sender: TObject);
begin
  ShExe('http://www.ctahr.hawaii.edu');
end;

procedure TAboutFrm.spSkinButtonGroup1Items6Click(Sender: TObject);

begin
  ShExe('https://blogs.upm.es/agsystems/');
end;

procedure TAboutFrm.spSkinButtonGroup1Items7Click(Sender: TObject);
begin
  ShExe('https://www.ars.usda.gov/pacific-west-area/maricopa-arizona/');
end;

procedure TAboutFrm.spSkinButtonGroup1Items8Click(Sender: TObject);
begin
  ShExe('https://sasri.org.za/');
end;

end.

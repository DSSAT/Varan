unit DebugFr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DynamicSkinForm, ComCtrls, SkinCtrls, FileCtrl, SkinTabs, ShellAPI,
  StdCtrls, Mask, SkinBoxCtrls, spSkinShellCtrls, spDialogs, SkinPrinter,
  spButtonGroup, ImgList, System.ImageList;

type
  TDebugFrm = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinPageControl1: TspSkinPageControl;
    spSkinTabSheet1: TspSkinTabSheet;
    spSkinTabSheet2: TspSkinTabSheet;
    spSkinTabSheet3: TspSkinTabSheet;
    spSkinSelectDirectoryDialog1: TspSkinSelectDirectoryDialog;
    spSkinListBox1: TspSkinListBox;
    spSkinDirectoryEdit1: TspSkinDirectoryEdit;
    spSkinListBox2: TspSkinListBox;
    spSkinFileEdit1: TspSkinFileEdit;
    spSkinOpenDialog1: TspSkinOpenDialog;
    spSkinListBox3: TspSkinListBox;
    spSkinInputDialog1: TspSkinInputDialog;
    spSkinLabel1: TspSkinLabel;
    spSkinTabSheet4: TspSkinTabSheet;
    spSkinGroupBox1: TspSkinGroupBox;
    spSkinStdLabel1: TspSkinStdLabel;
    spSkinFileEdit2: TspSkinFileEdit;
    spSkinButton2: TspSkinButton;
    spSkinButton1: TspSkinButton;
    spSkinButtonGroup1: TspSkinButtonGroup;
    ImageList1: TImageList;
    spSkinCheckRadioBox1: TspSkinCheckRadioBox;
    spSkinSmallPrintDialog1: TspSkinSmallPrintDialog;
    spOpenSkinDialog1: TspOpenSkinDialog;
    procedure FormShow(Sender: TObject);
    procedure spSkinListBox1ListBoxClick(Sender: TObject);
    procedure spSkinDirectoryEdit1ButtonClick(Sender: TObject);
    procedure spSkinListBox2ListBoxClick(Sender: TObject);
    procedure spSkinFileEdit1ButtonClick(Sender: TObject);
    procedure spSkinButton2Click(Sender: TObject);
    procedure spSkinButton1Click(Sender: TObject);
    procedure spSkinListBox3ListBoxClick(Sender: TObject);
    procedure spSkinLabel1Click(Sender: TObject); 
    Function DelTree(DirName : string): Boolean;
    procedure spSkinButton4Click(Sender: TObject);
    procedure spSkinButtonGroup1Items1Click(Sender: TObject);
    procedure spSkinButtonGroup1Items2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DebugFrm : TDebugFrm;
  GenCalcDir   : array[0..6] of string;
  GenCalcFiles : array[0..6] of string;
  GenCalcDat   : array[0..6] of string;

implementation

Uses fmxUtils, Main, DataModFr;

{$R *.DFM}

Function TDebugFrm.DelTree(DirName : string): Boolean;
var
  SHFileOpStruct : TSHFileOpStruct;
  DirBuf : array [0..255] of char;
begin
  try
    Fillchar(SHFileOpStruct,Sizeof(SHFileOpStruct),0) ;
    FillChar(DirBuf, Sizeof(DirBuf), 0 ) ;
    StrPCopy(DirBuf, DirName) ;
    with SHFileOpStruct do
    begin
      Wnd    := 0;
      pFrom  := @DirBuf;
      wFunc  := FO_DELETE;
      fFlags := FOF_ALLOWUNDO;
      fFlags := fFlags or FOF_NOCONFIRMATION;
      fFlags := fFlags or FOF_SILENT;
    end;
      Result := (SHFileOperation(SHFileOpStruct) = 0) ;
    except
      Result := False;
  end;
end;   

procedure TDebugFrm.FormShow(Sender: TObject);
begin
  spSkinPageControl1.ActivePageIndex := 0;

  GenCalcDir[0]        := DSSATPath;
  GenCalcFiles[0]      := ProFile;
  GenCalcFiles[1]      := Editor;
  GenCalcFiles[2]      := DefaultPriceFile;
  GenCalcDat[0]        := Emailcontact;

  if FileExists (SkinFileName) then
     spOpenSkinDialog1.InitialDir := IncludeTrailingPathDelimiter (ExtractFileDir (SkinFileName));

  spSkinFileEdit2.Text := SkinFileName;

  spSkinListBox1.ItemIndex := 0;
  spSkinListBox2.ItemIndex := 0;
  spSkinListBox3.ItemIndex := 0;
end;

procedure TDebugFrm.spSkinListBox1ListBoxClick(Sender: TObject);
begin
  spSkinDirectoryEdit1.Text := GenCalcDir[spSkinListBox1.ItemIndex];
end;

procedure TDebugFrm.spSkinDirectoryEdit1ButtonClick(Sender: TObject);
begin
  spSkinSelectDirectoryDialog1.Directory := GenCalcDir[spSkinListBox1.ItemIndex];
  if spSkinSelectDirectoryDialog1.Execute then
     GenCalcDir[spSkinListBox1.ItemIndex] := spSkinSelectDirectoryDialog1.Directory;
end;

procedure TDebugFrm.spSkinListBox2ListBoxClick(Sender: TObject);
begin
  spSkinFileEdit1.Text := GenCalcFiles[spSkinListBox2.ItemIndex];
end;

procedure TDebugFrm.spSkinFileEdit1ButtonClick(Sender: TObject);
begin
  spSkinOpenDialog1.Filter := 'All Files|*.*';
  spSkinOpenDialog1.FilterIndex := 0;
  spSkinOpenDialog1.FileName := GenCalcFiles[spSkinListBox2.ItemIndex];
  if spSkinOpenDialog1.Execute then
      GenCalcFiles[spSkinListBox2.ItemIndex] := spSkinOpenDialog1.FileName;
end;

procedure TDebugFrm.spSkinButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TDebugFrm.spSkinButton1Click(Sender: TObject);
begin
  DSSATPath        := GenCalcDir[0];
  ProFile          := GenCalcFiles[0];
  Editor           := GenCalcFiles[1];
  DefaultPriceFile := GenCalcFiles[2];
  EmailContact     := GenCalcDat[0];
  Close;
end;

procedure TDebugFrm.spSkinListBox3ListBoxClick(Sender: TObject);
begin
  spSkinLabel1.Caption := GenCalcDat[spSkinListBox3.ItemIndex];
end;

procedure TDebugFrm.spSkinLabel1Click(Sender: TObject);
begin
  GenCalcDat[spSkinListBox3.ItemIndex] :=
  spSkinInputDialog1.InputBox (spSkinListBox3.Items.Text,'Edit Value',GenCalcDat[spSkinListBox3.ItemIndex]);
  spSkinLabel1.Caption := GenCalcDat[spSkinListBox3.ItemIndex];
end;

procedure TDebugFrm.spSkinButton4Click(Sender: TObject);
begin
  if FileExists (SkinFileName) then spOpenSkinDialog1.FileName := SkinFileName;
  if spOpenSkinDialog1.Execute then
  begin
    MainForm.LoadSkin (spOpenSkinDialog1.FileName);
    SkinFileName := spOpenSkinDialog1.FileName;
    spSkinFileEdit2.Text := SkinFileName;
    if MainForm.spSkinMessage1.MessageDlg ('Do you want to load a random skin at startup?',
        mtConfirmation,[mbYes,mbNo], 0) = mrYes then RandomSkin := true else RandomSkin := false;
  end;
end;

procedure TDebugFrm.spSkinButtonGroup1Items1Click(Sender: TObject);
begin
  spSkinSmallPrintDialog1.Execute;
end;

procedure TDebugFrm.spSkinButtonGroup1Items2Click(Sender: TObject);
var
  ErrCode : integer;
begin
  ErrCode := ShellExecute (MainForm.Handle,nil,'Rundll32.exe',
             'shell32.dll,Control_RunDLL intl.cpl',nil,SW_SHOW);
  MainForm.HandleError (ErrCode,'');
end;

end.

unit Main;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls, ShellAPI,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, ComCtrls,
  ImgList, ExtDlgs, lmdclass, Registry,
  TeEngine, SkinData, DynamicSkinForm, SkinCtrls, spSkinShellCtrls,
  SkinPrinter, SkinHint, SkinBoxCtrls, spMessages, FileCtrl, Mask,
  LMDCustomComponent, LMDCustomIniComponent, LMDMRUList, jpeg, Db, 
  GIFImage, spDialogs,  ABSMain, LMDBaseMRUList, RzStatus, Vcl.HTMLHelpViewer,
  System.ImageList;
type
  TMainForm = class(TForm)
    LargeImageList: TImageList;
    SmallImageList: TImageList;
    LMDMRUList1: TLMDMRUList;
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinData1: TspSkinData;
    spCompressedStoredSkin1: TspCompressedStoredSkin;
    spSkinNotebook1: TspSkinNotebook;
    spSkinGroupBox1: TspSkinGroupBox;
    spSkinGroupBox2: TspSkinGroupBox;
    spSkinMainMenu1: TspSkinMainMenu;
    FileMenu1: TMenuItem;
    FileOpenItem1: TMenuItem;
    N6: TMenuItem;
    FilePrintItem1: TMenuItem;
    FilePrintSetupItem1: TMenuItem;
    N7: TMenuItem;
    FileExitItem1: TMenuItem;
    N8: TMenuItem;
    HelpMenu1: TMenuItem;
    HelpContentsItem1: TMenuItem;
    HelpSearchItem1: TMenuItem;
    HelpHowToUseItem1: TMenuItem;
    N9: TMenuItem;
    Reportaproblem2: TMenuItem;
    N10: TMenuItem;
    HelpAboutItem1: TMenuItem;
    spSkinButtonsBar1: TspSkinButtonsBar;
    spSkinOpenDialog1: TspSkinOpenDialog;
    spSkinSaveDialog1: TspSkinSaveDialog;
    spSkinStatusBar1: TspSkinStatusBar;
    spSkinStatusPanel1: TspSkinStatusPanel;
    spSkinGauge1: TspSkinGauge;
    spSkinHint1: TspSkinHint;
    spSkinPrintDialog1: TspSkinPrintDialog;
    spSkinPrinterSetupDialog1: TspSkinPrinterSetupDialog;
    rzCheckList2: TspSkinCheckListBox;
    spSkinGroupBox3: TspSkinGroupBox;
    rzCheckList1: TspSkinCheckListBox;
    RadioGroup1: TspSkinRadioGroup;
    spSkinGroupBox4: TspSkinGroupBox;
    rzCheckList3: TspSkinCheckListBox;
    RadioGroup2: TspSkinRadioGroup;
    spSkinSelectDirectoryDialog1: TspSkinSelectDirectoryDialog;
    spSkinButton1: TspSkinButton;
    spSkinButton2: TspSkinButton;
    spSkinButton3: TspSkinButton;
    spSkinButton4: TspSkinButton;
    spSkinButton5: TspSkinButton;
    View1: TMenuItem;
    SeasonalOutputFile1: TMenuItem;
    Reportfile1: TMenuItem;
    spSkinMessage1: TspSkinMessage;
    LMDFileOpenEdit1: TspSkinFileEdit;
    spSkinMainMenuBar1: TspSkinMainMenuBar;
    spSkinSpeedButton1: TspSkinSpeedButton;
    spSkinSpeedButton2: TspSkinSpeedButton;
    spSkinSpeedButton3: TspSkinSpeedButton;
    spSkinSpeedButton4: TspSkinSpeedButton;
    spSkinSpeedButton5: TspSkinSpeedButton;
    spSkinSpeedButton6: TspSkinSpeedButton;
    SpeedButton12: TspSkinSpeedButton;
    SpeedButton13: TspSkinSpeedButton;
    SpeedButton14: TspSkinSpeedButton;
    SpeedButton15: TspSkinSpeedButton;
    Profileselect1: TMenuItem;
    DataSource1: TDataSource;
    spSkinGroupBox7: TspSkinGroupBox;
    spSkinStdLabel2: TspSkinStdLabel;
    spSkinStdLabel1: TspSkinStdLabel;
    spSkinMRUComboBox1: TspSkinMRUComboBox;
    spSkinStdLabel3: TspSkinStdLabel;
    VaranPowerpoint1: TMenuItem;
    spSkinSpeedButton7: TspSkinSpeedButton;
    Table1: TABSTable;
    ABSDatabase1: TABSDatabase;
    spSkinButton6: TspSkinButton;
    RzVersionInfo1: TRzVersionInfo;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure ShowHint(Sender: TObject);
    procedure FileOpen(Sender: TObject);
    procedure FilePrint(Sender: TObject);
    procedure FilePrintSetup(Sender: TObject);
    procedure FileExit(Sender: TObject);
    procedure HelpContents(Sender: TObject);
    procedure HelpSearch(Sender: TObject);
    procedure HelpHowToUse(Sender: TObject);
    procedure HelpAbout(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ReadSNSHeader (var SNSFile: string);
    procedure ReadSNSFile (var SNSFile: string);
    procedure WriteSNRFile;
    procedure ReadDataCDE;
    procedure GetArguments (var Profile, ID, WorkingDirectory : string);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure HandleError (var ErrCode: integer; FileOpen: string);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Reportaproblem1Click(Sender: TObject);
    procedure LoadPriceFile;
    procedure SpeedButton10Click(Sender: TObject);
    procedure CalculateEconomicSummary;
    procedure WriteEconomicSummary;
    procedure CONVOL (var n,Error: integer; var GM: array of real);
    function  PROBIT (var P: real): real;
    procedure Read_Registry;
    procedure Write_Registry;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure LMDMRUList1Click(Sender: TObject; const aValue: String;
      var Remove: Boolean);
    procedure LMDAboutDlg1CustomClick(Sender: TObject);
    procedure LMDFileOpenEdit1AfterExit(Sender: TObject);
    procedure LMDFileOpenEdit1Change(Sender: TObject);
    procedure spSkinButtonsBar1Sections0Items0Click(Sender: TObject);
    procedure spSkinButtonsBar1Sections0Items1Click(Sender: TObject);
    procedure LoadSkin(AFileName: String);
    procedure LMDFileOpenEdit1ButtonClick(Sender: TObject);
    procedure spSkinButtonsBar1Sections1Items0Click(Sender: TObject);
    procedure Profileselect1Click(Sender: TObject);
    procedure NoPromptSavePri;
    procedure CreateOutputTable (var TName : string);
    procedure WriteMultiSNRFile;
    procedure spSkinButtonsBar1Sections0Items2Click(Sender: TObject);
    procedure spSkinMRUComboBox1Click(Sender: TObject);
    procedure VaranPowerpoint1Click(Sender: TObject);
    procedure spSkinSpeedButton7Click(Sender: TObject);
    procedure HandleConvolError(var Err: integer; var Abort : boolean);
    procedure SetupBDE;
    procedure FileSearch(const PathName, FileName : string;
                         const InDir : boolean; var RFile : string);
    procedure spSkinButton6Click(Sender: TObject);
    procedure ShExeChm(const RelPath : string);
    procedure Timer1Timer(Sender: TObject);
    procedure GarbageCollectAtoms;
    procedure MissedVarForAllTr;
  public
    { Public declarations }
    FIniFile : TRegIniFile;
  end;

var
  MainForm: TMainForm;

implementation

uses Math, Economic, FMXUtils, Stats,
     NumStr, Multi, Frmcfit, AboutFr, DebugFr, GraphFr, DataModFr,
  SummaryFr, VarViewFr, StrategyFr, DataGridFr, SequenceViewFr;

{$R *.DFM}

procedure TMainForm.ShExeChm(const RelPath : string);
var
  Target  : string;
  ErrCode : integer;
begin
  Target := AppPath+RelPath;
  if FileExists (Target) then
  begin
    ErrCode := ShellExecute (Application.Handle, PChar('open'),PChar (Target),
       PCHar(''),nil,SW_NORMAL);
    HandleError (ErrCode,Target);
  end else
    spSkinMessage1.MessageDlg('The file '+Target+' could not be found.',
    mtInformation, [mbOk], 0);
end;

procedure TMainForm.CreateOutputTable (var TName : string);
var
  i,j     : integer;
  VarName : string;
  FieldNm : string;
begin
  Table1.TableName := TName;
  if Table1.Exists then
  begin
    with Table1 do
    begin
      Active := False; { can’t delete table if it is active }
      DeleteTable;
    end;
  end;

  with Table1 do begin
    {
    The Table component must not be active
    }
    Active    := False;
    TableName := TName;
    {
    Next, describe the fields in the Table
    }
    with FieldDefs do begin
      Clear;
      with AddFieldDef do begin
        Name     := 'FileName';
        DataType := ftString;
        Required := false;
        Size     := 20;
      end;
      with AddFieldDef do begin
        Name     := 'WSTA';
        DataType := ftString;
        Required := false;
        Size     := 8;
      end;
      with AddFieldDef do begin
        Name     := 'ID_SOIL';
        DataType := ftString;
        Required := false;
        Size     := 10;
      end;
      with AddFieldDef do begin
        Name     := 'Efficient';
        DataType := ftString;
        Required := false;
        Size     := 20;
      end;

      for i := 0 to MultiTrt.spSkinListView1.Items.Count - 1 do
      begin
        if MultiTrt.spSkinListView1.Items.Item[i].Checked then
        begin
          VarName := Trim (MultiTrt.spSkinListView1.Items[i].Caption);
          for j := 1 to NTreat do
          begin
            FieldNm := 'V_'+Trim (IntToStr (mtr[j])+'_'+VarName);
            with AddFieldDef do
            begin
              Name     := FieldNm;
              DataType := ftFloat;
              Required := false;
            end;
          end;
        end;
      end;
    end;
    CreateTable;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Application.OnHint   := ShowHint;
  AppPath              := ExtractFileDir (Application.Exename);
  VaranPowerpoint1.Visible := FileExists (AppPath+'\Varan.pps');
  MainForm.Caption     := 'Seasonal Analysis Version '+ rzVersionInfo1.FileVersion;

  Read_Registry;

  spSkinNotebook1.PageIndex := 0;

  SNSFile    := '';
  FileLoaded := False;

  RadioGroup1.ItemIndex   := 0;
  Inc (ProgramStarts);
  spSkinStdLabel1.Caption := 'Registration number '+RegNo;

  SetupBDE;
  Application.HelpFile := ExtractFilePath(Application.ExeName) +
    'Varan.chm';
end;

procedure TMainForm.SetupBDE;
var
  DataPath : string;
begin
  DataPath := IncludeTrailingPathDelimiter(AppPath);
  ABSDataBase1.DatabaseFileName := DataPath+'Varan.abs';
  if not FileExists (ABSDataBase1.DatabaseFileName) then
    ABSDataBase1.CreateDatabase;
end;

procedure TMainForm.ShowHint(Sender: TObject);
begin
  spSkinStatusPanel1.Caption := Application.Hint;
end;

procedure TMainForm.FileOpen(Sender: TObject);
var
  ID      : string;
  Tempz   : string;
  i       : integer;
begin
  if FileExists (Profile) then
  begin
    ID    := 'ASD';
    TempZ := '';
    GetArguments (Profile,ID,Tempz);
    if TempZ <> '' then
       CropDir := IncludeTrailingPathDelimiter (Tempz);
    spSkinOpenDialog1.InitialDir := CropDir;
  end;

  spSkinOpenDialog1.Filter := 'Seasonal Output Files|*.osu|DSSAT v35 Output Files|*.sns|Summary OUT files|summary.*|All files|*.*';
  if spSkinOpenDialog1.Execute then
  begin
    MultipleFiles := false;
    OutputFileNum := spSkinOpenDialog1.Files.Count;
    MultiTrt.spSkinCheckListBox1.Items.Clear;

    for i := 0 to spSkinOpenDialog1.Files.Count-1 do
    begin
      MultiTrt.spSkinCheckListBox1.Items.Add (spSKinOpenDialog1.Files[i]);
      MultiTrt.spSkinCheckListBox1.Checked[i] := true;
    end;

    if OutputFileNum = 1 then
    begin
      FileLoaded := true;
      SNSFile    := spSkinOpendialog1.Filename;
      ReadSNSHeader (SNSFile);
      ReadSNSFile (SNSFile);
      MainForm.Caption := 'Seasonal Analysis : '+SNSFile;
      LMDMruList1.Add (SNSFile);
      spSkinNotebook1.PageIndex := 1;
    end else
    begin
      MultipleFiles := true;
    end;
  end;
end;

procedure TMainForm.LoadPriceFile;
var
  ID      : string;
  Tempz   : string;
  cropdir : string;
  i,j,k   : integer;
begin
  PriceFile := '';
  if FileExists (Profile) then
  begin
    ID    := 'ECD';
    TempZ := '';
    GetArguments (Profile,ID,Tempz);
    if TempZ <> '' then
       CropDir := IncludeTrailingPathDelimiter (Tempz);
    PriceFile := CropDir+ ChangeFileExt (ExtractFileName (snsfile),'.PRI');
    PriceFileDirectory := Tempz;
  end;

  if FileExists (PriceFile) then
  begin
    EcoForm.SetEconomicDefaults;
    for i := 1 to MaxTrts do
    begin
      for j := 1 to 13 do
      begin
        IDAT[i,j] := -99;
        for k := 1 to 3 do
           PDAT[i,j,k] := -99;
        end;
    end;
    if FileExists (DefaultPriceFile) then
       EcoForm.GetDefaultEconomicParameters;
    {
    After loading defaults, load actual price file
    }
    EcoForm.GetEconomicParameters;
    LMDFileOpenEdit1.Text := PriceFile;
    PricesLoaded := true;
    Exit;
  end;

  if FileExists (DefaultPriceFile) then
  begin
    EcoForm.GetDefaultEconomicParameters;
    LMDFileOpenEdit1.Text := PriceFile;
    PricesLoaded := true;
    if MultipleFiles then
    begin
      if MultiTrt.Options.Checked[3] then
      begin
        if spSkinMessage1.MessageDlg ('Do you wish to save the newly created PRI file '+Pricefile+'?',
           mtConfirmation,[mbYes,mbNo], 0) = mrYes then SpeedButton14Click(Self);
      end else
        if MultiTrt.Options.Checked[6] then NoPromptSavePri;
    end else
      if spSkinMessage1.MessageDlg ('Do you wish to save the newly created PRI file '+Pricefile+'?',
         mtConfirmation,[mbYes,mbNo], 0) = mrYes then SpeedButton14Click(Self);
    Exit;
  end;

end;

procedure TMainForm.FilePrint(Sender: TObject);
var
  ErrCode : integer;
begin
  if spSkinPrintDialog1.Execute then
  begin
    if spSkinOpenDialog1.Execute then          { Display Open dialog box }
    begin
      ErrCode := ShellExecute (Application.Handle, PChar('print'),PChar (spSkinOpenDialog1.Filename),
                 PCHar (''),nil,SW_NORMAL);
      HandleError (ErrCode, spSkinOpenDialog1.Filename);
    end;
  end;
end;

procedure TMainForm.FilePrintSetup(Sender: TObject);
begin
  with TDebugFrm.Create(nil) do
  try
    ShowModal;
  finally
    free;
  end;
end;

procedure TMainForm.FileExit(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.HelpContents(Sender: TObject);
begin
  HtmlHelp(0, Application.HelpFile, HH_DISPLAY_TOC, 0);
end;

procedure TMainForm.HelpSearch(Sender: TObject);
begin
  HtmlHelp(0, Application.HelpFile, HH_DISPLAY_INDEX, DWORD(PWideChar('')));
end;

procedure TMainForm.HelpHowToUse(Sender: TObject);
var
  Query: THH_Fts_QueryW;
begin
  with Query do
  begin
    cbStruct:= SizeOf(THH_Fts_QueryW);
    fUniCodeStrings:= True;
    pszSearchQuery:= '';
    iProximity:= 0;
    fStemmedSearch:= True;
    fTitleOnly:= False;
    fExecute:= True;
    pszWindow:= nil;
  end;
  HtmlHelp(0, Application.HelpFile, HH_DISPLAY_SEARCH, DWORD(@Query));
end;

procedure TMainForm.HelpAbout(Sender: TObject);
begin
  try
    Application.CreateForm(TAboutFrm, AboutFrm);
    spDynamicSkinForm1.ClientInActiveEffect := True;
    AboutFrm.ShowModal;
    spDynamicSkinForm1.ClientInActiveEffect := False;
  finally
    AboutFrm.Free;
  end;
end;

procedure TMainForm.SpeedButton7Click(Sender: TObject);
var
  i,j,k,x,l,
  LastStar  : integer;
  index,km  : integer;
  code,nn,m : integer;
  found     : boolean;
  Varian    : real;
  zn        : array[1..MaxYrs] of real;
  zinc      : real;
  TrtSel    : boolean;
  NumTrts,z : integer;
  xx        : array[0..MaxTrts] of real;
  pa        : array[0..ParVars] of real;
  Ierr      : integer;
  f         : TextFile;
  BelowZero : boolean;
  Base,b2   : real;
begin
  {
  Plot data
  }
  OffSet := 0.0;
  TrtSel := False;
  NumTrts := 0;
  for l := 0 to NTreat-1 do
    if RzCheckList3.Checked[l] then
    begin
      TrtSel := true;
      inc (Numtrts);
    end;

  if not TrtSel then
  begin
    spSkinMessage1.MessageDlg ('Select at least one treatment for analysis.', mtInformation,[mbOk], 0);
    exit;
  end;

  CalculateEconomicSummary;

  for km := 1 to NTreat do
  begin
    for i := 1 to ParVars do Pars[i] := 0;

    for i := 1 to Nreps do
      xx[i] := gm[i,km];

    Stats.Tukey (xx,nreps,pa,ierr);

    for i := 1 to ParVars do
       xmu[i,km] := pa[i];

    for i := 1 to NReps do
       SorDat[km,i] := xx[i];

    if Ierr <> 0 then
      spSkinMessage1.MessageDlg ('Error in Tukey!', mtWarning,[mbOk], 0);
  end;

  if NReps > 1 then
  begin
    Zinc  := 1.0/ int (nreps - 1);
    zn[1] := 0;
    for l := 2 to NReps do
    begin
      zn[l] := zn[l-1] + zinc;
    end;
  end;

  nn := 0;
  for l := 1 to NTreat do
  begin
    inc (nn);
    for k := 1 to NReps do
    begin
      Drag[nn,k] := SorDat[l,k];
    end;
  end;

  case RadioGroup2.ItemIndex of
  0 : begin
        {
        Box Plot
        }
        with GraphForm do
        begin
          Series1.Clear;
          Series1.Marks.Visible := False;
          Series1.YOrigin := 0.0;
          Series2.Clear;
          Series2.Marks.Visible := False;
          Series2.YOrigin := 0.0;
          Series3.Clear;
          Series3.Marks.Visible := False;
          Series3.YOrigin := 0.0;
          Series4.Clear;
          Series4.Marks.Visible := False;
          Series4.YOrigin := 0.0;
          Series5.Clear;
          PointSeries1.Clear;
          PointSeries2.Clear;
          PointSeries3.Clear;
          ArrowSeries1.Clear;
        end;

        DataGrid.AdvStringGrid1.ColCount := 8;
        DataGrid.AdvStringGrid1.RowCount := NTreat+1;

        for l := 1 to NTreat do
          DataGrid.AdvStringGrid1.Cells [0,l] := IntToStr (l);
        for l := 1 to 7 do
          DataGrid.AdvStringGrid1.Cells [l,0] := GrafHead[l];
        for l:= 1 to 7 do
          for j := 1 to NTreat do
             DataGrid.AdvStringGrid1.Cells [l,j] := FloattoStrF (xmu[l+2,j],ffFixed,7,2);

        BelowZero := False;
        OffSet := 0.0;
        for l := 1 to NTreat do
          begin
            if xmu[3,l] < 0.0 then
            begin
              BelowZero := true;
              OffSet := Min (OffSet,xmu[3,l]);
           end;
        end;
        if BelowZero then
        begin
          b2 := 0.0;
          repeat
             b2 := b2 - 50;
          until (b2 < Offset);
          Offset := Offset - (abs (b2) - abs (Offset));
        end;
        if BelowZero then
        begin
           for l := 1 to NTreat do
             for k := 1 to ParVars do
                xmu[k,l] := xmu[k,l]+ abs (Offset);
        end;

        for l := 1 to NTreat do
        begin
          Base := 0.0;
          BelowZero := False;
          if xmu[3,l] < 0.0 then
          begin
            GraphForm.Series1.YOrigin    := Base;
            GraphForm.Series1.UseYOrigin := true;
            GraphForm.Series2.YOrigin    := Base;
            GraphForm.Series2.UseYOrigin := true;
            GraphForm.Series3.YOrigin    := Base;
            GraphForm.Series3.UseYOrigin := true;
            GraphForm.Series4.YOrigin    := Base;
            GraphForm.Series4.UseYOrigin := true;
          end else
          begin
            base      := 0.0;
            BelowZero := False;
            GraphForm.Series1.YOrigin    := Base;
            GraphForm.Series1.UseYOrigin := true;
            GraphForm.Series2.YOrigin    := Base;
            GraphForm.Series2.UseYOrigin := true;
            GraphForm.Series3.YOrigin    := Base;
            GraphForm.Series3.UseYOrigin := true;
            GraphForm.Series4.YOrigin    := Base;
            GraphForm.Series4.UseYOrigin := true;
          end;

          if RzCheckList3.Checked[l-1] then
          begin
            if BelowZero then
            begin
              GraphForm.Series1.Add (Base,                IntToStr(l),GraphForm.Series1.SeriesColor);

              if (xmu[3,l] < 0.0) and (xmu[5,l] < 0.0) then
                GraphForm.Series2.Add (xmu[3,l],FloattoStr (xmu[3,l]),GraphForm.Series2.SeriesColor)
              else if (xmu[5,l] >= 0.0) and (xmu[3,l] < 0.0) then
                GraphForm.Series2.Add (xmu[3,l],FloattoStr (xmu[3,l]),GraphForm.Series2.SeriesColor)
              else
                GraphForm.Series2.Add (xmu[5,l]-xmu[3,l],FloattoStr (xmu[5,l]),GraphForm.Series2.SeriesColor);

              if xmu[5,l] < 0.0 then
                GraphForm.Series3.Add (xmu[5,l],FloattoStr (xmu[5,l]),GraphForm.Series3.SeriesColor)
              else if (xmu[5,l] >= 0.0) and (xmu[3,l] < 0.0) then
                GraphForm.Series3.Add (xmu[5,l],FloattoStr (xmu[5,l]),GraphForm.Series3.SeriesColor)
              else
                GraphForm.Series3.Add (xmu[5,l]-xmu[3,l],FloattoStr (xmu[5,l]),GraphForm.Series3.SeriesColor);

              if xmu[7,l] < 0.0 then
                GraphForm.Series4.Add (xmu[7,l],FloattoStr (xmu[7,l]),GraphForm.Series4.SeriesColor)
              else if (xmu[9,l] >= 0.0) and (xmu[7,l] < 0.0) then
                GraphForm.Series4.Add (xmu[7,l],FloattoStr (xmu[9,l]),GraphForm.Series4.SeriesColor)
              else
                GraphForm.Series4.Add (xmu[9,l]-xmu[7,l],FloattoStr (xmu[9,l]),GraphForm.Series4.SeriesColor);

            end else

            begin
              GraphForm.Series1.Add (xmu[3,l],            IntToStr(l),GraphForm.Series1.SeriesColor);

              if xmu[5,l] < 0.0 then
                GraphForm.Series2.Add (xmu[5,l],FloattoStr (xmu[5,l]),GraphForm.Series2.SeriesColor)
              else if (xmu[5,l] >= 0.0) and (xmu[3,l] < 0.0) then
                GraphForm.Series2.Add (xmu[5,l],FloattoStr (xmu[5,l]),GraphForm.Series2.SeriesColor)
              else
               GraphForm.Series2.Add (xmu[5,l]-xmu[3,l],FloattoStr (xmu[5,l]),GraphForm.Series2.SeriesColor);

              if xmu[7,l] < 0.0 then
                GraphForm.Series3.Add (xmu[7,l],FloattoStr (xmu[7,l]),GraphForm.Series3.SeriesColor)
              else if (xmu[7,l] >= 0.0) and (xmu[5,l] < 0.0) then
                GraphForm.Series3.Add (xmu[7,l],FloattoStr (xmu[7,l]),GraphForm.Series3.SeriesColor)
              else
                GraphForm.Series3.Add (xmu[7,l]-xmu[5,l],FloattoStr (xmu[7,l]),GraphForm.Series3.SeriesColor);

              if xmu[9,l] < 0.0 then
                GraphForm.Series4.Add (xmu[9,l],FloattoStr (xmu[9,l]),GraphForm.Series4.SeriesColor)
              else if (xmu[9,l] >= 0.0) and (xmu[7,l] < 0.0) then
                GraphForm.Series4.Add (xmu[9,l],FloattoStr (xmu[9,l]),GraphForm.Series4.SeriesColor)
              else
                GraphForm.Series4.Add (xmu[9,l]-xmu[7,l],FloattoStr (xmu[9,l]),GraphForm.Series4.SeriesColor);
            end;

            Graphform.Series5.Add (xmu[6,l],           FloattoStr (xmu[6,l]),GraphForm.Series5.SeriesColor);
          end;
        end;

        for l := 1 to NTreat do
          for k := 1 to 9 do
            xmu[k,l] := xmu[k,l]- abs (offset);

        LastStar := 1;
        for i := 1 to NTreat do
        begin
          LastStar :=  LastStar + 1;
          GraphForm.PointSeries1.AddY (xmu[3,i],IntToStr(i),GraphForm.Series5.seriescolor);
          { Bar }
          Graphform.ArrowSeries1.AddArrow (i-1,xmu[5,i],i-1,xmu[7,i],IntToStr(i),GraphForm.ArrowSeries1.seriescolor);
          GraphForm.Arrowseries1.addArrow (i-1,xmu[7,i],i-1,xmu[5,i],IntToStr(i),GraphForm.ArrowSeries1.seriescolor);
          { p50 }
          GraphForm.PointSeries2.AddY (xmu[6,i],IntToStr(i),GraphForm.PointSeries2.seriescolor);
          {p100 }
          GraphForm.PointSeries3.AddY (xmu[9,i],IntToStr(i),GraphForm.PointSeries3.seriescolor);
        end;

        GraphForm.Chart1.Title.Text[0]            := 'Box Plot of Monetary Returns per HA';
        GraphForm.Chart1.LeftAxis.Title.Caption   := 'Money / HA';
        GraphForm.Chart1.BottomAxis.Title.Caption := 'Treatment';
        GraphForm.Notebook1.PageIndex             := 0;
        GraphForm.Chart4.Title.Text[0]            := 'Box Plot of Monetary Returns per HA';
        GraphForm.Chart4.LeftAxis.Title.Caption   := 'Money / HA';
        GraphForm.Chart4.BottomAxis.Title.Caption := 'Treatment';
        GraphForm.ArrowSeries1.ArrowHeight        :=  1;
        GraphForm.ArrowSeries1.ArrowWidth         := 10;
        GraphForm.Notebook1.PageIndex             :=  0;

        GraphForm.Showmodal;

     end;
  2: begin
       with GraphForm do
       begin
         Series6.Clear;
       end;
       for l := 1 to NTreat do
       begin
         if RzCheckList3.Checked[l-1] then
         begin
           Varian := xmu[2,l]*xmu[2,l];
           GraphForm.Series6.AddXY (xmu[2,l]*xmu[2,l],xmu[1,l],inttostr(l),GraphForm.Series6.SeriesColor);
         end;
       end;

       GraphForm.Chart2.Title.Text[0]            := 'E-V Plot of Monetary Returns per HA';
       GraphForm.Chart2.LeftAxis.Title.Caption   := 'Mean';
       GraphForm.Chart2.BottomAxis.Title.Caption := 'Variance';
       GraphForm.Notebook1.PageIndex := 1;
       if NumTrts = 1 then
          spSkinMessage1.MessageDlg ('You must select at least two treatments.', mtInformation,[mbOk], 0)
        else
          GraphForm.Showmodal;

     end;
  1: begin
       with GraphForm do
       begin
         Series7.Clear;
         Series7.Active  := False;
         Series8.Clear;
         Series8.Active  := False;
         Series9.Clear;
         Series9.Active  := False;
         Series10.Clear;
         Series10.Active := False;
         Series11.Clear;
         Series11.Active := False;
         Series12.Clear;
         Series12.Active := False;
         Series13.Clear;
         Series13.Active := False;
         Series14.Clear;
         Series14.Active := False;
         Series15.Clear;
         Series15.Active := False;
         Series16.Clear;
         Series16.Active := False;
       end;

       z := 1;

       for l := 1 to NTreat do
       begin
         if RzCheckList3.Checked[l-1] then
         begin
         case z of
           1: begin
                GraphForm.Series7.Active := true;
                GraphForm.Series7.Title  := RzCheckList3.Items.Strings[l-1];
                for m := 1 to NReps do
                   GraphForm.Series7.AddXY (Drag[l,m],zn[m],FloatToStr (Drag[l,m]),GraphForm.Series7.AreaColor);
                inc (z);
              end;
           2: begin
                GraphForm.Series8.Active := true;
                GraphForm.Series8.Title  := RzCheckList3.Items.Strings[l-1];
                for m := 1 to NReps do
                  GraphForm.Series8.AddXY (Drag[l,m],zn[m],FloatToStr (Drag[l,m]),GraphForm.Series8.AreaColor);
                inc (z);
              end;
           3: begin
                GraphForm.Series9.Active := true;
                GraphForm.Series9.Title  := RzCheckList3.Items.Strings[l-1];
                for m := 1 to NReps do
                   GraphForm.Series9.AddXY (Drag[l,m],zn[m],FloatToStr (Drag[l,m]),GraphForm.Series9.AreaColor);
                inc (z);
              end;
           4: begin
                GraphForm.Series10.Active := true;
                GraphForm.Series10.Title  := RzCheckList3.Items.Strings[l-1];
                for m := 1 to NReps do
                   GraphForm.Series10.AddXY (Drag[l,m],zn[m],FloatToStr (Drag[l,m]),GraphForm.Series10.AreaColor);
                inc (z);
              end;
           5: begin
                GraphForm.Series11.Active := true;
                GraphForm.Series11.Title   := RzCheckList3.Items.Strings[l-1];
                for m := 1 to NReps do
                   GraphForm.Series11.AddXY (Drag[l,m],zn[m],FloatToStr (Drag[l,m]),GraphForm.Series11.AreaColor);
                inc (z);
              end;
           6: begin
                GraphForm.Series12.Active := true;
                GraphForm.Series12.Title  := RzCheckList3.Items.Strings[l-1];
                for m := 1 to NReps do
                   GraphForm.Series12.AddXY (Drag[l,m],zn[m],FloatToStr (Drag[l,m]),GraphForm.Series12.AreaColor);
                inc (z);
              end;
           7: begin
                GraphForm.Series13.Active := true;
                GraphForm.Series13.Title  := RzCheckList3.Items.Strings[l-1];
                for m := 1 to NReps do
                   GraphForm.Series13.AddXY (Drag[l,m],zn[m],FloatToStr (Drag[l,m]),GraphForm.Series13.AreaColor);
                inc (z);
              end;
           8: begin
                GraphForm.Series14.Active := true;
                GraphForm.Series14.Title  := RzCheckList3.Items.Strings[l-1];
                for m := 1 to NReps do
                   GraphForm.Series14.AddXY (Drag[l,m],zn[m],FloatToStr (Drag[l,m]),GraphForm.Series14.AreaColor);
                inc (z);
              end;
           9: begin
                GraphForm.Series15.Active := true;
                GraphForm.Series15.Title  := RzCheckList3.Items.Strings[l-1];
                for m := 1 to NReps do
                  GraphForm.Series15.AddXY (Drag[l,m],zn[m],FloatToStr (Drag[l,m]),GraphForm.Series15.AreaColor);
                inc (z);
              end;
          10: begin
                GraphForm.Series16.Active := true;
                GraphForm.Series16.Title  := RzCheckList3.Items.Strings[l-1];
                for m := 1 to NReps do
                begin
                  GraphForm.Series16.AddXY (Drag[l,m],zn[m],FloatToStr (Drag[l,m]),GraphForm.Series16.AreaColor);
                end;
                inc (z);
              end;
            end;
         end;
       end;

       GraphForm.Chart3.Title.Text[0]            := 'CPF Plot of Monetary Returns per HA';
       GraphForm.Chart3.LeftAxis.Title.Caption   := 'Cumulative Probability';
       GraphForm.Chart3.BottomAxis.Title.Caption := 'Money /HA';
       GraphForm.Notebook1.PageIndex := 2;
       GraphForm.Showmodal;
    end;
  end;
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
var
  i,j,k,x,l,
  i1 : integer;
  index,km  : integer;
  code,nn,m : integer;
  found     : boolean;
  Varian    : real;
  zn        : array[1..MaxYrs] of real;
  zinc      : real;
  TrtSel    : boolean;
  NumTrts,z : integer;
  LastStar  : integer;
  NumOfMissing : Integer;
begin
  {
  Show analysis file
  }
  Offset  := 0.0;
  TrtSel  := False;
  NumTrts := 0;

  for l := 0 to NTreat - 1 do
    if RzCheckList1.Checked[l] then
    begin
      TrtSel := true;
      inc (Numtrts);
    end;

  if not TrtSel then
  begin
    spSkinMessage1.MessageDlg ('Select at least one treatment for analysis.', mtInformation,[mbOk], 0);
    exit;
  end;

  found := False;
  j := RzCheckList2.Items.Count;
  for index := 0 to j-1 do
  begin
    x := 1;
    for i := 0 to j-1 do
    begin
      k := HeaderOrd[index + 1];
      if HeaderOrd[i+1] < k then inc (x);
    end;

    if RzChecklist2.Checked[index] then
    begin
      for km := 1 to NTreat do
      begin
        for l := 1 to ParVars do Pars[l] := 0.0;

        for l := 1 to NReps do
           TukDat[l] := OutDat[x,l+(km-1)*Nreps];

        NumOfMissing := 0;
        for l := 1 to NReps do
          if Int(TukDat[l]) = -99 then
              NumOfMissing := NumOfMissing + 1;

        i := 1;
        for l := 1 to NReps do
          if Int(TukDat[l]) <> -99 then
          begin
              TukDat[i] := TukDat[l] ;
              i := i + 1;
          end;

        NumOfMissing := NReps-NumOfMissing;

        Stats.Tukey (TukDat,NumOfMissing,Pars,Code);

        for l := 1 to ParVars do
          ParDat [l,km] := Pars[l];

        for l := 1 to NReps do
          SorDat[km,l] := TukDat[l];

        if NReps > 1 then
        begin
          Zinc := 1.0/ int (nreps - 1);
          zn[1] := 0;
          for l := 2 to NReps do
            zn[l] := zn[l-1] + zinc;
        end;

        nn := 0;
        for l := 1 to NTreat do
        begin
          inc (nn);
          for k := 1 to NReps do
            Drag[nn,k] := SorDat[l,k];
        end;
      end;

      case RadioGroup1.ItemIndex of
      0 : begin
            {
            Box Plot
            }

            offset := ParDat [3,1]*0.95;
            for km := 1 to NTreat do
            begin
              if offset > (ParDat [3,km]) then
                offset := ParDat [3,km]*0.95;
            end;

            for km := 1 to NTreat do
            begin
              for l := 1 to ParVars do
                ParDat [l,km] := ParDat [l,km] - offset;
            end;


            with GraphForm do
            begin
              Series1.Clear;
              Series1.Marks.Visible := False;
              Series2.Clear;
              Series2.Marks.Visible := False;
              Series3.Clear;
              Series3.Marks.Visible := False;
              Series4.Clear;
              Series4.Marks.Visible := False;
              Series5.Clear;
            end;

            LastStar := 0;
            for l := 1 to NTreat do
            begin
              if RzCheckList1.Checked[l-1] then
              begin
                LastStar := LastStar + 1;
                GraphForm.Series1.Add (ParDat[3,l],                         IntToStr(l),GraphForm.Series1.SeriesColor);
                GraphForm.Series2.Add (ParDat[5,l]-ParDat[3,l],FloattoStr (ParDat[5,l]),GraphForm.Series2.SeriesColor);
                GraphForm.Series3.Add (ParDat[7,l]-ParDat[5,l],FloattoStr (ParDat[7,l]),GraphForm.Series3.SeriesColor);
                GraphForm.Series4.Add (ParDat[9,l]-ParDat[7,l],FloattoStr (ParDat[9,l]),GraphForm.Series4.SeriesColor);
                Graphform.Series5.Add (ParDat[6,l],            FloattoStr (ParDat[6,l]),GraphForm.Series5.SeriesColor);
              end;
            end;

            GraphForm.Chart1.Title.Text[0]            := 'Box Plot of '+LongDesc[index+1];
            GraphForm.Chart1.LeftAxis.Title.Caption   := ShortDesc[index+1];
            GraphForm.Chart1.BottomAxis.Title.Caption := 'Treatment';
            GraphForm.Notebook1.PageIndex             := 0;
            GraphForm.Showmodal;
            found := true;
         end;
      2: begin
           with GraphForm do
            begin
              Series6.Clear;
            end;
            for l := 1 to NTreat do
            begin
              if RzCheckList1.Checked[l-1] then
              begin
                Varian := ParDat[2,l]*ParDat[2,l];
                GraphForm.Series6.AddXY (ParDat[2,l]*ParDat[2,l],ParDat[1,l],inttostr(l),GraphForm.Series6.SeriesColor);
              end;
            end;
            Graphform.Series6.YValues.Order := loDescending;
            Graphform.Series6.YValues.Sort;

            GraphForm.Chart2.Title.Text[0]            := 'E-V Plot of '+LongDesc[index+1];
            GraphForm.Chart2.LeftAxis.Title.Caption   := 'Mean';
            GraphForm.Chart2.BottomAxis.Title.Caption := 'Variance';

            GraphForm.Notebook1.PageIndex := 1;
            if NumTrts = 1 then
               spSkinMessage1.MessageDlg ('You must select at least two treatments.', mtInformation,[mbOk], 0)
             else
               GraphForm.Showmodal;
            found := true;
         end;
      1: begin
           with GraphForm do
           begin
             Series7.Clear;
             Series7.Active  := False;
             Series8.Clear;
             Series8.Active  := False;
             Series9.Clear;
             Series9.Active  := False;
             Series10.Clear;
             Series10.Active := False;
             Series11.Clear;
             Series11.Active := False;
             Series12.Clear;
             Series12.Active := False;
             Series13.Clear;
             Series13.Active := False;
             Series14.Clear;
             Series14.Active := False;
             Series15.Clear;
             Series15.Active := False;
             Series16.Clear;
             Series16.Active := False;
           end;

           z := 1;

           for l := 1 to NTreat do
           begin
             if RzCheckList1.Checked[l-1] then
             begin
             case z of
               1: begin
                    GraphForm.Series7.Active := true;
                    GraphForm.Series7.Title  := RzCheckList1.Items.Strings[l-1];
                    for m := 1 to NReps do
                      GraphForm.Series7.AddXY (Drag[l,m],zn[m],FloatToStr (Drag[l,m]),GraphForm.Series7.AreaColor);
                    GraphForm.Series7.AddXY (Drag[l,NReps],zn[NReps],FloatToStr (Drag[l,NReps]),GraphForm.Series7.AreaColor);
                    inc (z);
                  end;
               2: begin
                    GraphForm.Series8.Active := true;
                    GraphForm.Series8.Title  := RzCheckList1.Items.Strings[l-1];
                    for m := 1 to NReps do
                      GraphForm.Series8.AddXY (Drag[l,m],zn[m],FloatToStr (Drag[l,m]),GraphForm.Series8.AreaColor);
                    GraphForm.Series8.AddXY (Drag[l,NReps],zn[NReps],FloatToStr (Drag[l,NReps]),GraphForm.Series8.AreaColor);
                    inc (z);
                   end;
                3: begin
                     GraphForm.Series9.Active := true;
                     GraphForm.Series9.Title  := RzCheckList1.Items.Strings[l-1];
                     for m := 1 to NReps do
                       GraphForm.Series9.AddXY (Drag[l,m],zn[m],FloatToStr (Drag[l,m]),GraphForm.Series9.AreaColor);
                     GraphForm.Series9.AddXY (Drag[l,NReps],zn[NReps],FloatToStr (Drag[l,NReps]),GraphForm.Series9.AreaColor);
                     inc (z);
                   end;
                4: begin
                     GraphForm.Series10.Active := true;
                     GraphForm.Series10.Title  := RzCheckList1.Items.Strings[l-1];
                     for m := 1 to NReps do
                       GraphForm.Series10.AddXY (Drag[l,m],zn[m],FloatToStr (Drag[l,m]),GraphForm.Series10.AreaColor);
                     GraphForm.Series10.AddXY (Drag[l,NReps],zn[NReps],FloatToStr (Drag[l,NReps]),GraphForm.Series10.AreaColor);
                     inc (z);
                   end;
                5: begin
                     GraphForm.Series11.Active := true;
                     GraphForm.Series11.Title   := RzCheckList1.Items.Strings[l-1];
                     for m := 1 to NReps do
                       GraphForm.Series11.AddXY (Drag[l,m],zn[m],FloatToStr (Drag[l,m]),GraphForm.Series11.AreaColor);
                     GraphForm.Series11.AddXY (Drag[l,NReps],zn[NReps],FloatToStr (Drag[l,NReps]),GraphForm.Series11.AreaColor);
                     inc (z);
                   end;
                6: begin
                     GraphForm.Series12.Active := true;
                     GraphForm.Series12.Title  := RzCheckList1.Items.Strings[l-1];
                     for m := 1 to NReps do
                       GraphForm.Series12.AddXY (Drag[l,m],zn[m],FloatToStr (Drag[l,m]),GraphForm.Series12.AreaColor);
                     GraphForm.Series12.AddXY (Drag[l,NReps],zn[NReps],FloatToStr (Drag[l,NReps]),GraphForm.Series12.AreaColor);
                     inc (z);
                   end;
                7: begin
                     GraphForm.Series13.Active := true;
                     GraphForm.Series13.Title  := RzCheckList1.Items.Strings[l-1];
                     for m := 1 to NReps do
                       GraphForm.Series13.AddXY (Drag[l,m],zn[m],FloatToStr (Drag[l,m]),GraphForm.Series13.AreaColor);
                     GraphForm.Series13.AddXY (Drag[l,NReps],zn[NReps],FloatToStr (Drag[l,NReps]),GraphForm.Series13.AreaColor);
                     inc (z);
                   end;
                8: begin
                     GraphForm.Series14.Active := true;
                     GraphForm.Series14.Title  := RzCheckList1.Items.Strings[l-1];
                     for m := 1 to NReps do
                       GraphForm.Series14.AddXY (Drag[l,m],zn[m],FloatToStr (Drag[l,m]),GraphForm.Series14.AreaColor);
                     GraphForm.Series14.AddXY (Drag[l,NReps],zn[NReps],FloatToStr (Drag[l,NReps]),GraphForm.Series14.AreaColor);
                     inc (z);
                   end;
                9: begin
                     GraphForm.Series15.Active := true;
                     GraphForm.Series15.Title  := RzCheckList1.Items.Strings[l-1];
                     for m := 1 to NReps do
                       GraphForm.Series15.AddXY (Drag[l,m],zn[m],FloatToStr (Drag[l,m]),GraphForm.Series15.AreaColor);
                     GraphForm.Series15.AddXY (Drag[l,NReps],zn[NReps],FloatToStr (Drag[l,NReps]),GraphForm.Series15.AreaColor);
                     inc (z);
                   end;
               10: begin
                     GraphForm.Series16.Active := true;
                     GraphForm.Series16.Title  := RzCheckList1.Items.Strings[l-1];
                     for m := 1 to NReps do
                       GraphForm.Series16.AddXY (Drag[l,m],zn[m],FloatToStr (Drag[l,m]),GraphForm.Series16.AreaColor);
                     GraphForm.Series16.AddXY (Drag[l,NReps],zn[NReps],FloatToStr (Drag[l,NReps]),GraphForm.Series16.AreaColor);
                     inc (z);
                   end;
                 end;
              end;
            end;

            GraphForm.Chart3.Title.Text[0]            := 'CPF Plot of '+LongDesc[index+1];
            GraphForm.Chart3.LeftAxis.Title.Caption   := 'Cumulative Probability';
            GraphForm.Chart3.BottomAxis.Title.Caption := ShortDesc[index+1];
            GraphForm.Notebook1.PageIndex := 2;
            GraphForm.Showmodal;
            found := true;
         end;
      end;
    end;
  end;
  if not found then spSkinMessage1.MessageDlg ('Please select a variable for analysis.', mtInformation,[mbOk], 0);
end;

procedure TMainForm.ReadSNSHeader (var SNSFile: string);
var
  f       : Textfile;
  s,c,d   : string;
  i,j,k,l : integer;
  a,b,m   : integer;
begin
  if FileExists (SNSFile) then
  begin
    HeaderMin := 43;
    ExpTitle  := '';

    RzCheckList2.Items.Clear;

    SNSLines  := 0;
    k         := 0;

    Assignfile (f,SNSFile);
    Reset (f);
    while not EOF (f) do
    begin
      readln (f,s);
      inc (SNSLines);
      if Uppercase (copy (s,1,8)) = '*SUMMARY' then
      begin
        ExpTitle := copy (s,23,60);
        ExpCode  := copy (s,12, 8);
        CG       := copy (s,20, 2);
        ExpTitle := copy (s,22,length(s)-22);
      end;
      if Uppercase (copy (s,1,1)) = '@' then
      begin
        TRNO := 0;
        j := AnsiPos ('TRNO',s);
        if j > 0 then Trno := j + 4;
        if TRNO = 0 then
        begin
          j := AnsiPos ('TN ',s);
          if j = 0 then
            spSkinMessage1.MessageDlg ('I could not find a treatment header!', mtInformation,[mbOk], 0)
          else
             Trno := j + 2;
        end;
        CrNo := 2;
        Crno := AnsiPos ('CR ',s);
        WSTA_Pos := AnsiPos ('WSTA',UpperCase (s));
        Soil_Pos := AnsiPos ('SOIL',UpperCase (s));

        for i := 1 to Codes do
        begin
          j := AnsiPos (TrimRight(CodeAcro[i]),s);
          if TrimRight (CodeAcro[i]) = 'WSTA' then j := 0;
          if j > 0 then
          begin
            if (Uppercase (TrimRight(CodeAcro[i])) = 'FNAM') or
               (Uppercase (TrimRight(CodeAcro[i])) = 'TNAM') or
               (Uppercase (TrimRight(CodeAcro[i])) = 'SOIL_I')
            then
            begin
              if Uppercase (TrimRight(CodeAcro[i])) = 'FNAM' then HeaderMin   := j + 8;
              if Uppercase (TrimRight(CodeAcro[i])) = 'SOIL_I' then HeaderMin := j + 10;
              if Uppercase (TrimRight(CodeAcro[i])) = 'TNAM' then TreatMin    := j;
            end else
            begin
               inc (k);
               RzCheckList2.Items.Add (CodeShort[i]);
               LongDesc[k]   := CodeLong[i];
               ShortDesc[k]  := CodeShort[i];
               HeaderAcro[k] := CodeAcro[i];
               HeaderOrd[k]  := j;
               if length (trim( headeracro[k])) = 4 then
               HeaderLoc[k]  := j+3
               else
               HeaderLoc[k]  := j + 4;
              { HeaderLoc[k]  := j+3;}
            end;
          end;
        end;
      end;
    end;
    Closefile (f);

    for l := 1 to k do
    begin
      for i := 2 to k do
      begin
        if headerloc[i] < headerloc[i-1] then
        begin
          a := headerloc [i];
          b := headerloc [i-1];
          c := headeracro[i];
          d := headeracro[i-1];
          headerloc[i-1] := a;
          headerloc[i]   := b;
          headeracro[i-1]:= c;
          headeracro[i]  := d;
          for m := 1 to 13 do
            if trim (Headeracro[i]) = v35Var [m] then EcoLoc [m] := i;
          for m := 1 to 13 do
            if trim (Headeracro[i]) = v40Var [m] then EcoLoc [m] := i;
        end;
      end;
    end;
  end;
  NumFields := k;
end;

procedure TMainForm.ReadSNSFile (var SNSFile: string);
var
  f           : Textfile;
  s,s1        : string;
  tmp,tmp2    : string;
  i,j,k       : integer;
  s2          : string[1];
  Header      : string[42];
  Code        : integer;
  Last,
  Nat         : integer;
  IYR         : real;
  Wrds        : byte;
  SHowError   : boolean;
  HeaderCodes : string;
  Temp : string;
begin
  if FileExists (SNSFile) then
  begin
    Assignfile (f,SNSFile);
    Reset (f);

    j      := 0;
    k      := 0;
    Last   := 0;
    NTreat := 0;
    spSkinGauge1.ShowPercent := true;
    ShowError := true;

    while not EOF (f) do
    begin
      readln (f,s);
      s1 := StringReplace(s,'********','99999.99',[rfIgnoreCase, rfReplaceAll]);
      s := s1;
      inc (k);
      s1 := TrimLeft (s);
      s2 := copy (s1,1,1);
      if s2 = '@' then HeaderCodes := s;
      if not ((s2 = '!') or (s2 = '*') or (s2 = '') or (s2 = '@')) then
      begin
        Header := copy (s,1,42);
        inc (j);

        for i := 1 to NumFields {41 }{35} do
        begin
          if i = 1 then
          begin
            tmp := copy (s,91,(HeaderLoc[i]+1)-91);
            Val(tmp, OutDat[i,j], Code);
          end else
          if i = 2 then
          begin
            tmp := copy (s,HeaderMin,(HeaderLoc[i]+1)-Headermin);
            Val(tmp, OutDat[i,j], Code);
          end else
          begin
            tmp := copy (s,HeaderLoc[i-1]+1,HeaderLoc[i]-HeaderLoc[i-1]);
            wrds := WordCnt (tmp);
            if wrds > 1 then
            begin
              tmp2 := ExtractWords(wrds,1,tmp);
              Val(tmp2, OutDat[i,j], Code);
              if ShowError then
              begin
                tmp2 := ExtractWords(1,wrds-1,copy (headercodes,HeaderLoc[i-1]+1,HeaderLoc[i]-HeaderLoc[i-1]));
                spSkinMessage1.MessageDlg ('It appears that the following variable(s) are not defined in DATA.CDE ...'+chr(13)
                                           +'[ '+Tmp2+' ]', mtWarning,[mbOk], 0);
                ShowError := false;
              end;
            end else
            Val(tmp, OutDat[i,j], Code);
          end;
          {
          Error during conversion to real?
          }
          if Code <> 0 then
          begin
            spSkinMessage1.MessageDlg ('Error reading line '+inttostr (k)+' at position: ' + IntToStr(37+(i*6)+Code)
                        +#13+'String = '+tmp+#13+'File : '+SNSFile
                        +#13+'There may be an undefined header acronym in the output file.', mtWarning,[mbOk], 0);
            Closefile (f);
            FileLoaded := False;
            Exit;
          end;
        end;

        WSTA   := Copy (s,WSTA_Pos, 8);
        IDSoil := Copy (s,Soil_Pos,10);

        Val(copy (s,Trno-3,3), Nat, Code);

        if (Nat <> Last) then
        begin
          Inc (NTreat);
          MTR[NTreat] := Nat;

          if NTreat <= 0 then
          begin
            spSkinMessage1.MessageDlg('Error in treatment levels!  Exiting.', mtError,[mbOk], 0);
            Closefile (f);
            FileLoaded := False;
            Exit;
          end;

          CCode[NTreat] := copy (s,CrNo, 2);
          TNAM [NTreat] := copy (s,TreatMin,19);
          FNAM [NTreat] := copy (s,HeaderMin-10, 10);

          Last := Nat;
        end;
        for i := 2 to 6 do
        begin
          IYR         := int (OutDat[i,j]/1000.0);
          OutDat[i,j] := OutDat[i,j]- (IYR*1000.0);
        end;
      end;

      spSKinGauge1.Value := round ((k/SNSLines)*100.0);
    end;
    Closefile (f);

    NRuns := j;
    NReps := j div NTreat;

    if NRuns mod NReps <> 0 then
    begin
      spSkinMessage1.MessageDlg ('Unequal treatment replications found!  Exiting.', mtInformation,[mbOk], 0);
      spSKinGauge1.Value := 0;
      spSkinGauge1.ShowPercent := false;
      FileLoaded := False;
      Exit;
    end;

    spSKinGauge1.Value := 0;
    spSkinGauge1.ShowPercent := false;
    SeasonalOutputFile1.Enabled := true;

    Summary.SetupListView;

    if MultipleFiles then
    begin
      if MultiTrt.Options.Checked[0] then Summary.ShowModal;

      if MultiTrt.Options.Checked[1] then
         WriteSNRFile
       else
         WriteMultiSNRFile;
    end else
    begin
      spDynamicSkinForm1.ClientInActiveEffect := True;
      Summary.ShowModal;
      spDynamicSkinForm1.ClientInActiveEffect := False;
      WriteSNRFile;
    end;
    MissedVarForAllTr;
  end;
end;

procedure TMainForm.WriteSNRFile;
var
  f      : TextFile;
  i,j,k,
  x,l    : integer;
  index  : integer;
  km     : integer;
  code   : integer;

  NumOfMissing : integer;

begin
  SNRFile                    := ChangeFileExt (SNSFile,'.OSR');
  spSkinSaveDialog1.FileName := SNRFile;
  spSkinSaveDialog1.Filter   := 'Report Files|*.osr|DSSAT v35 Report file|*.snr|All files|*.*';
  spSkinSaveDialog1.Title    := 'Save Seasonal Report as ..';

  if spSkinSaveDialog1.Execute then
  begin
    SNRFile := spSkinSaveDialog1.FileName;
    AssignFile (f,SNRFile);
    Rewrite (f);
    {
    Write out analysis file
    }
    Writeln (f,'SN_ANALYSIS_LOG');
    Writeln (f);
    Writeln (f,'Input file      : '+ SNSFile);
    Writeln (f,'Experiment title: '+ TrimLeft(ExpTitle));
    Writeln (f,'Experiment code : '+ ExpCode);
    Writeln (f,'Analysis time   : '+ DateTimeToStr(Now));
    Writeln (f);
    Writeln (f,'Biophysical Variables');

    j := RzCheckList2.Items.Count;

    for index := 0 to j - 1 do
    begin
      x := 1;
      for i := 0 to j - 1 do
      begin
        k := HeaderOrd[index + 1];
        if HeaderOrd[i+1] < k then inc (x);
      end;

      writeln (f);
      writeln (f,' Calculated Values: Variable = '+rzchecklist2.Items.Strings[index]);
      writeln (f);
      writeln (f,'     treatment           field     crop        mean      st.dev');

      for km := 1 to NTreat do
      begin
        for l := 1 to ParVars do Pars[l] := 0.0;

        for l := 1 to NReps do
          TukDat[l] := OutDat[x,l+(km-1)*Nreps];

        NumOfMissing := 0;
        for l := 1 to NReps do
          if Int(TukDat[l]) = -99 then
              NumOfMissing := NumOfMissing + 1;

        i := 1;
        for l := 1 to NReps do
          if Int(TukDat[l]) <> -99 then
          begin
              TukDat[i] := TukDat[l] ;
              i := i + 1;
          end;

        NumOfMissing := NReps-NumOfMissing;

        Stats.Tukey (TukDat,NumOfMissing,Pars,Code);

        for l := 1 to ParVars do
          ParDat [l,km] := Pars[l];

        writeln (f,Format ('%3d  %19s %10s %2s %12.2f%12.2f',[mtr[km],tnam[km],fnam[km],ccode[km],pars[1],pars[2]]));
      end;

      writeln (f);
      writeln (f,'                              percentiles');
      writeln (f);
      writeln (f,' treat    0th      10th      25th      50th      75th      90th     100th');
      for l := 1 to NTreat do
      begin
        writeln (f,Format ('%3d%10.1f%10.1f%10.1f%10.1f%10.1f%10.1f%10.1f%',[mtr[l], pardat[3,l],pardat[4,l],pardat[5,l],pardat[6,l],
                                                                                     pardat[7,l],pardat[8,l],pardat[9,l]]));
      end;
    end;
    Closefile (f);
    Reportfile1.Enabled := true;
  end else
    SNRFile := '';
end;

procedure TMainForm.WriteMultiSNRFile;
var
  f       : TextFile;
  i,j,k,
  x,l,m   : integer;
  index   : integer;
  km      : integer;
  code    : integer;
  VarName,
  FieldNm : string;
  NumOfMissing : integer;
begin
  SNRFile                    := ChangeFileExt (SNSFile,'.OSR');
  spSkinSaveDialog1.FileName := SNRFile;
  spSkinSaveDialog1.Filter   := 'Report Files|*.osr|DSSAT v35 Report file|*.snr|All files|*.*';
  spSkinSaveDialog1.Title    := 'Save Seasonal Report as ..';

  SNRFile := spSkinSaveDialog1.FileName;
  AssignFile (f,SNRFile);
  Rewrite (f);
  {
  Write out analysis file
  }
  Writeln (f,'SN_ANALYSIS_LOG');
  Writeln (f);
  Writeln (f,'Input file      : '+ SNSFile);
  Writeln (f,'Experiment title: '+ TrimLeft(ExpTitle));
  Writeln (f,'Experiment code : '+ ExpCode);
  Writeln (f,'Analysis time   : '+ DateTimeToStr(Now));
  Writeln (f);
  Writeln (f,'Biophysical Variables');

  j := RzCheckList2.Items.Count;
  for index := 0 to j - 1 do
  begin
    x := 1;
    for i := 0 to j - 1 do
    begin
      k := HeaderOrd[index + 1];
      if HeaderOrd[i+1] < k then inc (x);
    end;

    writeln (f);
    writeln (f,' Calculated Values: Variable = '+rzchecklist2.Items.Strings[index]);
    writeln (f);
    writeln (f,'     Treatment           Field   Crop        Mean      St.Dev');

    for km := 1 to NTreat do
    begin
      for l := 1 to ParVars do Pars[l] := 0.0;

      for l := 1 to NReps do
         TukDat[l] := OutDat[x,l+(km-1)*Nreps];

        NumOfMissing := 0;
        for l := 1 to NReps do
          if Int(TukDat[l]) = -99 then
              NumOfMissing := NumOfMissing + 1;

        i := 1;
        for l := 1 to NReps do
          if Int(TukDat[l]) <> -99 then
          begin
              TukDat[i] := TukDat[l] ;
              i := i + 1;
          end;

        NumOfMissing := NReps-NumOfMissing;

        Stats.Tukey (TukDat,NumOfMissing,Pars,Code);

      for l := 1 to ParVars do
         ParDat [l,km] := Pars[l];

      writeln (f,Format ('%3d  %19s %10s %2s %12.2f%12.2f',[mtr[km],tnam[km],fnam[km],ccode[km],pars[1],pars[2]]));

      VarName := HeaderAcro[x];
      FieldNm := 'V_'+Trim (IntToStr (mtr[km])+'_'+VarName);

      for m := 0 to Table1.FieldCount - 1 do
        if Table1.Fields[m].FieldName = FieldNm then
        begin
          Table1.Edit;
          Table1.FieldByName(FieldNm).AsFloat := Pars[1];
        end;
    end;

    writeln (f);
    writeln (f,'                              Percentiles');
    writeln (f);
    writeln (f,' Treat    0th      10th      25th      50th      75th      90th     100th');
    for l := 1 to NTreat do
      writeln (f,Format ('%3d%10.1f%10.1f%10.1f%10.1f%10.1f%10.1f%10.1f%',[mtr[l], pardat[3,l],pardat[4,l],pardat[5,l],pardat[6,l],
                                                                                       pardat[7,l],pardat[8,l],pardat[9,l]]));
  end;
  Closefile (f);
  Reportfile1.Enabled := true;
end;

procedure TMainForm.ReadDataCDE;
var
  f        : Textfile;
  CodeFile : string;
  s,s2     : string;
  s1       : string[1];
  ListItem : TListItem;
begin
  CodeFile  := DSSATPath + 'DATA.CDE';
  if not FileExists (CodeFile) then
  begin
    repeat
      spSkinSelectDirectoryDialog1.Title := 'Browse to the DSSAT folder';
      if spSkinSelectDirectoryDialog1.Execute then
      begin
        DSSATPath := IncludeTrailingPathDelimiter(spSkinSelectDirectoryDialog1.Directory);
        CodeFile  := DSSATPath + 'DATA.CDE';
      end;
    until FileExists (codefile);
  end;
  if FileExists (CodeFile) then
  begin
    AssignFile (f,CodeFile);
    reset (f);
    Codes := 0;
    MultiTrt.spSkinListView1.Items.Clear;

    while not eof (f) do
    begin
      Readln (f,s);
      if Uppercase (copy (s,1,8)) = '*SUMMARY' then
      begin
        repeat
          Readln (f,s);
          s1 := copy (s,1,1);
          s2 := TrimRight (s);
          if (s1 <> '*') and (s1 <> '@') and (Length (s2) > 0) then
          begin
            Inc (codes);
            CodeAcro [Codes] := copy (s, 1, 6);
            CodeShort[Codes] := copy (s, 8,15);
            CodeLong [Codes] := copy (s,24,55);

            if Trim (CodeAcro[Codes]) = 'PICM' then
            begin
              Inc (codes);
              CodeAcro [Codes] := 'POCM  ';
              CodeShort[Codes] := CodeShort[Codes-1];
              CodeLong [Codes] := CodeLong [Codes-1];
            end;
            if Trim(CodeAcro[Codes]) = 'PI#M' then
            begin
              Inc (codes);
              CodeAcro [Codes] := 'PO#M  ';
              CodeShort[Codes] := CodeShort[Codes-1];
              CodeLong [Codes] := CodeLong [Codes-1];
            end;
            with MultiTrt.spSkinListView1 do
            begin
              ListItem := Items.Add;
              Listitem.Caption := CodeAcro [Codes];
              ListItem.SubItems.Add (CodeShort[Codes]);
            end;
          end;
        until copy (s,1,1) = '*';
      end;
   end;
   CloseFile (f);
   Inc (Codes);
   CodeAcro[Codes] := 'SOIL_I';

  end else
    spSkinMessage1.MessageDlg('The file '+CodeFile+' could not be found!  Find it!', mtWarning,[mbOk], 0);
end;

procedure TMainForm.GetArguments (var Profile, ID, WorkingDirectory : string);
var
  F       : TextFile;
  S       : string;
  j       : integer;
  ProPath : string;
begin
  if FileExists (Profile) then
  begin
    AssignFile(F, Profile);
    Reset(F);
  end else
  begin
    spSkinMessage1.MessageDlg('Cannot find file '+profile+'.', mtWarning, [mbOk], 0);
    Exit;
  end;

  Readln(F, S);                          { Read the first line out of the file }
  while not Eof(F) do
  begin
    Readln(F, ProPath);
    if Copy(ProPath, 1, 3) = ID then
    begin
      WorkingDirectory := Copy(ProPath, 5, 100);
      for j := 1 to length(WorkingDirectory) do
      if copy (WorkingDirectory, j,1) = ' ' then
      begin
        {
        delete the space if it is after :; if not leave in the space
        }
        if copy (WorkingDirectory, j-1,1) = ':'  then
          delete (WorkingDirectory,j,1);
      end;
    end;
  end;
  CloseFile(F);
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
var
  j,i : integer;
begin
  j := RzCheckList2.Items.Count;
  for i := 0 to j - 1 do
    RzCheckList2.Checked[i] := true;
end;

procedure TMainForm.SpeedButton3Click(Sender: TObject);
var
  j,i : integer;
begin
  j := RzCheckList2.Items.Count;
  for i := 0 to j - 1 do
    RzCheckList2.Checked[i] := false;
end;

procedure TMainForm.SpeedButton4Click(Sender: TObject);
var
  j,i : integer;
begin
  j := RzCheckList1.Items.Count;
  for i := 0 to j - 1 do
    RzCheckList1.Checked[i] := true;
end;

procedure TMainForm.SpeedButton8Click(Sender: TObject);
var
  j,i : integer;
begin
  j := RzCheckList3.Items.Count;
  for i := 0 to j - 1 do
    RzCheckList3.Checked[i] := true;
end;

procedure TMainForm.SpeedButton5Click(Sender: TObject);
var
  j,i : integer;
begin
  j := RzCheckList1.Items.Count;
  for i := 0 to j - 1 do
    RzCheckList1.Checked[i] := false;
end;

procedure TMainForm.SpeedButton9Click(Sender: TObject);
var
  j,i : integer;
begin
  j := RzCheckList3.Items.Count;
  for i := 0 to j - 1 do
    RzCheckList3.Checked[i] := false;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  GarbageCollectAtoms;
end;

procedure TMainForm.ToolButton3Click(Sender: TObject);
begin
  if FileExists (SnsFile) then          { Display Open dialog box }
    Executefile (Editor,SNSFile,AppPath,sw_shownormal);
end;

procedure TMainForm.ToolButton4Click(Sender: TObject);
begin
  if FileExists (SNRFile) then          { Display Open dialog box }
    Executefile (Editor,SNRFile,AppPath,sw_shownormal);
end;

procedure TMainForm.HandleError (var ErrCode: integer; FileOpen: string);
var
  FileExt : string;
begin
  FileExt := UpperCase (ExtractFileExt(FileOpen));
  case ErrCode of
    0                      : spSkinMessage1.MessageDlg ('The operating system is out of memory or resources.', mtInformation,[mbOk], 0);
    ERROR_FILE_NOT_FOUND   : spSkinMessage1.MessageDlg ('The specified file was not found.', mtInformation,[mbOk], 0);
    ERROR_PATH_NOT_FOUND   : spSkinMessage1.MessageDlg ('The specified path was not found.', mtInformation,[mbOk], 0);
    ERROR_BAD_FORMAT       : spSkinMessage1.MessageDlg ('The .EXE file is invalid (non-Win32 .EXE or error in .EXE image).', mtInformation,[mbOk], 0);
    SE_ERR_ACCESSDENIED    : spSkinMessage1.MessageDlg ('The operating system denied access to the specified file.', mtInformation,[mbOk], 0);
    SE_ERR_ASSOCINCOMPLETE : spSkinMessage1.MessageDlg ('The filename association is incomplete or invalid.', mtInformation,[mbOk], 0);
    SE_ERR_DDEBUSY         : spSkinMessage1.MessageDlg ('The DDE transaction could not be completed because other DDE transactions were being processed.', mtInformation,[mbOk], 0);
    SE_ERR_DDEFAIL         : spSkinMessage1.MessageDlg ('The DDE transaction failed.', mtInformation,[mbOk], 0);
    SE_ERR_DDETIMEOUT      : spSkinMessage1.MessageDlg ('The DDE transaction could not be completed because the request timed out.', mtInformation,[mbOk], 0);
    SE_ERR_DLLNOTFOUND     : spSkinMessage1.MessageDlg ('The specified dynamic-link library was not found.', mtInformation,[mbOk], 0);
    SE_ERR_NOASSOC         : spSkinMessage1.MessageDlg ('There is no application associated with the given filename extension.', mtInformation,[mbOk], 0);
    SE_ERR_OOM             : spSkinMessage1.MessageDlg ('There was not enough memory to complete the operation.', mtInformation,[mbOk], 0);
    SE_ERR_SHARE           : spSkinMessage1.MessageDlg ('A sharing violation occurred.', mtInformation,[mbOk], 0);
  end;
end;

procedure TMainForm.SpeedButton6Click(Sender: TObject);
var
  i,j,k,x,l : integer;
  index,km  : integer;
  code      : integer;
  found     : boolean;

  NumOfMissing : integer;
begin
  {
  Show analysis file
  }
  found := False;
  j := RzCheckList2.Items.Count;
  for index := 0 to j - 1 do
  begin
    x := 1;
    for i := 0 to j-1 do
    begin
      k := HeaderOrd[index + 1];
      if HeaderOrd[i+1] < k then inc (x);
    end;

    if RzChecklist2.Checked[index]{ and RzChecklist2.ItemEnabled[index] = true} then
    begin
      for km := 1 to NTreat do
      begin
        for l := 1 to ParVars do Pars[l] := 0.0;

        for l := 1 to NReps do
          TukDat[l] := OutDat[x,l+(km-1)*Nreps];

        NumOfMissing := 0;
        for l := 1 to NReps do
          if Int(TukDat[l]) = -99 then
              NumOfMissing := NumOfMissing + 1;

        i := 1;
        for l := 1 to NReps do
          if Int(TukDat[l]) <> -99 then
          begin
              TukDat[i] := TukDat[l] ;
              i := i + 1;
          end;

        NumOfMissing := NReps-NumOfMissing;

        Stats.Tukey (TukDat,NumOfMissing,Pars,Code);

        for l := 1 to ParVars do
          ParDat [l,km] := Pars[l];
      end;

      VarViewFrm.Caption := 'Variable: '+ ShortDesc[index+1];
      VarViewFrm.SetupListView;
      spDynamicSkinForm1.ClientInActiveEffect := True;
      VarViewFrm.Showmodal;
      spDynamicSkinForm1.ClientInActiveEffect := False;
      found := true;
    end;
  end;
  if not found then
     spSkinMessage1.MessageDlg('Please select a variable for analysis.', mtInformation,[mbOk], 0);
end;

procedure TMainForm.SpeedButton12Click(Sender: TObject);
begin
  if FileExists (LMDFileOpenEdit1.Text) then      { Display Open dialog box }
     Executefile (Editor,LMDFileOpenEdit1.Text,AppPath,sw_shownormal);
end;

procedure TMainForm.SpeedButton13Click(Sender: TObject);
var
  i : integer;
begin
  i := 1;
  EcoForm.RzComboBox1.Items.Clear;
  for i := 1 to NTreat do
     EcoForm.RzComBoBox1.Items.Add (TNam[i]);
  i := 1;
  EcoForm.RzComboBox1.ItemIndex := 0;
{  EcoForm.EditFile (i);}
  spDynamicSkinForm1.ClientInActiveEffect := True;
  EcoForm.Showmodal;
  spDynamicSkinForm1.ClientInActiveEffect := False;

  if EcoForm.ModalResult = mrOk then
    if spSkinMessage1.MessageDlg ('Do you wish to save to disk any changes in the price file '+Pricefile+'?',
        mtConfirmation,[mbYes,mbNo], 0) = mrYes then SpeedButton14Click(Self);
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  f : TextFile;
  j : integer;
  s : string;
begin
  ReadDataCDE;
  if FileExists (ParamStr(1)) then
  begin
    if UpperCase (ExtractFileExt (ParamStr(1))) = '.INP' then
    begin
      MultiTrt.spSkinCheckListBox1.Items.Clear;
      AssignFile (f,ParamStr(1));
      Reset (f);
      j := 0;
      While not EOF (f) do
      begin
        Readln (f,s);
        if FileExists (s) then
        begin
          MultiTrt.spSkinCheckListBox1.Items.Add (s);
          MultiTrt.spSkinCheckListBox1.Checked[j] := true;
          Inc (j);
        end;
      end;
      OutputFileNum := j-1;
      CloseFile (f);
      MultipleFiles := true;
    end else
    begin 
      MultipleFiles := false;
      OutputFileNum := 1;
      SNSFile       := ExpandFileName(ParamStr(1));
      FileLoaded    := true;
      ReadSNSHeader (SNSFile);
      ReadSNSFile (SNSFile);
      MainForm.Caption := 'Seasonal Analysis : '+SNSFile;
      LMDMruList1.Add (SNSFile);
      spSkinNotebook1.PageIndex := 1;
    end;
  end;
end;

procedure TMainForm.Reportaproblem1Click(Sender: TObject);
var
  s : string;
begin
  s := 'https://dssat.net/contact-us/';
  ShellExecute (Application.Handle, PChar('open'),
             PChar (s),PCHar(''),nil,SW_NORMAL);
end;

procedure TMainForm.SpeedButton10Click(Sender: TObject);
var
  f     : TextFile;
  i,j   : integer;
  ECvar : array[1..13] of string[27];
begin
  ECVar[01] := 'Grain price - - - - - - $/t';
  ECVar[02] := 'Harvest byproduct - - - $/t';
  ECVar[03] := 'Base production costs  $/ha';
  ECVar[04] := 'N fertilizer cost - -  $/kg';
  ECVar[05] := 'N cost / application - -  $';
  ECVar[06] := 'Irrigation cost - - -  $/mm';
  ECVar[07] := 'Irr cost / application -  $';
  ECVar[08] := 'Seed cost - - - - - -  $/kg';
  ECVar[09] := 'Organic amendments - -  $/t';
  ECVar[10] := 'P fertilizer cost - -  $/kg';
  ECVar[11] := 'P cost / application - -  $';
  ECVar[12] := 'K fertilizer cost - -  $/kg';
  ECVar[13] := 'K cost / application - -  $';

  if FileExists (SNRFile) then
  begin
    AssignFile (f,SNRFile);
    Append (f);
    Writeln (f);
    Writeln (f,'Economic Variables');
    Writeln (f);
    for i := 1 to NTreat do
    begin
      writeln (f);
      writeln (f,'Treatment '+ inttostr(i)+' of '+inttostr(NTreat)+' crop '+ccode[i]+' '+tnam[i]+' '+fnam[i]);
      writeln (f);
      for j := 1 to 13 do
        writeln (f,Format (' %27s  %2d  %12.2f%12.2f%12.2f',[ecvar[j],idat[i,j],pdat[i,j,1],pdat[i,j,2],pdat[i,j,3]]));
    end;
    Closefile (f);
  end;
  CalculateEconomicSummary;
  WriteEconomicSummary;
end;

procedure TMainForm.WriteEconomicSummary;
var
  km,i : integer;
  xx   : array[0..MaxYrs] of real;
  pa   : array[0..ParVars] of real;
  Ierr : integer;
  f    : TextFile;
begin
  for km := 1 to NTreat do
  begin
    for i := 1 to ParVars do
      Pars[i] := 0;

    for i := 1 to Nreps do
      xx[i] := gm[i,km];

    Stats.Tukey (xx,nreps,pa,ierr);

    for i := 1 to ParVars do
       xmu[i,km] := pa[i];

    for i := 1 to NReps do
       SorDat[km,i] := xx[i];

    if Ierr <> 0 then
       spSkinMessage1.MessageDlg('Error in Tukey!', mtWarning,[mbOk], 0);

  end;

  if FileExists (SNRFile) then
  begin
    AssignFile (f,SNRFile);
    Append (f);
    Writeln (f);
    writeln (f,' Calculated Values: Money /Ha');
    writeln (f);
    writeln (f,'      Treatment                                  Mean       St.Dev');
    for km := 1 to NTreat do
      writeln (f,Format (' %2d  %19s %10s   %2s    %12.2f%12.2f',[km,TNam[km],FNam[km],ccode[km],xmu[1,km],xmu[2,km]]));
    writeln (f);
    writeln (f,'                              Percentiles');
    writeln (f,' Treat    0th       10th       25th       50th       75th       90th      100th');
    for i := 1 to NTreat do
      writeln (f,Format (' %2d%11.1f%11.1f%11.1f%11.1f%11.1f%11.1f%11.1f%',[i,xmu[3,i],xmu[4,i],
                                                                              xmu[5,i],xmu[6,i],
                                                                              xmu[7,i],xmu[8,i],
                                                                              xmu[9,i]]));
    closefile (f);
  end;

  VarViewFrm.Caption := 'Economic Analysis : Money per Hectare';
  VarViewFrm.SetupEcoView;
  spDynamicSkinForm1.ClientInActiveEffect := True;
  VarViewFrm.ShowModal;
  spDynamicSkinForm1.ClientInActiveEffect := False;
end;

procedure TMainForm.CalculateEconomicSummary;
var
  i,j,l,k : integer;
  Err     : integer;
  Sto     : array[0..MaxTrts] of real;
  Abort   : boolean;
begin
  for i := 0 to MaxTrts do Sto[i] := 0.0;
  for i := 1 to NTreat do
  begin
    for j := 1 to 13 do
    begin
      IDis[j] := IDAT[i,j];
      for l := 1 to 3 do
         EPars[j,l] := PDat[i,j,l];
    end;

    for j := 1 to NReps do
    begin  
      y[   j] := OutDat[EcoLoc[ 1],j+Nreps*(i-1)]/1000.0;
      x[ 2,j] := OutDat[EcoLoc[ 2],j+Nreps*(i-1)]/1000.0;
      x[ 3,j] := 1.0;
      x[ 4,j] := OutDat[EcoLoc[ 4],j+Nreps*(i-1)];
      x[ 5,j] := OutDat[EcoLoc[ 5],j+Nreps*(i-1)];
      x[ 6,j] := OutDat[EcoLoc[ 6],j+Nreps*(i-1)];
      x[ 7,j] := OutDat[EcoLoc[ 7],j+Nreps*(i-1)];
      x[ 8,j] := OutDat[EcoLoc[ 8],j+Nreps*(i-1)];
      x[ 9,j] := OutDat[EcoLoc[ 9],j+Nreps*(i-1)]/1000.0;
      x[10,j] := OutDat[EcoLoc[10],j+Nreps*(i-1)];
      x[11,j] := OutDat[EcoLoc[11],j+Nreps*(i-1)];
      x[12,j] := OutDat[EcoLoc[12],j+Nreps*(i-1)];
      x[13,j] := OutDat[EcoLoc[13],j+Nreps*(i-1)];   
    end;

    Convol (NReps,Err,Sto);
    HandleConvolError (Err, Abort);
    If Abort then Exit;

    for k := 1 to NReps do
      GM[k,i] := Sto[k];
  end;
end;

procedure TMainForm.HandleConvolError (var Err: integer; var Abort : boolean);
begin
  Abort := false;
  case Err of
   1: begin
        spSkinMessage1.MessageDlg('An error occurred in CONVOL. The distribution function is not in the range of -1 to 3.', mtWarning,[mbOk], 0);
        Abort := true;
      end;
   2: begin
        spSkinMessage1.MessageDlg('An error occurred in CONVOL. NREPS are > 600.', mtWarning,[mbOk], 0);
        Abort := true;
      end;
   3: begin
        spSkinMessage1.MessageDlg('An error occurred in CONVOL.  Uniform variate was chosen and P2 < P1.', mtWarning,[mbOk], 0);
        Abort := true;
      end;
   4: begin
        spSkinMessage1.MessageDlg('An error occurred in CONVOL.  Triangular variate was chosen and P2 < P1.', mtWarning,[mbOk], 0);
        Abort := true;
      end;
   5: begin
        spSkinMessage1.MessageDlg('An error occurred in CONVOL.  Triangular variate was chosen and P3 < P1.', mtWarning,[mbOk], 0);
        Abort := true;
      end;
   6: begin
        spSkinMessage1.MessageDlg('An error occurred in CONVOL.  Triangular variate was chosen and P3 < P2.', mtWarning,[mbOk], 0);
        Abort := true;
      end;
   7: begin
        spSkinMessage1.MessageDlg('An error occurred in CONVOL.  Normal variate was chosen and P1 <= 0.0.', mtWarning,[mbOk], 0);
        Abort := true;
      end;
   8: begin
        spSkinMessage1.MessageDlg('An error occurred in CONVOL.  Normal variate was chosen and P2 <= 0.0.', mtWarning,[mbOk], 0);
        Abort := true;
      end;
  end;
end;

procedure TMainForm.Convol (var n,Error: integer; var GM: array of real);
var
  Ndet,I,J,K,MO,ID,
  II,IA,IB,m       : integer;
  RN,ZINC,RT,A,B,C,
  Sigma,Xxmu,
  ZN,ZA,Prob       : real;
  cps,Drum         : array [0..  5] of real;
  DETER            : boolean;
  SP               : array [0..500] of real;
begin
  cps[1] := 0.0;
  cps[2] := 0.25;
  cps[3] := 0.50;
  cps[4] := 0.75;
  cps[5] := 1.0;

  Error  := 0;
  Ndet   := 0;
  DETER  := False;
  {
  Error check
  }
  for I := 1 to 13 do
  begin
    if (IDis[i] >= 4)                              then Error := 1;
    if (N > 100)                                   then Error := 2;
    if (IDis[i] = 1) and (EPars[I,2] < EPars[I,1]) then Error := 3;
    if (IDis[i] = 2) and (EPars[i,2] < EPars[i,1]) then Error := 4;
    if (IDis[i] = 2) and (EPars[i,3] < EPars[i,1]) then Error := 5;
    if (IDis[i] = 2) and (EPars[i,3] < EPars[i,2]) then Error := 6;
    if (IDis[i] = 3) and (EPars[i,1] <= 0.0)       then Error := 7;
    if (IDis[i] = 3) and (EPars[i,2] <= 0.0)       then Error := 8;
    if (IDis[i] <= 0) then Ndet := Ndet + 1;
  end;

  if (Error <> 0) then exit;
  if (Ndet  = 13) then DETER := TRUE;
  {
  if run is completely deterministic, or n=1, get it out of the way
  }
  for j := 1 to MaxYrs do GM[j] := 0.0;

  Stats.ERIC (y,N);

  if DETER or (N = 1) then
  begin
    for i := 1 to N do
    begin
      if (IDis[1] >= 0) then GM[i] := Y[i]*EPars[1,1];
      if (IDis[2] >= 0) then GM[i] := GM[i] + X[2,I]*EPars[2,1];
      for j := 3 to 13 do
      begin
        { New fix for DWAP = -99 ... PWW 10-19-08}
        if (IDis[j] >= 0) and (Trunc (EPars[j,1]) <> -99) then
           GM[i] := GM[i] - EPars[j,1]*x[j,i];
      end;
    end;
    exit;
  end;
  {
  Otherwise, set up variables
  }
  RN := N;
  if (N > 1) then ZINC := 1.0/(RN-1.0);
  RT := (RN*5.0) - 1.0;
  {
  Begin 10-cost-price-variable loop
  }
  for k := 1 to 13 do
  begin
    if (IDis[K] >= 0) then
    begin
      A := EPars[K,1];
      B := EPars[K,2];
      C := EPars[K,3];
      {
      if lognormal, transform parameters
      }
      if (IDis[k] = 4) then
      begin
        Sigma := SQRT(ln(Power(B/A,2)+1.0));
        xxmu  := ln(A)-0.5*Power(Sigma,2);
      end;
      {
      Put artificial bounds on the normal & log-normal distributions
      }
      if (IDis[k] >= 3) then
      begin
        CPS[1] := 0.01;
        CPS[5] := 0.99;
      end else
      begin
        CPS[1] := 0.00;
        CPS[5] := 1.00;
      end;
      {
      Set up prices from CPS and inverse cumulative probability functions
      }
      for mo := 1 to 5 do
      begin
        if (IDis[k] = 0) then Drum[mo] := A;
        if (IDis[k] = 1) then Drum[mo] := CPS[mo]*(B-A)+A;
        if (IDis[k] = 2) then
        begin
          if (CPS[mo] < (B-A)/(C-A)) then
             Drum[mo] := A + SQRT(CPS[mo]*(C-A)*(B-A));
          if (CPS[mo] >= (B-A)/(C-A)) then
             Drum[mo] := C - SQRT((1.0-CPS[mo])*(C-A)*(C-A));
        end;

        if (IDis[k] = 3) then
        begin
          Prob := Probit (CPS[mo]);
          Drum[mo] :=  A + {MainForm.PROBIT (CPS[MO])}Prob*B;
        end;
        if (IDis[K] = 4) then
        begin
          Prob := Probit (CPS[mo]);
          Drum[mo] := xxmu + {MainForm.PROBIT (CPS[mo])}Prob*Sigma;
        end;
      end;
      {
      Begin 1-to-n loop
      }
      for i := 1 to n do
        {
        Begin third loop: get 5 GMs from CPS for each value of yield
        }
        for j := 1 to 5 do
        begin
          ID := (i-1)*5+j;
          case k of
            1      : SP[id] := Drum[j]*Y[i];
            2      : SP[id] := GM[i]+ Drum[j]*X[k,i];
            3..13  : if Trunc (X[k,i]) <> -99 then
                        SP[id] := GM[i]-(Drum[j]*X[k,i]);
          end;
        end;
      end;
      {
      Now collapse sp(n*5) to gm(n)
      }
      m  := n*5;
      Stats.ERIC (sp,m);
      ZN := 0.0;

      for ii := 1 to n do
      begin
        if (ii = 1) then
          GM[ii] := SP[ii]
        else if (ii = n) then
          GM[n]  := SP[n*5]
        else
        begin
          ZA     := ZN*RT + 1.0;
          IA     := trunc(ZA);
          IB     := IA + 1;
          GM[ii] := (SP[ib]-SP[ia])*(ZA-IA)+SP[ia];
        end;
        ZN := ZN + ZINC;
      end;
  end;
end;

function TMainForm.PROBIT (var P: real): real;
var
   Q,T      : real;
   c0,c1,c2 : real;
   d1,d2,d3 : real;
   prob     : real;
begin
   C0 := 2.515517;
   C1 := 0.802853;
   C2 := 0.010328;
   D1 := 1.432788;
   D2 := 0.189269;
   D3 := 0.001308;

   Q  := P;
   if (P > 0.5) then Q := 1.0 - P;

   T    := SQRT(LN(1.0/Power (Q,2)));
   PROB := (C0+(C1+C2*T)*T)/(1.0+(D1+(D2+D3*T)*T)*T)-T;
   if (P > 0.5) then PROB := -PROB;
   Probit := Prob;
end;

procedure TMainForm.Read_Registry;
var
  Section : string;
  j,i     : integer;
  Temp    : string;
  CurrDr  : string;
  Drive   : string;
  ID      : string;
begin
  FIniFile := TRegIniFile.Create ('\Software\DSSAT48');
  FiniFile.RootKey := HKey_Current_User;
  Temp     := ExtractFileDrive(Application.Exename);
  Drive    := Trim (Temp);
  {
  Directories
  }
  Section       := 'Varan';
  DSSATPath     := FiniFile.ReadString (Section,'DSSATPath',Drive+'\DSSAT48\');
  ProgramStarts := FiniFile.ReadInteger(Section,'ProgramStarts',0);
  SkinFileName  := FiniFile.ReadString (Section,'SkinName',     '');
  RandomSkin    := FiniFile.ReadBool   (Section,'RandomSkin',   false);

  j := LMDMRUList1.Items.Count;
  DSSATPath     := IncludeTrailingPathDelimiter (DSSATPath);
  if j > 0 then
  begin
    spSkinMruComboBox1.Items.Clear;
    for i := 0 to j - 1 do
    begin
      Temp := LMDMRUList1.Items.Strings[i];
      if FileExists (Temp) then
        spSkinMRUCombobox1.Items.Add (Temp);
    end;
  end;

  FiniFile.Free;

  FIniFile      := TRegIniFile.Create ('\Software\DSSAT48');
  FiniFile.RootKey := HKey_Current_User;
  {
  Directories
  }
  Section       := 'Profile';
  CurrDr        := ExtractFileDir(DSSATPath);
  EMailContact  := FiniFile.ReadString (Section,'EMail',       'gerrit.hoogenboom@wsu.edu');
  Profile       := FiniFile.ReadString (Section,'Profile',CurrDr+'\DSSATPRO.v48');
  RegNo         := FiniFile.ReadString (Section,'Registration','');
  Company       := FiniFile.ReadString (Section,'Company',     '');
  Reguser       := FiniFile.ReadString (Section,'Reguser',     '');

  Section       := 'Editors';
  Editor        := FiniFile.ReadString (Section,'Text','NotePad.exe');

  FIniFile.Free;

  if FileExists (SkinFileName) then
    Temp := IncludeTrailingPathDelimiter (ExtractFileDir (SkinFileName));

  Randomize;
  
  if RandomSkin then
  begin
    FileSearch (Temp, '*.skn', false, SkinFileName);
    If FileExists (SkinFileName) then
      LoadSkin (SkinFileName)
    else
      spSkinData1.CompressedStoredSkin := spCompressedStoredSkin1;
  end else
  begin
    if FileExists (SkinFileName) then
      LoadSkin (SkinFileName)
    else
      spSkinData1.CompressedStoredSkin := spCompressedStoredSkin1;
  end;

  DefaultPriceFile := '';
  if FileExists (Profile) then
  begin
    ID    := 'ECD';
    Temp  := '';
    GetArguments (Profile,ID,Temp);
    if Temp <> '' then
    begin
      CropDir := IncludeTrailingPathDelimiter (Temp);
      if FileExists (CropDir+'Default.PRI') then
         DefaultPriceFile := CropDir+'Default.PRI';
    end;
  end;
end;

procedure TMainForm.FileSearch(const PathName, FileName : string;
                               const InDir : boolean; var RFile : string);
var
  Rec      : TSearchRec;
  Path,s   : string;
  TempList : TStrings;
  i        : integer;
begin
  TempList := TStringList.Create;
  Path := IncludeTrailingPathDelimiter(PathName);
  if FindFirst(Path + FileName, faAnyFile - faDirectory, Rec) = 0 then
  try
    repeat
      TempList.Add (Path + Rec.Name);
    until FindNext(Rec) <> 0;
  finally
    FindClose(Rec);
  end;
  if TempList.Count > 0 then
  begin
    i := random (TempList.Count - 1);
    s := ExpandFileName (TempList.Strings[i]);
    RFile := s;
  end;
  TempList.free;
end;

procedure TMainForm.Write_Registry;
var
  Section : string;
begin
  FIniFile := TRegIniFile.Create ('\Software\DSSAT48');
  FiniFile.RootKey := HKey_Current_User;
  {
  Directories
  }
  Section := 'Varan';
  FiniFile.WriteString  (Section,'DSSATPath',    Uppercase (DSSATPath));
  FiniFile.WriteInteger (Section,'ProgramStarts',ProgramStarts);
  FiniFile.WriteString  (Section,'SkinName',     SkinFileName);
  FiniFile.WriteBool    (Section,'RandomSkin',   RandomSkin);

  FiniFile.Free;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Write_Registry;
end;

procedure TMainForm.SpeedButton11Click(Sender: TObject);
var
  i,j,l : integer;
  km    : integer;
  zn    : array [1..MaxYrs] of real;
  zinc  : real;
  xx    : array [0..MaxTrts] of real;
  pa    : array [0..ParVars] of real;
  Ierr  : integer;
  f     : TextFile;
  XGin  : array [0..MaxTrts] of real;

begin
  CalculateEconomicSummary;

  for km := 1 to NTreat do
  begin
    for i := 1 to ParVars do Pars[i] := 0;

    for i := 1 to Nreps do
      xx[i] := gm[i,km];

    Stats.Tukey (xx,nreps,pa,ierr);

    for i := 1 to ParVars do
       xmu[i,km] := pa[i];

    for i := 1 to NReps do
       SorDat[km,i] := xx[i];

    if Ierr <> 0 then
       spSkinMessage1.MessageDlg('Error in Tukey!', mtWarning,[mbOk], 0);
  end;

  if NReps > 1 then
  begin
    Zinc := 1.0/ int (nreps - 1);
    zn[1] := 0;
    for l := 2 to NReps do
    begin
      zn[l] := zn[l-1] + zinc;
    end;
  end;

  for i := 1 to MaxTrts do Effish[I] := 'Yes';

  for i := 1 to  NTreat do
  begin
    for j := 1 to NREPS do
        XX[j] := GM[j,i];
    XGIN[i] := GINI (XX,NREPS);
    Adj[i]  := xmu[1,i] - XGIN[i];
  end;

  for i := 1 to NTreat - 1 do
    for j := i + 1 to NTreat do
    begin
      if ((xmu[1,i] < xmu[1,j]) and (Adj[i] < Adj[j])) or
         ((xmu[1,i] = xmu[1,j]) and (Adj[i] < Adj[j])) or
         ((xmu[1,i] < xmu[1,j]) and (Adj[i] = Adj[j])) then
          Effish[i] := ' No'
      else
      if ((xmu[1,j] < xmu[1,i]) and (Adj[j] < Adj[i])) or
         ((xmu[1,j] = xmu[1,i]) and (Adj[j] < Adj[i])) or
         ((xmu[1,j] < xmu[1,i]) and (Adj[j] = Adj[i])) then
          Effish[j] := ' No';
    end;

  Strategy.SetupListView;

  if MultipleFiles then
  begin
    if MultiTrt.Options.Checked[2] then Strategy.ShowModal;
  end else
    Strategy.Showmodal;

  if FileExists (SNRFile) then
  begin
    AssignFile (f,SNRFile);
    Append (f);
    Writeln (f);
    Writeln (f,'                               Strategy Analysis');
    Writeln (f,'                Mean-Gini Dominance: E(x) mean return $/ha');
    Writeln (f,'                                     F(x) Gini coefficient $/ha');
    Writeln (f);
    Writeln (f,'             Treatment          Field        E(x)       E(x) - F(x)  Efficient');
    Writeln (f);
    for i := 1 to NTreat do
       writeln (f,Format ('   %2d   %2s %19s %8s%10.1f     %10.1f      %3s',
                         [i,ccode[i],tnam[i],fnam[i],xmu[1,i],adj[i],Effish[i]]));
    Closefile (f);
  end;
end;

procedure TMainForm.SpeedButton14Click(Sender: TObject);
var
  f : textfile;
  i : integer;
begin
  spSkinSaveDialog1.FileName   := PriceFile;
  spSkinSaveDialog1.Filter     := 'Price files|*.pri|All files|*.*';
  spSkinSaveDialog1.Title      := 'Save Price files ..';

  if spSkinSaveDialog1.Execute then
  begin
    AssignFile (f,spSkinSaveDialog1.FileName);
    Rewrite (f);
    writeln (f,'* PRICE-COST_FILE : '+ spSkinSaveDialog1.Filename);
    writeln (f);
    writeln (f,'! if IDis=-1, cost/price component is ignored in analysis');
    writeln (f,'! if IDis= 0, fixed value in PAR1');
    writeln (f,'! if IDis= 1, uniform variate (PAR1=lower, PAR2=upper bound)');
    writeln (f,'! if IDis= 2, triangular variate (PAR1=lower, PAR2=mode, PAR3=upper bound)');
    writeln (f,'! if IDis= 3, normal variate (PAR1=mean, PAR2=st. dev.)');
    writeln (f);
    writeln (f,'! File sectioned by crop.  A crop''s treatment sections must be contiguous.');
    writeln (f);
    for i := 1 to NTreat do
    begin
      writeln (f,'* '+ccode[i]);
      writeln (f,Format ('%11s%2d',['* TREATMENT',i]));
      writeln (f,'@PRAM     GRAN      BYPR       BASE     NFER      NCOS      IRRI     IRCO       SCOS      RESM      PCOS      PFER      KCOS      KFER');
      writeln (f,Format ('%4s%8d%10d%10d%10d%10d%10d%10d%10d%10d%10d%10d%10d%10d',['IDIS',idat[i,01],idat[i,02],idat[i,03],
                         idat[i,04],idat[i,05],idat[i,06],idat[i,07],idat[i,08],idat[i,09],idat[i,10],idat[i,11],idat[i,12],idat[i,13]]));
      writeln (f,Format ('%4s %9.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f',['PAR1',
                         pdat[i,01,1],pdat[i,02,1],pdat[i,03,1],pdat[i,04,1],pdat[i,05,1],pdat[i,06,1],
                         pdat[i,07,1],pdat[i,08,1],pdat[i,09,1],pdat[i,10,1],pdat[i,11,1],pdat[i,12,1],pdat[i,13,1]]));
      writeln (f,Format ('%4s %9.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f',['PAR2',
                         pdat[i,01,2],pdat[i,02,2],pdat[i,03,2],pdat[i,04,2],pdat[i,05,2],pdat[i,06,2],
                         pdat[i,07,2],pdat[i,08,2],pdat[i,09,2],pdat[i,10,2],pdat[i,11,2],pdat[i,12,2],pdat[i,13,2]]));
      writeln (f,Format ('%4s %9.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f',['PAR3',
                         pdat[i,01,3],pdat[i,02,3],pdat[i,03,3],pdat[i,04,3],pdat[i,05,3],pdat[i,06,3],
                         pdat[i,07,3],pdat[i,08,3],pdat[i,09,3],pdat[i,10,3],pdat[i,11,3],pdat[i,12,3],pdat[i,13,3]]));
    end;
    Closefile (f);
  end;
end;

procedure TMainForm.NoPromptSavePri;
var
  f : textfile;
  i : integer;
begin
  spSkinSaveDialog1.FileName   := PriceFile;
  AssignFile (f,spSkinSaveDialog1.FileName);
  Rewrite (f);
  writeln (f,'* PRICE-COST_FILE : '+ spSkinSaveDialog1.Filename);
  writeln (f);
  writeln (f,'! if IDis=-1, cost/price component is ignored in analysis');
  writeln (f,'! if IDis= 0, fixed value in PAR1');
  writeln (f,'! if IDis= 1, uniform variate (PAR1=lower, PAR2=upper bound)');
  writeln (f,'! if IDis= 2, triangular variate (PAR1=lower, PAR2=mode, PAR3=upper bound)');
  writeln (f,'! if IDis= 3, normal variate (PAR1=mean, PAR2=st. dev.)');
  writeln (f);
  writeln (f,'! File sectioned by crop.  A crop''s treatment sections must be contiguous.');
  writeln (f);
  for i := 1 to NTreat do
  begin
    writeln (f,'* '+ccode[i]);
    writeln (f,Format ('%11s%2d',['* TREATMENT',i]));
    writeln (f,'@PRAM     GRAN      BYPR       BASE     NFER      NCOS      IRRI     IRCO       SCOS      RESM      PCOS      PFER      KCOS      KFER');
    writeln (f,Format ('%4s%8d%10d%10d%10d%10d%10d%10d%10d%10d%10d%10d%10d%10d',['IDIS',idat[i,01],idat[i,02],idat[i,03],
                       idat[i,04],idat[i,05],idat[i,06],idat[i,07],idat[i,08],idat[i,09],idat[i,10],idat[i,11],idat[i,12],idat[i,13]]));
    writeln (f,Format ('%4s %9.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f',['PAR1',
                       pdat[i,01,1],pdat[i,02,1],pdat[i,03,1],pdat[i,04,1],pdat[i,05,1],pdat[i,06,1],
                       pdat[i,07,1],pdat[i,08,1],pdat[i,09,1],pdat[i,10,1],pdat[i,11,1],pdat[i,12,1],pdat[i,13,1]]));
    writeln (f,Format ('%4s %9.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f',['PAR2',
                       pdat[i,01,2],pdat[i,02,2],pdat[i,03,2],pdat[i,04,2],pdat[i,05,2],pdat[i,06,2],
                       pdat[i,07,2],pdat[i,08,2],pdat[i,09,2],pdat[i,10,2],pdat[i,11,2],pdat[i,12,2],pdat[i,13,2]]));
    writeln (f,Format ('%4s %9.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f%10.2f',['PAR3',
                       pdat[i,01,3],pdat[i,02,3],pdat[i,03,3],pdat[i,04,3],pdat[i,05,3],pdat[i,06,3],
                       pdat[i,07,3],pdat[i,08,3],pdat[i,09,3],pdat[i,10,3],pdat[i,11,3],pdat[i,12,3],pdat[i,13,3]]));
  end;
  Closefile (f);
end;

procedure TMainForm.LMDMRUList1Click(Sender: TObject; const aValue: String;
  var Remove: Boolean);
begin
  if FileExists (avalue) then
  begin
    MultipleFiles := false;
    OutputFileNum := 1;
    SNSFile       := ExpandFileName(avalue);
    FileLoaded    := true;
    ReadSNSHeader (SNSFile);
    ReadSNSFile (SNSFile);
    Caption       := 'Seasonal Analysis : '+SNSFile;
    spSkinNotebook1.PageIndex := 1;
  end else
    spSkinMessage1.MessageDlg('Unable to locate the previously edited file '+avalue, mtInformation,[mbOk], 0);
end;

procedure TMainForm.LMDAboutDlg1CustomClick(Sender: TObject);
begin
  with TAboutFrm.Create(nil) do
  try
    Showmodal;
  finally
    free;
  end;
end;

procedure TMainForm.LMDFileOpenEdit1AfterExit(Sender: TObject);
var
  i,j,k : integer;
begin
  SpeedButton15.Enabled := True;
  Pricefile := LMDFileOpenEdit1.Text;
  if FileExists (PriceFile) then
  begin
    EcoForm.SetEconomicDefaults;
    for i := 1 to MaxTrts do
      for j := 1 to 13 do
      begin
        IDAT[i,j] := -99;
        for k := 1 to 3 do
           PDAT[i,j,k] := -99;
      end;

    if FileExists (DefaultPriceFile) then
      EcoForm.GetDefaultEconomicParameters;
    {
    After loading defaults, load actual price file
    }
    EcoForm.GetEconomicParameters;
    LMDFileOpenEdit1.Text := PriceFile;
    PricesLoaded := true;
    Exit;
  end;
end;

procedure TMainForm.LMDFileOpenEdit1Change(Sender: TObject);
begin
  if spSkinNotebook1.PageIndex = 2 then
     SpeedButton15.Enabled := true;
end;

procedure TMainForm.spSkinButtonsBar1Sections0Items0Click(Sender: TObject);
var
  IGroup, IObject : integer;
begin
  IGroup  := 0;
  IObject := 0;
  case IGroup of
    0 : begin
         case IObject of
            0: begin
                 if FileLoaded then
                    spSkinNotebook1.PageIndex := 1
                 else
                    spSkinMessage1.MessageDlg ('Select a seasonal output file first!', mtInformation,[mbOk], 0);
               end;
            1: begin
                 if FileLoaded then
                  begin
                    LoadPriceFile;
                    spSkinNotebook1.PageIndex := 2;
                  end else
                    spSkinMessage1.MessageDlg ('Select a seasonal output file first!', mtInformation,[mbOk], 0);
               end;
          end;
        end;
     end;
end;

procedure TMainForm.spSkinButtonsBar1Sections1Items0Click(Sender: TObject);
begin
  if not MultipleFiles then
  begin
    spSkinMessage1.MessageDlg ('This option is available for more than one OSU file selected.',
                                mtInformation,[mbOk], 0);
    Exit;
  end;

  spSkinNotebook1.PageIndex := 0;
  spDynamicSkinForm1.ClientInActiveEffect := True;
  MultiTrt.ShowModal;
  spDynamicSkinForm1.ClientInActiveEffect := False;
end;

procedure TMainForm.spSkinButtonsBar1Sections0Items1Click(Sender: TObject);
var
  IGroup, IObject : integer;
begin
  IGroup  := 0;
  IObject := 1;
  case IGroup of
    0 : begin
         case IObject of
            0: begin
                 if FileLoaded then
                    spSkinNotebook1.PageIndex := 1
                 else
                    spSkinMessage1.MessageDlg ('Select a seasonal output file first!', mtInformation,[mbOk], 0);
               end;
            1: begin
                 if FileLoaded then
                 begin
                   LoadPriceFile;
                   spSkinNotebook1.PageIndex := 2;
                 end else
                   spSkinMessage1.MessageDlg ('Select a seasonal output file first!', mtInformation,[mbOk], 0);
               end;
          end;
        end;
     end;
end;

procedure TMainForm.LoadSkin(AFileName: String);
var
  Ext : String;
begin
  SkinFileName := AFileName;
  Ext := ExtractFileExt (AFileName);
  Ext := LowerCase (Ext);
  if Ext = '.ini' then spSkinData1.LoadFromFile (AFileName);
  if Ext = '.skn' then spSkinData1.LoadFromCompressedFile (AFileName);
end;

procedure TMainForm.LMDFileOpenEdit1ButtonClick(Sender: TObject);
begin
  if FileExists (priceFile) then
    spSKinOpenDialog1.InitialDir := ExtractFileDir (PriceFile);
  spSkinOpenDialog1.Filter := 'Price files|*.pri|All files|*.*';
  if spSkinOpenDialog1.Execute then
  begin
    LMDFileOpenEdit1.Text := spSkinOpenDialog1.FileName;
    LMDFileOpenEdit1AfterExit(Self);
  end;
end;

procedure TMainForm.Profileselect1Click(Sender: TObject);
var
  ID, Temp : string;
begin
  spSkinOpenDialog1.Filter   := 'DSSATPRO files|DSSATPRO.*|All Files|*.*';
  spSkinOpenDialog1.FilterIndex := 1;
  spSKinOpenDialog1.FileName := ProFile;
  if spSkinOpenDialog1.Execute then
  begin
    Profile := spSKinOpenDialog1.FileName;
    DefaultPriceFile := '';
    if FileExists (Profile) then
    begin
      ID    := 'ECD';
      Temp  := '';
      GetArguments (Profile,ID,Temp);
      if Temp <> '' then
      begin
        CropDir := IncludeTrailingPathDelimiter (Temp);
        if FileExists (CropDir+'Default.PRI') then
           DefaultPriceFile := CropDir+'Default.PRI';
      end;
    end;
  end;
end;

procedure TMainForm.spSkinButtonsBar1Sections0Items2Click(Sender: TObject);
begin
  spSkinNoteBook1.PageIndex := 0;
end;

procedure TMainForm.spSkinMRUComboBox1Click(Sender: TObject);
var
  avalue : string;
  i : integer;
begin
  i := spSkinMRUComboBox1.ItemIndex;
  if i = -1 then exit;
  avalue := spSkinMRUComboBox1.Items.Strings[i];
  if FileExists (avalue) then
  begin
    MultipleFiles := false;
    OutputFileNum := 1;
    SNSFile       := ExpandFileName(avalue);
    FileLoaded    := true;
    ReadSNSHeader (SNSFile);
    ReadSNSFile (SNSFile);
    Caption       := 'Seasonal Analysis : '+SNSFile;
    spSkinNotebook1.PageIndex := 1;
  end;
end;

procedure TMainForm.VaranPowerpoint1Click(Sender: TObject);
begin
  ShExeChm('\Varan.pps');
end;

procedure TMainForm.spSkinSpeedButton7Click(Sender: TObject);
var
  f,f1  : Textfile;
  s     : string;
  i,j,l : integer;
  ECvar : array[1..13] of string[27];
  km    : integer;
  xx    : array[0..MaxYrs] of real;
  pa    : array[0..ParVars] of real;
  Ierr  : integer;
  zinc  : real;
  zn    : array[1..MaxYrs] of real;
  XGin  : array[0..MaxTrts] of real;
begin
  ECVar[01] := 'Grain price - - - - - - $/t';
  ECVar[02] := 'Harvest byproduct - - - $/t';
  ECVar[03] := 'Base production costs  $/ha';
  ECVar[04] := 'N fertilizer cost - -  $/kg';
  ECVar[05] := 'N cost / application - -  $';
  ECVar[06] := 'Irrigation cost - - -  $/mm';
  ECVar[07] := 'Irr cost / application -  $';
  ECVar[08] := 'Seed cost - - - - - -  $/kg';
  ECVar[09] := 'Organic amendments - -  $/t';
  ECVar[10] := 'P fertilizer cost - -  $/kg';
  ECVar[11] := 'P cost / application - -  $';
  ECVar[12] := 'K fertilizer cost - -  $/kg';
  ECVar[13] := 'K cost / application - -  $';

  SNERFile                   := ChangeFileExt (SNSFile,'.OER');
  spSkinSaveDialog1.FileName := SNERFile;
  spSkinSaveDialog1.Filter   := 'Economic Report Files|*.oer|All files|*.*';
  spSkinSaveDialog1.Title    := 'Save Seasonal Economic Report as ..';

  if spSkinSaveDialog1.Execute then
  begin
    SNERFile := spSkinSaveDialog1.FileName;
    AssignFile (f,SNERFile);
    Rewrite (f);
    {
    Write out analysis file
    }
    Writeln (f,'SN_ANALYSIS_LOG');
    Writeln (f);
    Writeln (f,'Input file       : '+ SNSFile);
    Writeln (f,'Experiment title : '+ TrimLeft(ExpTitle));
    Writeln (f,'Experiment code  : '+ ExpCode);
    Writeln (f,'Analysis time    : '+ DateTimeToStr(Now));
    Writeln (f);
    Writeln (f,'Price File Inputs:');
    Writeln (f);
    for i := 1 to NTreat do
    begin
      writeln (f);
      writeln (f,'Treatment '+ inttostr(i)+' of '+inttostr(NTreat)+' crop '+ccode[i]+' '+tnam[i]+' '+fnam[i]);
      writeln (f);
      for j := 1 to 13 do
        writeln (f,Format (' %27s  %2d  %12.2f%12.2f%12.2f',[ecvar[j],idat[i,j],pdat[i,j,1],pdat[i,j,2],pdat[i,j,3]]));
    end;

    CalculateEconomicSummary;

    for km := 1 to NTreat do
    begin
      for i := 1 to ParVars do Pars[i] := 0;

      for i := 1 to Nreps do
        xx[i] := gm[i,km];

      Stats.Tukey (xx,nreps,pa,ierr);

      for i := 1 to ParVars do
         xmu[i,km] := pa[i];

      for i := 1 to NReps do
         SorDat[km,i] := xx[i];

      if Ierr <> 0 then
        spSkinMessage1.MessageDlg('Error in Tukey!', mtWarning,[mbOk], 0);

    end;

    Writeln (f);
    writeln (f,' Calculated Values: Money /Ha');
    writeln (f);
    writeln (f,'      Treatment                                  Mean       St.Dev');
    for km := 1 to NTreat do
      writeln (f,Format (' %2d  %19s %10s   %2s    %12.2f%12.2f',[km,TNam[km],FNam[km],ccode[km],xmu[1,km],xmu[2,km]]));

    writeln (f);
    writeln (f,'                              Percentiles');
    writeln (f,' Treat     0th       10th       25th       50th       75th       90th      100th');
    for i := 1 to NTreat do
      writeln (f,Format (' %2d%11.1f%11.1f%11.1f%11.1f%11.1f%11.1f%11.1f%',[i,xmu[3,i],xmu[4,i],
                                                                              xmu[5,i],xmu[6,i],
                                                                              xmu[7,i],xmu[8,i],
                                                                              xmu[9,i]]));
    if NReps > 1 then
    begin
      Zinc := 1.0/ int (nreps - 1);
      zn[1] := 0;
      for l := 2 to NReps do
        zn[l] := zn[l-1] + zinc;
    end;

    for i := 1 to MaxTrts do Effish[I] := 'Yes';

    for I := 1 to  NTreat do
    begin
      for J := 1 to NREPS do
          XX[J] := GM[J,I];
      XGIN[I] := GINI (XX,NREPS);
      Adj[I]  := xmu[1,I] - XGIN[I];
    end;

    for I := 1 to NTreat - 1 do
      for J := I + 1 to NTreat do
      begin
        if  ((xmu[1,I] < xmu[1,J]) and (Adj[I] < Adj[j])) or
            ((xmu[1,I] = xmu[1,J]) and (Adj[I] < Adj[J])) or
            ((xmu[1,I] < xmu[1,J]) and (Adj[I] = Adj[J])) then
             Effish[I] := ' No'
        else
        if  ((xmu[1,J] < xmu[1,I]) and (Adj[J] < Adj[I])) or
            ((xmu[1,J] = xmu[1,I]) and (Adj[J] < Adj[I])) or
            ((xmu[1,J] < xmu[1,I]) and (Adj[J] = Adj[I])) then
             Effish[j] := ' No';
      end;

    Writeln (f);
    Writeln (f,'                               Strategy Analysis');
    Writeln (f,'                Mean-Gini Dominance: E(x) mean return $/ha');
    Writeln (f,'                                     F(x) Gini coefficient $/ha');
    Writeln (f);
    Writeln (f,'             Treatment          Field        E(x)       E(x) - F(x)  Efficient');
    Writeln (f);
    for i := 1 to NTreat do
    begin
       writeln (f,Format ('   %2d   %2s %19s %8s%10.1f     %10.1f      %3s',
                          [i,ccode[i],tnam[i],fnam[i],xmu[1,i],adj[i],Effish[i]]));
    end;

    writeln (f);
    for i := 1 to NTreat do write (f,format ('%9d',[i]));
    writeln (f);
    writeln (f);

    for km := 1 to NReps do
    begin
      write (f,format ('%3d',[km]));
      for i := 1 to NTreat do
      begin
         write (f,' '+ Format('%8.2f', [gm[km,i]]));
      end;
      writeln (f);
    end;
    CloseFile (f);
    
    if spSkinMessage1.MessageDlg ('Do you wish to view the newly created economic report file '+SNERFile+'?',
           mtConfirmation,[mbYes,mbNo], 0) = mrYes then
      if FileExists (SNERFile) then          { Display Open dialog box }
         Executefile (Editor,SNERFile,AppPath,sw_shownormal);
  end;
end;

procedure TMainForm.spSkinButton6Click(Sender: TObject);
var
  j, index : integer;
begin
  {
  Show analysis file
  }
  SequenceView.InitListView;
  j := RzCheckList2.Items.Count;
  for index := 0 to j - 1 do
  begin
    if rzchecklist2.ItemEnabled[index] then
    begin
    SequenceView.XCombo.Items.AddObject (RzCheckList2.Items.Strings[index],TObject(true));
    SequenceView.YCombo.Items.AddObject (RzCheckList2.Items.Strings[index],TObject(true));
    end
    else
    begin
      SequenceView.XCombo.Items.AddObject (RzCheckList2.Items.Strings[index],TObject(false));
      SequenceView.YCombo.Items.AddObject (RzCheckList2.Items.Strings[index],TObject(false));
    end;

  end;

  SequenceView.Caption := 'Regression';
  spDynamicSkinForm1.ClientInActiveEffect := True;
  SequenceView.Showmodal;
  spDynamicSkinForm1.ClientInActiveEffect := False;
end;

procedure TMainForm.GarbageCollectAtoms;
  var
    i, len : integer;
    cstrAtomName: array [0 .. 1024] of char;
    AtomName, Value, procName: string;
    ProcID,lastError : cardinal;
    countDelphiProcs, countActiveProcs, countRemovedProcs,
    countCantRemoveProcs, countUnknownProcs : integer;

    TotalAtomsRemovidos : integer;
    function getProcessFileName(Handle: THandle): string;
    begin
      Result := '';
      { not used anymore
      try
        SetLength(Result, MAX_PATH);
        if GetModuleFileNameEx(Handle, 0, PChar(Result), MAX_PATH) > 0 then
          SetLength(Result, StrLen(PChar(Result)))
        else
          Result := '';
        except
      end;
      }
    end;

    // gets the last 8 digits from the given atomname and try to convert them to and integer
    function getProcessIdFromAtomName(name:string):cardinal;
    var l : integer;
    begin
      result := 0;
      l := Length(name);
      if (l > 8) then
      begin
        try
          result := StrToInt64('$' + copy(name,l-7,8));
          except
            // That should be an integer, but it's not!
            // So this was no created by a 'delphi' application and we must return 0,
            //indicating that we could not obtain the process id from atom name.
            result := 0;
        end;
      end;
    end;

    // checks if the given procID is running
    // results: -1: we could not get information about the process,
    //              so we can't determine if is active or not
    //           0: the process is not active
    //           1: the process is active
    function isProcessIdActive(id: cardinal; var processName: string):integer;
    var Handle_ID: THandle;
    begin
      result := -1;
      try
        Handle_ID := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, false, id);
        if (Handle_ID = 0) then
        begin
          result := 0;
        end
        else
        begin
          result := 1;
          // get program's name
          processName := getProcessFileName(Handle_ID);
          CloseHandle(Handle_ID);
        end;
        except
          result := -1;
      end;
    end; //

    procedure Log(msg:string);
    begin
      //Form20.Memo1.Lines.Add(msg);
    end;


begin

  // initialize the counters
  countDelphiProcs := 0;
  countActiveProcs := 0;
  countRemovedProcs := 0;
  countUnknownProcs := 0;

  // register some log
  Log('');
  Log('');
  Log('Searching Global Atom Table...');

  for i := $C000 to $FFFF do
  begin
    len := GlobalGetAtomName(i, cstrAtomName, 1024);
    if len > 0 then
    begin
      AtomName := StrPas(cstrAtomName);
      SetLength(AtomName, len);
      Value := AtomName;
      // if the atom was created by a 'delphi application', it should start
      // with some of strings below
      if (pos('Delphi',Value) = 1) or
         (pos('ControlOfs',Value) = 1) or
         (pos('WndProcPtr',Value) = 1) or
         (pos('DlgInstancePtr',Value) = 1) then
      begin
        // extract the process id that created the atom
        // (the ProcID are the last 8 digits from atomname)
        ProcID := getProcessIdFromAtomName(value);
        if (ProcId > 0) then
        begin
          // that's a delphi process
          inc(countDelphiProcs);
          // register some log
          Log('');
          Log('AtomName: ' + value + ' - ProcID: ' + inttostr(ProcId) + ' - Atom Nº: ' + inttostr(i));
          case (isProcessIdActive(ProcID, procName)) of
            0: // process is not active
            begin
              // remove atom from atom table
              SetLastError(ERROR_SUCCESS);
              GlobalDeleteAtom(i);
              lastError := GetLastError();
              if lastError = ERROR_SUCCESS then
              begin
                // ok, the atom was removed with sucess
                inc(countRemovedProcs);
                // register some log
                Log('- LEAK! Atom was removed from Global Atom Table because ProcID is not active anymore!');
              end
              else
              begin
                // ops, the atom could not be removed
                inc(countCantRemoveProcs);
                // register some log
                Log('- Atom was not removed from Global Atom Table because function "GlobalDeleteAtom" has failed! Reason: ' + SysErrorMessage(lastError));
              end;
            end;
            1: // process is active
            begin
              inc(countActiveProcs);
              // register some log
              Log('- Process is active! Program: ' + procName);
            end;
            -1: // could not get information about process
            begin
              inc(countUnknownProcs);
              // register some log
              Log('- Could not get information about the process and the Atom will not be removed!');
            end;
          end;
        end;
      end;
    end;
  end;
  Log('');
  Log('Scan complete:');
  Log('- Delphi Processes: ' + IntTostr(countDelphiProcs) );
  Log('  - Active: ' + IntTostr(countActiveProcs) );
  Log('  - Removed: ' + IntTostr(countRemovedProcs) );
  Log('  - Not Removed: ' + IntTostr(countCantRemoveProcs) );
  Log('  - Unknown: ' + IntTostr(countUnknownProcs) );

  TotalAtomsRemovidos := TotalAtomsRemovidos + countRemovedProcs;
end;

procedure TMainForm.MissedVarForAllTr;
var
  i,j,k,
  x,l    : integer;
  index  : integer;
  km     : integer;
  code   : integer;
  NumMissed : integer;
begin

    j := RzCheckList2.Items.Count;

    for index := 0 to j - 1 do
    begin
      x := 1;
      for i := 0 to j - 1 do
      begin
        k := HeaderOrd[index + 1];
        if HeaderOrd[i+1] < k then inc (x);
      end;

      NumMissed := 0;
      for km := 1 to NTreat do
      begin
        for l := 1 to ParVars do Pars[l] := 0.0;

        for l := 1 to NReps do
          TukDat[l] := OutDat[x,l+(km-1)*Nreps];

        Stats.Tukey (TukDat,NReps,Pars,Code);

        for l := 1 to ParVars do
          ParDat [l,km] := Pars[l];

        if (int(pars[1])=-99) then  NumMissed := NumMissed +1
      end;

      if (NumMissed=NTreat) then rzchecklist2.ItemEnabled[index]:= false;

    end; // for index
end;

{
procedure TMainForm.AnalysisClick(Sender: TObject);
begin
  Case Analysis.itemindex of
    0 : if RadioGroup1.Items.Count = 5 then
        begin
          RadioGroup1.Items.Delete (4);
          RadioGroup1.Items.Delete (3);
        end;
    1 : if RadioGroup1.Items.Count = 3 then
        begin
          RadioGroup1.Items.Add ('Variance Plot');
          RadioGroup1.Items.Add ('Coefficient of Variation Plot');
        end;
  end;
end;
}
end.

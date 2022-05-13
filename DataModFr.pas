unit DataModFr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

const
  MaxTrts = 8000;
  MaxYrs  =  100;
  MaxHead =  150;
  ParVars =    9;
  CodeMax =  220;

  PO1     =  1;
  PO2     =  2;
  PO3     =  3;
  PO4     =  4;
type
  TDataModule2 = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

  SNSFile      : string;
  SNERFile     : string;
  SNRFile      : string;
  PriceFile    : string;
  RandomSkin   : boolean;
  SkinFileName : string;
  Editor       : string;
  DefaultPriceFile : string;
  PriceFileDirectory : string;
  Profile       : string;
  CropDir       : string;
  ProgramStarts : integer;
  EMailContact  : string;
  AppPath       : string;
  DSSATPath     : string;
  FileLoaded    : Boolean;
  PricesLoaded  : Boolean;
  Codes         : integer;
  CG            : string[2];
  ExpCode       : string[8];
  ExpTitle      : string[60];
  MultipleFiles : boolean;
  OutputFileNum : integer;
  CodeAcro      : array [1..CodeMax] of string[ 6];
  CodeShort     : array [1..CodeMax] of string[15];
  CodeLong      : array [1..CodeMax] of string[55];
  LongDesc      : array [1..CodeMax] of string[55];
  ShortDesc     : array [1..CodeMax] of string[15];
  OutDat        : array [1..MaxHead,1..MaxTrts*MaxYrs] of real;
  ParDat        : array [1..ParVars, 1..MaxTrts] of real;
  HeaderOrd     : array [1..MaxHead] of integer;
  HeaderLoc     : array [1..MaxHead] of integer;
  HeaderAcro    : array [1..MaxHead] of string[5];
  HeaderMin     : integer;
  TreatMin      : integer;
  TRNo          : integer;
  Crno          : integer;
  WSTA_Pos      : integer;
  SOIL_Pos      : integer;
  WSTA          : string;
  IDSOIL        : string;
  SNSLines      : integer;
  NumFields     : integer;
  NTreat,
  NRuns,
  NRepS         : integer;
  MTR           : array[1..MaxTrts] of integer;
  CCode         : array[1..MaxTrts] of string[2];
  TNAM          : array[1..MaxTrts] of string[19];
  FNAM          : array[1..MaxTrts] of string[10];
  PARS          : array[0..ParVars]  of real;
  XM            : array[1..ParVars]  of real;
  TukDat        : array[0..MaxYrs] of real;
  IDat          : array[1..MaxTrts,1..13] of integer;
  PDat          : array[1..MaxTrts,1..13,1..3] of real;
  SorDat        : array[1..MaxTrts,1..MaxYrs] of real;
  Drag          : array[1..MaxTrts,1..MaxYrs] of real;
  x             : array[1..13,1..MaxYrs] of real;
  y             : array[0..MaxYrs] of real;
  IDis          : array[1..13] of integer;
  EPars         : array[1..13,1..3] of real;
  GM            : array[0..MaxYrs,0..MaxTrts] of real;
  xmu           : array[1..ParVars,1..MaxTrts] of real;
  Adj           : array[0..MaxTrts] of real;
  Effish        : array[1..MaxTrts] of string[3];
  GrafHead      : array[1..7] of string = ('PO','P10','P25','P50','P75','P90','P100');
  v35Var        : array[1..13] of string[4] =
                  ('HWAH','BWAH','    ','NICM','NI#M',
                   'IRCM','IR#M','DWAP','RECM','POCM','PO#M','KICM','KI#M');
  v40Var        : array[1..13] of string[4] =
                  ('HWAH','BWAH','    ','NICM','NI#M',
                   'IRCM','IR#M','DWAP','RECM','PICM','PI#M','KICM','KI#M');
  EcoLoc        : array[1..13] of integer;
  OffSet        : real;
  Company       : string;
  RegUser       : string;
  RegNo         : string;
{  UseVista      : Boolean;}
  
implementation

{$R *.DFM}

end.

unit NumStr;

{$S-,R-,V-}

interface

Function WordCnt(Str:string):byte;
Function ExtractWords(StartWord,NoWords:byte;Str:string):string;
Function LocWord(StartAT,Wordno:byte;Str:string):byte;

function BFromStr(var Value: byte; const S: string;
    const Pos, Len: integer): boolean;
function WFromStr(var Value: word; const S: string;
    const Pos, Len: integer): boolean;
function IFromStr(var Value: integer; const S: string;
    const Pos, Len: integer): boolean;
function SFromStr(var Value: single; const S: string;
    const Pos, Len: integer): boolean;
function DFromStr(var Value: double; const S: string;
    const Pos, Len: integer): boolean;

implementation

uses SysUtils, Dialogs;
var
  Code: integer;

Function WordCnt(Str:string):byte;
var
  W,I: integer;
  SpaceBefore: boolean;
begin
    If Str = '' then
    begin
        WordCnt := 0;
        exit;
    end;
    SpaceBefore := true;
    W := 0;
    For  I :=  1 to length(Str) do
    begin
        If SpaceBefore and (Str[I] <> ' ') then
        begin
            W := succ(W);
            SpaceBefore := false;
        end
        else
            If (SpaceBefore = false) and (Str[I] = ' ') then
                SpaceBefore := true;
    end;
    WordCnt := W;
end;

Function ExtractWords(StartWord,NoWords:byte;Str:string):string;
var Start, finish : integer;
begin
    If Str = '' then
    begin
        ExtractWords := '';
        exit;
    end;
    Start := LocWord(1,StartWord,Str);
    If Start <> 0 then
       finish := LocWord(Start,succ(NoWords),Str)
    else
    begin
        ExtractWords := '';
        exit;
    end;
    If finish = 0 then {5.02A}
       finish := succ(length(Str));
    Repeat
        finish := pred(finish);
    Until Str[finish] <> ' ';
    ExtractWords := copy(Str,Start,succ(finish-Start));
end;  {Func ExtractWords}

Function LocWord(StartAT,Wordno:byte;Str:string):byte;
{local proc used by PosWord and Extract word}
var
  W,L: integer;
  Spacebefore: boolean;
begin
    If (Str = '') or (wordno < 1) or (StartAT > length(Str)) then
    begin
        LocWord := 0;
        exit;
    end;
    SpaceBefore := true;
    W := 0;
    L := length(Str);

    StartAT := pred(StartAT);
    While (W < Wordno) and (StartAT <= length(Str)) do
    begin
      StartAT := succ(StartAT);
      If SpaceBefore and (Str[StartAT] <> ' ') then
      begin
        W := succ(W);
        SpaceBefore := false;
      end else
      begin
        If (SpaceBefore = false) and (Str[StartAT] = ' ') then
            SpaceBefore := true;
      end;
    end;
    If W = Wordno then
      LocWord := StartAT
    else
      LocWord := 0;
end;

function BFromStr;
begin
  if Pos > 0 then
  begin
    Val(TrimRight(Copy(S, Pos, Len)), Value, Code);
    Result := Code = 0;
  end
  else
    Result := false;
  if not Result then
    Value := 0;
end;

function WFromStr;
begin
  if Pos > 0 then
  begin
    Val(TrimRight(Copy(S, Pos, Len)), Value, Code);
    Result := Code = 0;
  end
  else
    Result := false;
  if not Result then
    Value := 0;
end;

function IFromStr;
begin
  if Pos > 0 then
  begin
    Val(TrimRight(Copy(S, Pos, Len)), Value, Code);
    Result := Code = 0;
  end
  else
    Result := false;
  if not Result then
    Value := -99;
end;

function SFromStr;
begin
  if Pos > 0 then
  begin
    Val(TrimRight(Copy(S, Pos, Len)), Value, Code);
    Result := Code = 0;
  end
  else
    Result := false;
  if not Result then
    Value := -99;
end;

function DFromStr;
begin
  if Pos > 0 then
  begin
    Val(TrimRight(Copy(S, Pos, Len)), Value, Code);
    Result := Code = 0;
  end
  else
    Result := false;
  if not Result then
    Value := -99;
end;

end.

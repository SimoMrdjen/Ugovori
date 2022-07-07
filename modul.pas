unit modul;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Winsock, strutils, AnsiStrings;

type
  TModulF = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Racunaj97;
    procedure Racunaj22;
    procedure Racunaj11;
    function Daj97(x:string):string;
    function Daj22(x:string):string;
    function Daj11(x:string):Boolean;
    function DodajNule(o:integer;c:string):string;
    function GetEXEVersion(f: string; var major, minor: integer): boolean;
    function YuToEn(rec:string):string;
    function BrisiS(rec:string):string;
    function BezRazmaka(rec:string):string;
    function PovecajSlova(rec:string):string;
    function BezCrtica(rec:string):string;
    function BezVodecihNula(rec:string):string;
    function BrSatiUMesecu(mes,god:integer):integer;
    function BrSatiUMesecuAK(mes,god:integer):integer;
    function BrDanaUMesecu(mes,god:integer):integer;
    function DodajRazmake(o:integer;c:string):string;
    function DodajRazmakeD(o:integer;c:string):string;
    function DeoSlovima(d:integer):string;
    function deoSek(sek:integer):string;
    function USek(sek:integer):string;
    function OdSek(sek:integer):string;
    function CeoStr(broj:real):string;
    function DecStr(broj:real):string;
    function slovoKB(s3:string):string;
    function MesecSlovima(m,p:integer):string;
    function localVlan: string;
    function PrvoVeliko(rec:string):string;
    procedure SerbianLatin;
    function SamoCifre(rec:string):string;
    function floattostr1(broj:real):string;
    function SamoPrvoVeliko(rec:string):string;
    function Rimski(br:integer):string;
    function MestoRazmaka(rec:string):integer;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModulF: TModulF;
  x1,x2:string;
  i1,i2,i3,i4,b:integer;
  c:real;

implementation

uses DateUtils;

{$R *.dfm}

procedure TModulF.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then Racunaj22;
end;

procedure TModulF.Racunaj97;
begin
x2 := '';
x1 := '';

//Konverzija slova u brojeve
for i2 := 1 to length(Edit1.Text) do
  begin
  if (Copy(Edit1.Text,i2,1) >= 'A') and (Copy(Edit1.Text,i2,1) <= 'Z') then
    x1 := x1 + slovoKB(Copy(Edit1.Text,i2,1))
  else
    x1 := x1 + Copy(Edit1.Text,i2,1);
  end;

x1:=x1+'00'+'0000000000000';
i1:=length(x1);
i2:=1;
i3:=0;
while i2<=i1 do
  begin
    i3:=strtoint(inttostr(i3)+copy(x1,i2,1));
    x2:=x2+inttostr(i3 div 97);
    i3:=i3 mod 97;
    i2:=i2+1;
  end;

x1:='0'+FormatSettings.DecimalSeparator+copy(x2,i2-13,13);
c:=strtofloat(x1);
b:=round(c*97);
b:=98-b;
if b<10 then x1:='0'+inttostr(b)
else x1:=inttostr(b);

Edit2.Text:=x1;

end;

procedure TModulF.Racunaj22;
begin
x1:=Edit1.Text;
i1:=length(x1);
i2:=1;
i3:=0;

while i1>0 do
  begin
  i3:=i3+i1*strtoint(copy(x1,i2,1));
  i1:=i1-1;
  i2:=i2+1;
  end;
i3:=i3 mod 11;
i3:=11-i3;
if i3>9 then i3:=i3-10;

x1:=inttostr(i3);

end;

procedure TModulF.Racunaj11;
begin
x2:='';
i3:=0;
i1:=0;
x1:=Edit3.Text;

i3:=(7*strtoint(copy(x1,1,1)))+(6*strtoint(copy(x1,2,1)))+(5*strtoint(copy(x1,3,1)))+(4*strtoint(copy(x1,4,1)))+(3*strtoint(copy(x1,5,1)))+(2*strtoint(copy(x1,6,1)))+(7*strtoint(copy(x1,7,1)))+(6*strtoint(copy(x1,8,1)))+(5*strtoint(copy(x1,9,1)))+(4*strtoint(copy(x1,10,1)))+(3*strtoint(copy(x1,11,1)))+(2*strtoint(copy(x1,12,1)));
Edit3.Text:=x2;
i3:=i3 mod 11;
i3:=11-i3;
if i3>9 then i3:=0;
x1:=inttostr(i3);
end;

function TModulF.Daj97(x:string):string;
begin
Edit1.Text:=x;
Racunaj97;
Daj97:=x1;
end;

function TModulF.Daj22(x:string):string;
begin
Edit1.Text:=x;
Racunaj22;
Daj22:=x1;
end;

function TModulF.Daj11(x:string):boolean;
var
        c:string;
begin
c:=copy(x,13,1);
delete(x,13,1);
Edit3.Text:=x;
Racunaj11;
if x1=c then Daj11:=true else Daj11:=false;
end;

// dodaje nule ispred stringa c tako da ukupna dužina stringa bude o
function TModulF.DodajNule(o:integer;c:string):string;
var x:string;
begin
x:=c;
while Length(x) < o do
  x:='0'+x;
DodajNule:=x;
end;

function TModulF.GetEXEVersion(f: string; var major, minor: integer): boolean;
var
  Len: DWORD;
  i,n:integer;
  Buf: PChar;
  Value: PChar;
  lang:PWordArray;
  S: string;
begin
  n := GetFileVersionInfoSize(PChar(f), Len);
  if n > 0 then
  begin
    Buf := AllocMem(n);
    GetFileVersionInfo(PChar(f), 0, n, Buf);
    if VerQueryValue(Buf, '\VarFileInfo\Translation', Pointer(lang), Len) then
      S:=IntToHex(lang[0],4)+IntToHex(lang[1],4)
    else
    begin
      Result:=false;
      exit;
    end;

    if VerQueryValue(Buf, PChar('StringFileInfo\'+S+'\FileVersion'), Pointer(Value), Len) then
    begin
      S:=Value;
      i:=0;
      while S[i]<>'.' do
        inc(i);
      major:=StrToInt(Copy(S, 0, i-1));
      inc(i);
      while S[i]<>'.' do
        inc(i);
      inc(i);
      while S[i]<>'.' do
        inc(i);
      inc(i);
      n:=i;
      while (S[i]<>'.') and (i<=Length(S)) do
        inc(i);
      minor:=StrToInt(Copy(S, n, i-n));
    end
    else
    begin
      Result:=false;
      exit;
    end;
    FreeMem(Buf, n);
  end
  else
  begin
    Result:=false;
    exit;
  end;
  Result:=true;
end;

function TModulF.YuToEn(rec:string):string;
var i:integer;
    p,q:string;
begin
p:='';
for i := 1 to length(rec) do
  begin
  q := copy(rec,i,1);
  if copy(rec,i,1) = 'Č'  then
    q:= 'C';
  if copy(rec,i,1) = 'Ć'  then
    q := 'C';
  if copy(rec,i,1) = 'Ž'  then
    q := 'Z';
  if copy(rec,i,1) = 'Š'  then
    q := 'S';
  if copy(rec,i,1) = 'Đ'  then
    q := 'DJ';
  if copy(rec,i,1) = 'č'  then
    q := 'c';
  if copy(rec,i,1) = 'ć'  then
    q := 'c';
  if copy(rec,i,1) = 'ž'  then
    q := 'z';
  if copy(rec,i,1) = 'š'  then
    q := 's';
  if copy(rec,i,1) = 'đ'  then
    q := 'dj';
  p := p + q;
  end;
YuToEn := p;
end;

function TModulF.BrisiS(rec:string):string;
var i:integer;
    p,q:string;
begin
p:='';
for i := 1 to length(rec) do
  begin
  q := copy(rec,i,1);
  if copy(rec,i,1) = '''' then
    q:= '';
  if copy(rec,i,1) = '.'  then
    q := '';
  p := p + q;
  end;
BrisiS := p;
end;

function TModulF.BezRazmaka(rec:string):string;
var i:integer;
    p:string;
begin
p := '';
i:=1;
while i <= length(rec) do
  begin
  if copy(rec,i,1) <> ' ' then
    p := p + copy(rec,i,1);
  i:=i+1;
  end;
BezRazmaka := p;
end;

function TModulF.PovecajSlova(rec:string):string;
var i,j:integer;
    r:string;
begin
i := 1;
r := '';
while i <= length(rec) do
  begin
  j:=0;

  if copy(rec,i,1) = 'š' then
    begin
    r := r + 'Š';
    j := 1;
    end;

  if copy(rec,i,1) = 'č' then
    begin
    r := r + 'Č';
    j := 1;
    end;

  if copy(rec,i,1) = 'ć' then
    begin
    r := r + 'Ć';
    j := 1;
    end;

  if copy(rec,i,1) = 'ž' then
    begin
    r := r + 'Ž';
    j := 1;
    end;

  if copy(rec,i,1) = 'đ' then
    begin
    r := r + 'Đ';
    j := 1;
    end;

  if j = 0 then
    r := r + copy(rec,i,1);

  i:=i+1;
  end;

PovecajSlova := r;

end;

function TModulF.BezCrtica(rec:string):string;
var i:integer;
    p:string;
begin
p := '';
i:=1;
while i <= length(rec) do
  begin
  if (copy(rec,i,1) <> '-')  then
    p := p + copy(rec,i,1);
  i:=i+1;
  end;
BezCrtica := p;
end;

function TModulF.BezVodecihNula(rec:string):string;
var i:string;
begin
i := copy(rec,1,1);
while i = '0' do
  begin
  rec := copy(rec,2,length(rec)-1);
  i := copy(rec,1,1);
  end;
BezVodecihNula := rec;
end;

function TModulF.BrSatiUMesecu(mes,god:integer):integer;
var i,sum:integer;
begin
sum := 0;
for i := 1 to DaysInAMonth(god,mes) do
  begin
  if (dayofweek(strtodate(inttostr(i)+'.'+inttostr(mes)+'.'+inttostr(god)))<>1) and
  (dayofweek(strtodate(inttostr(i)+'.'+inttostr(mes)+'.'+inttostr(god)))<>7) then
     sum := sum + 8;
  end;
Result := sum;
end;

function TModulF.BrSatiUMesecuAK(mes,god:integer):integer;
var i,sum:integer;
begin
sum := 0;
for i := 1 to 15 do
  begin
  if (dayofweek(strtodate(inttostr(i)+'.'+inttostr(mes)+'.'+inttostr(god)))<>1) and
  (dayofweek(strtodate(inttostr(i)+'.'+inttostr(mes)+'.'+inttostr(god)))<>7) then
     sum := sum + 8;
  end;
Result := sum;
end;


function TModulF.BrDanaUMesecu(mes,god:integer):integer;
var i,sum:integer;
begin
sum := 0;
for i := 1 to DaysInAMonth(god,mes) do
  begin
  if (dayofweek(strtodate(inttostr(i)+'.'+inttostr(mes)+'.'+inttostr(god)))<>1) and
  (dayofweek(strtodate(inttostr(i)+'.'+inttostr(mes)+'.'+inttostr(god)))<>7) then
     sum := sum + 1;
  end;
Result := sum;
end;

function TModulF.DodajRazmake(o:integer;c:string):string;
var x:string;
begin
x:=c;
while Length(x) < o do
  x:=' '+x;
DodajRazmake := x;
end;

function TModulF.DodajRazmakeD(o:integer;c:string):string;
var x:string;
begin
x:=c;
while Length(x) < o do
  x:=x+' ';
DodajRazmakeD := x;
end;

function TModulF.DeoSlovima(d:integer):string;
var
  str:string;
begin
str := '';
d := d + 1;
case d of
   1: str := 'prvog';
   2: str := 'drugog';
   3: str := 'trećeg';
   4: str := 'četvrtog';
   5: str := 'petog';
   6: str := 'šestog';
   7: str := 'sedmog';
   8: str := 'osmog';
   9: str := 'devetog';
  10: str := 'desetog';
  end;

Result := str;
end;

function TModulF.deoSek(sek:integer):string;
var
  str:string;
begin
str := '';
case sek of
  1: str :=	'';
  2: str :=	'';
  3: str :=	'za privredu';
  4: str :=	'za urbanizam, graditeljstvo i zaštitu životne sredine';
  5: str :=	'za energetiku i mineralne sirovine';
  7: str :=	'za nauku i tehnološki razvoj';
  8: str :=	'za poljoprivredu i vodoprivredu i šumarstvo';
  9: str :=	'za zaštitu životne sredine i održivi razvoj';
  10:	str := 'za finansije';
  11:	str :='za informacije';
  13:	str :='za sport i omladinu';
  15:	str :='za privredu, zapošljavanje i ravnopravnost polova';
  17:	str :='za obrazovanje, propise, upravu i nacionalne zajednice';
  18:	str :='za lokalnu samoupravu i meðuopštinsku saradnju';
  19:	str :='Uprave za zajedničke poslove pokrajinskih organa';
  21: str :='';
  22:	str :='Direkcije za robne rezerve AP Vojvodine';
  23: str :='' ;
  24:	str :='Stručne službe za real. programa priv. raz. APV' ;
  25:	str :='Službe skupštine AP Vojvodine';
  27:	str :='Službe za upravljanje ljudskim resursim';
  28:	str :='Sekretarijata Vlade APV';
  29:	str :='za obrazovanje';
  30: str :='za kulturu i javno informisanje';
  31:	str :='za zdravstvo, socijalnu politiku i demografiju' ;
  32:	str :='za međuregionalnu saradnju i lokalnu samoupravu';
  33:	str :='za socijalnu politiku i demografiju';
end;

Result := str;
end;


function TModulF.USek(sek:integer):string;
var
  str:string;
begin
str := '';
case sek of
  1:	str :='Skupštini autonomne pokrajine Vojvodine';
  2:	str :='Pokrajinskoj vladi';
  3:	str :='Pokrajinskom sekretarijatu za privredu';
  4:	str :='Pokrajinskom sekretarijatu za urbanizam i zaštitu životne sredine';
  5:	str :='Pokrajinskom sekretarijatu za energetiku, građevinarstvo i saobraćaj';
  7:	str :='Pokrajinskom sekretarijatu za visoko obrazovanje i naučnoistraživačku delatnost';
  8:	str :='Pokrajinskom sekretarijatu za poljoprivredu, vodoprivredu i šumarstvo';
  9:	str :='Pokrajinskom sekretarijatu za zaštitu životne sredine i održivi razvoj';
  10:	str :='Pokrajinskom sekretarijatu za finansije';
  11:	str :='Pokrajinskom sekretarijatu za informacije';
  13:	str :='Pokrajinskom sekretarijatu za sport i omladinu';
  15:	str :='Pokrajinskom sekretarijatu za privredu i turizam';
  17:	str :='Pokrajinskom sekretarijatu za obrazovanje, propise, upravu i nacionalne manjine - nacionalne zajednice';
  18:	str :='Pokrajinskom sekretarijatu za lokalnu samoupravu i međuopštinsku saradnju';
  19:	str :='Upravi za zajedničke poslove pokrajinskih organa';
  21:	str :='Pravobranilaštvu autonomne pokrajine Vojvodine';
  22:	str :='Direkciji za robne rezerve autonomne pokrajine Vojvodine';
  23:	str :='Pokrajinskom zaštitniku građana - ombudsmanu';
  24:	str :='Službi za realizaciju programa privrednog razvoja autonomne pokrajine Vojvodine';
  25:	str :='Službi skupštine autonomne pokrajine Vojvodine';
  27:	str :='Službi za upravljanje ljudskim resursima';
  28:	str :='Sekretarijatu Pokrajinske vlade';
  29:	str :='Pokrajinskom sekretarijatu za obrazovanje';
  30:	str :='Pokrajinskom sekretarijatu za kulturu, javno informisanje i odnose sa verskim zajednicama';
  31:	str :='Pokrajinskom sekretarijatu za zdravstvo';
  32:	str :='Pokrajinskom sekretarijatu za regionalni razvoj, međuregionalnu saradnju i lokalnu samoupravu';
  33:	str :='Pokrajinskom sekretarijatu za socijalnu politiku i demografiju';
  35: str :='Službi za internu reviziju korisnika budžetskih sredstava autonomne pokrajine Vojvodine';
  36: str :='Upravi za imovinu autonomne pokrajine Vojvodine';
  37: str :='Upravi za kapitalna ulaganja autonomne pokrajine Vojvodine';
  38: str :='Pokrajinskom sekretarijatu za socijalnu politiku, demografiju i ravnopravnost polova';
end;

Result := str;
end;

function TModulF.OdSek(sek:integer):string;
var
  str:string;
begin
str := '';
case sek of
  1:	str :='Skupštine autonomne pokrajine Vojvodine';
  2:	str :='Pokrajinske vlade';
  3:	str :='Pokrajinskog sekretarijata za privredu';
  4:	str :='Pokrajinskog sekretarijata za urbanizam i zaštitu životne sredine';
  5:	str :='Pokrajinskog sekretarijata za energetiku, građevinarstvo i saobraćaj';
  7:	str :='Pokrajinskog sekretarijata za visoko obrazovanje i naučnoistraživačku delatnost';
  8:	str :='Pokrajinskog sekretarijata za poljoprivredu, vodoprivredu i šumarstvo';
  9:	str :='Pokrajinskog sekretarijata za zaštitu životne sredine i održivi razvoj';
  10:	str :='Pokrajinskog sekretarijata za finansije';
  11:	str :='Pokrajinskog sekretarijata za informacije';
  13:	str :='Pokrajinskog sekretarijata za sport i omladinu';
  15:	str :='Pokrajinskog sekretarijata za privredu i turizam';
  17:	str :='Pokrajinskog sekretarijata za obrazovanje, propise, upravu i nacionalne manjine - nacionalne zajednice';
  18:	str :='Pokrajinskog sekretarijata za lokalnu samoupravu i međuopštinsku saradnju';
  19:	str :='Uprave za zajedničke poslove pokrajinskih organa';
  21:	str :='Pravobranilaštva autonomne pokrajine Vojvodine';
  22:	str :='Direkcije za robne rezerve autonomne pokrajine Vojvodine';
  23:	str :='Pokrajinskog zaštitnika građana - ombudsmana';
  24:	str :='Službe za realizaciju programa privrednog razvoja autonomne pokrajine Vojvodine';
  25:	str :='Službe skupštine autonomne pokrajine Vojvodine';
  27:	str :='Službe za upravljanje ljudskim resursima';
  28:	str :='Sekretarijata Pokrajinske vlade';
  29:	str :='Pokrajinskog sekretarijata za obrazovanje';
  30:	str :='Pokrajinskog sekretarijata za kulturu, javno informisanje i odnose sa verskim zajednicama';
  31:	str :='Pokrajinskog sekretarijata za zdravstvo';
  32:	str :='Pokrajinskog sekretarijata za regionalni razvoj, međuregionalnu saradnju i lokalnu samoupravu';
  33:	str :='Pokrajinskog sekretarijata za socijalnu politiku i demografiju';
  35: str :='Službe za internu reviziju korisnika budžetskih sredstava autonomne pokrajine Vojvodine';
  36: str :='Uprave za imovinu autonomne pokrajine Vojvodine';
  37: str :='Uprave za kapitalna ulaganja autonomne pokrajine Vojvodine';
  38: str :='Pokrajinskog sekretarijata za socijalnu politiku, demografiju i ravnopravnost polova';
end;

Result := str;
end;

function TModulF.CeoStr(broj:real):string;
begin
CeoStr := inttostr(trunc(broj));
end;

function TModulF.DecStr(broj:real):string;
begin
DecStr := inttostr(round(((broj - trunc(broj)) * 100)));
end;

function TModulF.SlovoKB(s3:string):string;
begin
  if s3='A' then s3:='10';
  if s3='B' then s3:='11';
  if s3='C' then s3:='12';
  if s3='D' then s3:='13';
  if s3='E' then s3:='14';
  if s3='F' then s3:='15';
  if s3='G' then s3:='16';
  if s3='H' then s3:='17';
  if s3='I' then s3:='18';
  if s3='J' then s3:='19';
  if s3='K' then s3:='20';
  if s3='L' then s3:='21';
  if s3='M' then s3:='22';
  if s3='N' then s3:='23';
  if s3='O' then s3:='24';
  if s3='P' then s3:='25';
  if s3='Q' then s3:='26';
  if s3='R' then s3:='27';
  if s3='S' then s3:='28';
  if s3='T' then s3:='29';
  if s3='U' then s3:='30';
  if s3='V' then s3:='31';
  if s3='W' then s3:='32';
  if s3='X' then s3:='33';
  if s3='Y' then s3:='34';
  if s3='Z' then s3:='35';
Result := s3;
end;

function TModulF.mesecSlovima(m,p:integer):string;
var x:string;
begin

x := '';
if p = 1 then
 begin
 case m of
   1:x := 'januar';
   2:x := 'februar';
   3:x := 'mart';
   4:x := 'april';
   5:x := 'maj';
   6:x := 'jun';
   7:x := 'jul';
   8:x := 'avgust';
   9:x := 'septembar';
   10:x := 'oktobar';
   11:x := 'novembar';
   12:x := 'decembar';
   end;
 end;
if p = 2 then
 begin
 case m of
   1:x := 'januaru';
   2:x := 'februaru';
   3:x := 'martu';
   4:x := 'aprilu';
   5:x := 'maju';
   6:x := 'junu';
   7:x := 'julu';
   8:x := 'avgustu';
   9:x := 'septembru';
   10:x := 'oktobru';
   11:x := 'novembru';
   12:x := 'decembru';
   end;
 end;

Result := x;
end;

function Tmodulf.LocalVLan: string;
type
   TaPInAddr = array [0..10] of PInAddr;
   PaPInAddr = ^TaPInAddr;
var
    phe: PHostEnt;
    pptr: PaPInAddr;
    Buffer: array [0..63] of Ansichar;
    i: Integer;
    GInitData: TWSADATA;
    adresa:string;
begin
WSAStartup($101, GInitData);
Result := '';
GetHostName(Buffer, SizeOf(Buffer));
phe :=GetHostByName(buffer);
if phe = nil then Exit;
pptr := PaPInAddr(Phe^.h_addr_list);
i := 0;
while pptr^[i] <> nil do
begin
  adresa:=AnsiStrings.StrPas(inet_ntoa(pptr^[i]^));
  Inc(i);
end;
WSACleanup;

if Copy(adresa,10,1) = '.' then
  result := copy(adresa,9,1);
if Copy(adresa,11,1) = '.' then
  result := copy(adresa,9,2);
if Copy(adresa,12,1) = '.' then
  result := copy(adresa,9,3);

end;

function TModulF.SamoPrvoVeliko(rec:string):string;
var i:Integer;
rec1,rec2:String;
begin
  rec := LowerCase(rec);

  rec1 := UpperCase(copy(rec,1,1));
  if rec1 = 'š' then rec1 := 'Š';
  if rec1 = 'č' then rec1 := 'Č';
  if rec1 = 'ć' then rec1 := 'Ć';
  if rec1 = 'ž' then rec1 := 'Ž';
  if rec1 = 'đ' then rec1 := 'Đ';

  rec := rec1 + copy(rec,2,length(rec)-1);

  rec1 := copy(rec,1,1);
  for I := 2 to Length(rec) do begin
    rec2 := copy(rec,i,1);
    if rec2 = 'Š' then rec2 := 'š';
    if rec2 = 'Č' then rec2 := 'č';
    if rec2 = 'Ć' then rec2 := 'ć';
    if rec2 = 'Ž' then rec2 := 'ž';
    if rec2 = 'Đ' then rec2 := 'đ';
    rec1 := rec1 + rec2;
  end;
  result := rec1;
end;

function TModulF.PrvoVeliko(rec:string):string;
var i : integer;
    rec1,rec2,rec3:string;
begin
rec := LowerCase(rec);

rec1 := UpperCase(copy(rec,1,1));
if rec1 = 'š' then rec1 := 'Š';
if rec1 = 'č' then rec1 := 'Č';
if rec1 = 'ć' then rec1 := 'Ć';
if rec1 = 'ž' then rec1 := 'Ž';
if rec1 = 'đ' then rec1 := 'Đ';

rec := rec1 + copy(rec,2,length(rec)-1);

rec1 := copy(rec,1,1);
for I := 2 to Length(rec) do
  begin
  rec2 := copy(rec,i,1);
  if rec2 = 'Š' then rec2 := 'š';
  if rec2 = 'Č' then rec2 := 'č';
  if rec2 = 'Ć' then rec2 := 'ć';
  if rec2 = 'Ž' then rec2 := 'ž';
  if rec2 = 'Đ' then rec2 := 'đ';
  rec1 := rec1 + rec2;
  end;

rec := rec1;
rec1 := '';
rec2 := '';
for i := 1 to length(rec) do
  begin
  if rec2 <> ' ' then
    rec1 := rec1 + copy(rec,i,1)
  else
    begin
    rec3 := copy(rec,i,1);
    rec3 := UpperCase(rec3);
    if rec3 = 'š' then rec3 := 'Š';
    if rec3 = 'č' then rec3 := 'Č';
    if rec3 = 'ć' then rec3 := 'Ć';
    if rec3 = 'ž' then rec3 := 'Ž';
    if rec3 = 'đ' then rec3 := 'Đ';
    rec1 := rec1 + rec3
    end;
  rec2 := Copy(rec1,i,1);
  end;

result := rec1;
end;

procedure TModulF.SerbianLatin;
var klId : array [0..9] of char;
    keyboardCode : HKL;
begin

keyboardCode := (SUBLANG_SERBIAN_LATIN shl 10) or LANG_SERBIAN;

StrPCopy(klId, IntToHex(keyboardCode, 8));

LoadKeyboardLayout(klId, KLF_ACTIVATE);
end;

function TModulF.SamoCifre(rec:string):string;
var i:integer;
    p:string;
begin
p := '';
i:=1;
while i <= length(rec) do
  begin
  if (copy(rec,i,1) = '0') or (copy(rec,i,1) = '1') or (copy(rec,i,1) = '2') or (copy(rec,i,1) = '3') or (copy(rec,i,1) = '4') or (copy(rec,i,1) = '5') or
     (copy(rec,i,1) = '6') or (copy(rec,i,1) = '7') or (copy(rec,i,1) = '8') or (copy(rec,i,1) = '9') then
    p := p + copy(rec,i,1);
  i:=i+1;
  end;
SamoCifre := p;
end;

function TModulF.floattostr1(broj:real):string;
var
  strbroj1, strbroj2 :string;
  i:integer;
begin
strbroj1 := floattostr(broj);
strbroj2 := '';
for i := 1 to length(strbroj1) do
  begin
  if (copy(strbroj1,i,1) <> ',') and (copy(strbroj1,i,1) <> ' ') then
    strbroj2 := strbroj2 + copy(strbroj1,i,1);
  if (copy(strbroj1,i,1) = ',') then
    strbroj2 := strbroj2 + '.';
  end;
Result := strbroj2;
end;

function TModulf.Rimski(br:integer):string;
begin
result := '';
case br of
  1:result := 'I';
  2:result := 'II';
  3:result := 'III';
  4:result := 'IV';
  5:result := 'V';
  6:result := 'VI';
  7:result := 'VII';
  8:result := 'VIII';
  9:result := 'IX';
  10:result := 'X';
  11:result := 'XI';
  12:result := 'XII';
  end;
end;

function TModulF.MestoRazmaka(rec:string):integer;
var i:integer;
begin
result := 0;
if length(rec) < 3 then
  Exit;
i := length(rec) - 1;
while i > 0 do
  begin
  if copy(rec,i,1) = ' ' then
    begin
    result := i;
    Exit;
    end;
  i := i - 1;
  end;
end;

end.

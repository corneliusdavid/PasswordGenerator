unit ufrmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, ComCtrls, Buttons;

type
  TfrmMain = class(TForm)
    btnGenPw: TBitBtn;
    grpPwType: TRadioGroup;
    edtPassword: TEdit;
    cbHide: TCheckBox;
    btnCopyToClipboard: TBitBtn;
    btnExit: TBitBtn;
    lblLength: TLabel;
    cbPunctuation: TCheckBox;
    tbPwLen: TTrackBar;
    procedure btnGenPwClick(Sender: TObject);
    procedure tbPwLenChange(Sender: TObject);
    procedure cbHideClick(Sender: TObject);
    procedure btnCopyToClipboardClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    function GeneratePassword: string;
    procedure FormActivate(Sender: TObject);
    procedure grpPwTypeClick(Sender: TObject);
  private
    procedure CheckPunctuationEnabled;
    function GenerateNumber: string;
    function GenerateLeft(len: Integer): string;
    function GenerateRight(len: Integer): string;
    function GenerateMixed: string;
  end;

var
  frmMain: TfrmMain;


implementation

{$R *.DFM}

const
  LEFT_VOWELS = 'EA';
  LEFT_CONSANANTS = 'QWRTSDFGZXCVB';
  LEFT_LETTERS = LEFT_VOWELS + LEFT_CONSANANTS;
  RIGHT_VOWELS = 'OIU';
  RIGHT_CONSANANTS = 'YPHJKLNM';
  RIGHT_LETTERS = RIGHT_VOWELS + RIGHT_CONSANANTS;
  NUMBERS = '0123456789';
  PUNCTUATION = ',./;'':"!()-';


function RandBool: Boolean;
begin
  Result := Random(2) = 1;
end;

function TfrmMain.GenerateMixed: string;
var
  leftside: Boolean;
  i, m: Integer;
begin
  m := tbPwLen.Position;
  if (m > 1) and cbPunctuation.Checked then
    Dec(m);

  Result := EmptyStr;
  leftside := True;
  for i := 1 to m do begin
    if leftside then
      Result := Result + GenerateLeft(1)
    else
      Result := Result + GenerateRight(1);
    leftside := not leftside;
  end;

  if (tbPwLen.Position > 1) and cbPunctuation.Checked then
    Result := Result + PUNCTUATION[Random(Length(PUNCTUATION))];
end;

function TfrmMain.GenerateLeft(len: Integer): string;
var
  s: string;
  i: Integer;
begin

  if cbPunctuation.Checked and (len > 1) then
    Dec(len);
  s := EmptyStr;

  for i := 1 to len do
    s := s + LEFT_LETTERS[Random(Length(LEFT_LETTERS)) + 1];

  if cbPunctuation.Checked and (len > 1) then
    s := s + PUNCTUATION[Random(Length(PUNCTUATION)) + 1];

  Result := s;
end;

function TfrmMain.GenerateRight(len: Integer): string;
var
  s: string;
  i: Integer;
begin

  if cbPunctuation.Checked and (len > 1) then
    Dec(len);
  s := EmptyStr;

  for i := 1 to len do
    s := s + RIGHT_LETTERS[Random(Length(RIGHT_LETTERS)) + 1];

  if cbPunctuation.Checked and (len > 1) then
    s := s + PUNCTUATION[Random(Length(PUNCTUATION)) + 1];

  Result := s;
end;

function TfrmMain.GenerateNumber: string;
var
  s: string;
  i: Integer;
begin
  s := EmptyStr;
  for i := 1 to tbPwLen.Position do
    s := s + Chr(Random(9) + Ord('0'));

  Result := s;
end;

function TfrmMain.GeneratePassword: string;
begin
  case grpPwType.ItemIndex of
    0: Result := GenerateMixed;
    1: Result := GenerateLeft(tbPwLen.Position);
    2: Result := GenerateRight(tbPwLen.Position);
    3: Result := GenerateNumber;
  end;
end;

{-----------------------------------}

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  Randomize;
end;

procedure TfrmMain.btnGenPwClick(Sender: TObject);
begin
  edtPassword.Text := GeneratePassword;
end;

procedure TfrmMain.tbPwLenChange(Sender: TObject);
begin
  lblLength.Caption := '&Length: ' + IntToStr(tbPwLen.Position);
  CheckPunctuationEnabled;
end;

procedure TfrmMain.cbHideClick(Sender: TObject);
begin
  if cbHide.Checked then
    edtPassword.PasswordChar := '*'
  else
    edtPassword.PasswordChar := #0;
end;

procedure TfrmMain.btnCopyToClipboardClick(Sender: TObject);
begin
  edtPassword.SelectAll;
  edtPassword.CopyToClipboard;
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.grpPwTypeClick(Sender: TObject);
begin
  CheckPunctuationEnabled;
end;

procedure TfrmMain.CheckPunctuationEnabled;
begin
  cbPunctuation.Enabled := (tbPwLen.Position > 1) and (grpPwType.ItemIndex in [0,1,2]);
end;

end.

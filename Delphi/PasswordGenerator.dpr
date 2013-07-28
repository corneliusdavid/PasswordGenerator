program PasswordGenerator;

uses
  Forms,
  ufrmMain in 'ufrmMain.pas' {frmMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Password Generator';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

program advanced;

uses
  System.StartUpCopy,
  FMX.Forms,
  Views.Menu in 'src\Views.Menu.pas' {FrmMenu};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.Run;
end.

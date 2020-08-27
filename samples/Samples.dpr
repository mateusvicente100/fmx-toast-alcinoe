program Samples;

uses
  System.StartUpCopy,
  FMX.Forms,
  Views.Menu in 'src\Views.Menu.pas' {FrmMenu},
  FMX.Toast in '..\src\FMX.Toast.pas',
  FMX.Toast.Frame in '..\src\FMX.Toast.Frame.pas' {FrameToast: TFrame},
  FMX.Toast.Types in '..\src\FMX.Toast.Types.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.Run;
end.

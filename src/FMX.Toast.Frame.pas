unit FMX.Toast.Frame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Objects, ALFmxObjects, FMX.Effects,
  FMX.Layouts, ALFmxLayouts;

type
  TFrameToast = class(TFrame)
    retContent: TALRectangle;
    retLine: TALRectangle;
    imgIcon: TPath;
    lytText: TALLayout;
    txtTitle: TALText;
    txtMessage: TALText;
    lytClose: TALLayout;
    imgClose: TPath;
    sdwContent: TShadowEffect;
    lytIcon: TALLayout;
    procedure retContentClick(Sender: TObject);
  private
    FOnClose: TProc;
  public
    property OnClose: TProc read FOnClose write FOnClose;
  end;

implementation

{$R *.fmx}

procedure TFrameToast.retContentClick(Sender: TObject);
begin
  Self.Visible := False;
  if Assigned(FOnClose) then
    FOnClose;
end;

end.

unit Views.Menu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Toast, ALFmxObjects, ALFmxLayouts, FMX.Effects;

type
  TFrmMenu = class(TForm)
    btnWarning: TButton;
    btnError: TButton;
    btnSuccess: TButton;
    btnInfo: TButton;
    retContent: TRectangle;
    procedure btnWarningClick(Sender: TObject);
    procedure btnErrorClick(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure btnSuccessClick(Sender: TObject);
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.fmx}

procedure TFrmMenu.btnErrorClick(Sender: TObject);
begin
  TToast.New(Self).Error('This is a simple error toast message!');
end;

procedure TFrmMenu.btnInfoClick(Sender: TObject);
begin
  TToast.New(Self).Info('This is a simple info toast message!');
end;

procedure TFrmMenu.btnSuccessClick(Sender: TObject);
begin
  TToast.New(Self).Success('This is a simple success toast message!');
end;

procedure TFrmMenu.btnWarningClick(Sender: TObject);
begin
  TToast.New(Self).Warning('This is a simple warning toast message!');
end;

end.

unit Views.Menu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, ALFmxObjects, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani, FMX.MultiView, FMX.Toast;

type
  TFrmMenu = class(TForm)
    retHeader: TALRectangle;
    lytHeader: TLayout;
    btnVoltar: TSpeedButton;
    imgVoltar: TPath;
    Label1: TLabel;
    Label2: TLabel;
    lblConta: TLabel;
    btnOpcoes: TSpeedButton;
    imgOpcoes: TPath;
    retHoje: TRectangle;
    vsbContent: TVertScrollBox;
    lblHoje: TLabel;
    Rectangle1: TRectangle;
    Path1: TPath;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Rectangle2: TRectangle;
    Path2: TPath;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Rectangle3: TRectangle;
    Path3: TPath;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Rectangle4: TRectangle;
    Label15: TLabel;
    Rectangle5: TRectangle;
    Path4: TPath;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Rectangle6: TRectangle;
    Path5: TPath;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Layout1: TLayout;
    Path6: TPath;
    Rectangle7: TRectangle;
    Path7: TPath;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Rectangle8: TRectangle;
    Path8: TPath;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Rectangle9: TRectangle;
    Path9: TPath;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Rectangle10: TRectangle;
    Path10: TPath;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    MultiView: TMultiView;
    vsbMultiView: TVertScrollBox;
    retMultiViewContent: TRectangle;
    retSuccesso: TRectangle;
    imgSucesso: TPath;
    lblSuccess: TLabel;
    retErro: TRectangle;
    imgErro: TPath;
    lblErro: TLabel;
    retAtencao: TRectangle;
    imgAtencao: TPath;
    lblAtencao: TLabel;
    retInfo: TRectangle;
    imgInfo: TPath;
    lblInfo: TLabel;
    btnSucesso: TSpeedButton;
    btnInfo: TSpeedButton;
    btnAtencao: TSpeedButton;
    btnErro: TSpeedButton;
    procedure btnSucessoClick(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure btnAtencaoClick(Sender: TObject);
    procedure btnErroClick(Sender: TObject);
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.fmx}

procedure TFrmMenu.btnAtencaoClick(Sender: TObject);
begin
  TToast.New(Self).Warning('This is a simple warning toast message!');
end;

procedure TFrmMenu.btnErroClick(Sender: TObject);
begin
  TToast.New(Self).Error('This is a simple error toast message!');
end;

procedure TFrmMenu.btnInfoClick(Sender: TObject);
begin
  TToast.New(Self).Info('This is a simple info toast message!');
end;

procedure TFrmMenu.btnSucessoClick(Sender: TObject);
begin
  TToast.New(Self).Success('This is a simple success toast message!');
end;

end.

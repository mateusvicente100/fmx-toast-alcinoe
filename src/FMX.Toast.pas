unit FMX.Toast;

interface

uses ALFmxLayouts, FMX.Types, ALFmxObjects, FMX.VirtualKeyboard, FMX.Graphics, System.UITypes, ALFmxAni, FMX.Platform, FMX.Forms,
  FMX.Toast.Frame, FMX.Toast.Types, System.SysUtils, System.DateUtils;

type
  TToast = class
  private
    FOwner: TFmxObject;
    FPosition: TAlignLayout;
    FDuration: Integer;
    FAnimation: TALFloatPropertyAnimation;
    FFrame: TFrame;
    FContent: TALLayout;
    FType: TToastType;
    FMessage: string;
    procedure DeleteToast(Sender: TObject);
    procedure CreateContent;
    procedure CreateFrame;
    procedure CreateAnimation;
    procedure ForceStop;
    procedure Show;
    constructor Create(const AOwner: TFmxObject);
  public
    class function New(const AOwner: TFmxObject): TToast;
    function Position(const APosition: TAlignLayout): TToast;
    function Duration(const ADuration: Integer): TToast;
    procedure Warning(const AMessage: string);
    procedure Error(const AMessage: string);
    procedure Success(const AMessage: string);
    procedure Info(const AMessage: string);
    destructor Destroy; override;
  end;

implementation

constructor TToast.Create(const AOwner: TFmxObject);
begin
  FOwner := AOwner;
  FPosition := TAlignLayout.Top;
  FDuration := 4;
end;

procedure TToast.CreateAnimation;
{$IFDEF ANDROID}
var
  LService: IFMXVirtualKeyboardService;
{$ENDIF}
begin
  FAnimation := TALFloatPropertyAnimation.Create(FOwner);
  FAnimation.Parent := FFrame;
  FAnimation.StartValue := 0;
  FAnimation.StopValue := 3;
  FAnimation.Duration := FDuration / 2;
  FAnimation.Delay := 0;
  FAnimation.AutoReverse := True;
  FAnimation.PropertyName := 'Opacity';
  FAnimation.AnimationType := TAnimationType.&In;
  FAnimation.Interpolation := TInterpolationType.Linear;
  FAnimation.OnFinish := Self.DeleteToast;
{$IFDEF ANDROID}
  if TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(LService)) then
    LService.HideVirtualKeyboard;
{$ENDIF}
  FAnimation.Enabled := True;
end;

procedure TToast.CreateContent;
begin
  FContent := TALLayout.Create(FOwner);
  FContent.Parent := TFmxObject(FOwner);
  FContent.Opacity := 1;
  FContent.Align := TAlignLayout.Contents;
  FContent.Visible := True;
  FContent.Visible := True;
  FContent.HitTest := False;
  FContent.BringToFront;
end;

procedure TToast.DeleteToast(Sender: TObject);
begin
  if Assigned(FContent) then
    FContent.Visible := False;
  Self.DisposeOf;
end;

procedure TToast.CreateFrame;
begin
  FFrame := TFrameToast.Create(FOwner);
  FFrame.Align := FPosition;
  FFrame.Parent := FContent;
  FFrame.Name := FFrame.ClassName + MilliSecondOf(Now).ToString + Random(1000).ToString;
  TFrameToast(FFrame).retLine.Fill.Color := FType.GetColor;
  TFrameToast(FFrame).imgIcon.Fill.Color := FType.GetColor;
  TFrameToast(FFrame).imgIcon.Data.Data := FType.GetPicture;
  TFrameToast(FFrame).txtTitle.Text := FType.GetTitle;
  TFrameToast(FFrame).txtMessage.Text := FMessage;
  TFrameToast(FFrame).OnClose := Self.ForceStop;
end;

destructor TToast.Destroy;
begin
  if Assigned(FAnimation) then
  begin
    FAnimation.Owner.RemoveComponent(FAnimation);
    FAnimation.DisposeOf;
  end;

  if Assigned(FFrame) then
  begin
    FFrame.Owner.RemoveComponent(FFrame);
    FFrame.DisposeOf;
  end;

  if Assigned(FContent) then
  begin
    FContent.Owner.RemoveComponent(FContent);
    FContent.DisposeOf;
  end;

  FAnimation := nil;
  FFrame := nil;
  FContent := nil;
  inherited;
end;

function TToast.Duration(const ADuration: Integer): TToast;
begin
  FDuration := ADuration;
  Result := Self;
end;

procedure TToast.Error(const AMessage: string);
begin
  FType :=  TToastType.Error;
  FMessage := AMessage;
  Self.Show
end;

procedure TToast.ForceStop;
begin
  if Assigned(FAnimation) and FAnimation.Running then
    FAnimation.Stop;
end;

procedure TToast.Info(const AMessage: string);
begin
  FType :=  TToastType.Info;
  FMessage := AMessage;
  Self.Show
end;

class function TToast.New(const AOwner: TFmxObject): TToast;
begin
  Result := TToast.Create(AOwner);
end;

function TToast.Position(const APosition: TAlignLayout): TToast;
begin
  FPosition := APosition;
  Result := Self;
end;

procedure TToast.Show;
begin
  CreateContent;
  CreateFrame;
  CreateAnimation;
end;

procedure TToast.Success(const AMessage: string);
begin
  FType :=  TToastType.Success;
  FMessage := AMessage;
  Self.Show
end;

procedure TToast.Warning(const AMessage: string);
begin
  FType :=  TToastType.Warning;
  FMessage := AMessage;
  Self.Show;
end;

end.

unit FMX.Toast.Types;

interface

uses System.UITypes;

type
{$SCOPEDENUMS ON}
  TToastType = (Warning, Info, Success, Error);
{$SCOPEDENUMS OFF}

  TToastTypeHelper = record helper for TToastType
  private
    function GetWarningIcon: string;
    function GetSuccessIcon: string;
    function GetInfoIcon: string;
  public
    function GetPicture: string;
    function GetColor: TAlphaColor;
    function GetTitle: string;
  end;

implementation

function TToastTypeHelper.GetColor: TAlphaColor;
begin
  case Self of
    TToastType.Warning:
      Result := $FFFFC021;
    TToastType.Info:
      Result := $FF2F86EB;
    TToastType.Success:
      Result := $FF006060;
  else
    Result := $FFDA4C4B;
  end;
end;

function TToastTypeHelper.GetInfoIcon: string;
begin
  Result := 'M13,9H11V7H13M13,17H11V11H13M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z';
end;

function TToastTypeHelper.GetPicture: string;
begin
  case Self of
    TToastType.Warning:
      Result := GetWarningIcon;
    TToastType.Info:
      Result := GetInfoIcon;
    TToastType.Success:
      Result := GetSuccessIcon;
    TToastType.Error:
      Result := GetWarningIcon;
  end;
end;

function TToastTypeHelper.GetSuccessIcon: string;
begin
  Result := 'M10,17L5,12L6.41,10.58L10,14.17L17.59,6.58L19,8M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 ' +
    '0 0,0 12,2Z';
end;

function TToastTypeHelper.GetTitle: string;
begin
  case Self of
    TToastType.Warning:
      Result := 'Atenção';
    TToastType.Info:
      Result := 'Info';
    TToastType.Success:
      Result := 'Sucesso';
    TToastType.Error:
      Result := 'Atenção';
  end;
end;

function TToastTypeHelper.GetWarningIcon: string;
begin
  Result := 'M13,13 L11,13 L11,7 L13,7 M13,17 L11,17 L11,15 L13,15 M12,2 C6.4771523475647,2 2,6.4771523475647 2,12 ' +
    'C2,17.5228481292725 6.4771523475647,22 12,22 C17.5228481292725,22 22,17.5228481292725 22,12 C22,6.4771523475647 '+
    '17.5228481292725,2 12,2 Z';
end;

end.

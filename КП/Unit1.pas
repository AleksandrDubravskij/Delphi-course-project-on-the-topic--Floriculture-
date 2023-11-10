unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
begin
    Timer1.Enabled := False;

Form2.ShowModal;
close
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  WindowState := wsMaximized;  // ������������� ��������� ����� �� "�����������"
  BorderStyle := bsNone;      // ������������� ����� ������� ����� �� "�����������"

    Timer1.Interval := 5000;
    Timer1.Enabled := True;
end;


end.

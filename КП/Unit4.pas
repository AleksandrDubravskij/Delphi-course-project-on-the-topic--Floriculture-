unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TForm4 = class(TForm)
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    f: TextFile;
    s: string;
    Nvern, ball: integer;
    Base: string;
    FlowerImages: array [0..11] of string;
    CurrentImageIndex: Integer;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.FormActivate(Sender: TObject);
var
  ExePath: string;
begin
  Button1.Enabled := True;
  AssignFile(f, '����.txt');
  reset(f);
  readln(f, s);
  ball := 0;
  repeat
    if (s[1] = '-') then
    begin
      delete(s, 1, 1);
      RadioGroup1.Caption := s;
    end
    else if s[1] = '*' then
    begin
      delete(s, 1, 1);
      Nvern := StrToInt(s);
    end
    else
      RadioGroup1.Items.Add(s);
    readln(f, s);
  until (s[1] = '-') or (Eof(f));

    ExePath := ExtractFilePath(Application.ExeName);
  // ������������� ������� ����� � ������������
  FlowerImages[0] := ExePath + '�������� � ������\����\����������.jpg';
  FlowerImages[1] :=  ExePath+ '�������� � ������\����\����.jpg';
  FlowerImages[2] := ExePath + '�������� � ������\����\���.jpg';
  FlowerImages[3] := ExePath + '�������� � ������\����\������.jpg';
  FlowerImages[4] :=ExePath + '�������� � ������\����\���������.jpg';
  FlowerImages[5] := ExePath + '�������� � ������\����\������.jpg';
  FlowerImages[6] :=ExePath + '�������� � ������\����\�������.jpg';
  FlowerImages[7] := ExePath + '�������� � ������\����\�������.jpg';
  FlowerImages[8] :=ExePath + '�������� � ������\����\����.jpg';
  FlowerImages[9] := ExePath + '�������� � ������\����\�������.jpg';


  CurrentImageIndex := 0; // ������ �������� �����������
  Base := FlowerImages[CurrentImageIndex]; // ���� � ������� �����������
  Image1.Picture.LoadFromFile(Base);
  Image1.Stretch := True;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = Nvern - 1 then
    ball := ball + 1;

  // ������������ �� ��������� �����������
  CurrentImageIndex := (CurrentImageIndex + 1) mod 10; // 10 - ���������� �����������
  Base := FlowerImages[CurrentImageIndex];
  Image1.Picture.LoadFromFile(Base);
  Image1.Stretch := True;

  RadioGroup1.Items.Clear; // ������� ������ ��������� �������
  repeat
    if (s[1] = '-') then
    begin
      delete(s, 1, 1);
      RadioGroup1.Caption := s;
    end
    else if s[1] = '*' then
    begin
      delete(s, 1, 1);
      Nvern := StrToInt(s);
    end
    else
      RadioGroup1.Items.Add(s);
    readln(f, s);
  until (s[1] = '-') or (Eof(f));


  if Eof(f) then
  begin
    delete(s, 1, 1);
    Nvern := StrToInt(s);
    if RadioGroup1.ItemIndex = Nvern - 1 then
      ball := ball + 1;
      RadioGroup1.Items.Clear; // ������� ������ ��������� �������
    CloseFile(f);

    if ball = 10 then
      ShowMessage('���������� ������: ' + IntToStr(ball) + ' �� 10' + #13 +
        '�������!')
    else if (ball <= 10) and (ball >= 6) then
      ShowMessage('���������� ������: ' + IntToStr(ball) + ' �� 10' + #13 +
        '������!')
    else if (ball <= 6) and (ball >= 3) then
      ShowMessage('���������� ������: ' + IntToStr(ball) + ' �� 10' + #13 +
        '�����, �� �������???')
    else if ball <= 3 then
      ShowMessage('���������� ������: ' + IntToStr(ball) + ' �� 10' + #13 +
        '��� ���� � ���� ����������');

    
    Button1.Visible := true;
    Button2.Visible := True;
    Image1.Visible := true;
    Button1.Enabled := true;
  end;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
   RadioGroup1.Items.Clear;
  Close;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // ����� �������� ���������� � ��������� ����� ��� ��������
  RadioGroup1.ItemIndex := -1;
  ball := 0;
  CurrentImageIndex := 0;
end;


procedure TForm4.FormCreate(Sender: TObject);
begin
      WindowState := wsMaximized;
end;

end.



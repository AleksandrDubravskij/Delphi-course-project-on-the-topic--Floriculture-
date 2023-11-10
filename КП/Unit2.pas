unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, jpeg, ExtCtrls, MPlayer, ShellAPI;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ListBox1: TListBox;
    FontDialog1: TFontDialog;
    Image1: TImage;
    N3: TMenuItem;
    MediaPlayer1: TMediaPlayer;
    N4: TMenuItem;
    Button1: TButton;
    N5: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  Unit1, Unit3, Unit4;

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  WindowState := wsMaximized;
  BorderStyle := bsNone;

  ListBox1.Items.Insert(0, '��������� ��������:'); // ��������� ������
  ListBox1.Items.Add('��������');
  ListBox1.Items.Add('����');
  ListBox1.Items.Add('���');
  ListBox1.Items.Add('��������');
  ListBox1.Items.Add('����������');
  ListBox1.Items.Add('����');
  ListBox1.Items.Add('�������');
  ListBox1.Items.Add('��������');
  ListBox1.Items.Add('������');
  ListBox1.Items.Add('�������');
  ListBox1.Items.Add('�������');
  ListBox1.Items.Add('���������');
  ListBox1.Items.Add('������');
  ListBox1.Items.Add('�������');
  ListBox1.Items.Add('������');
  // �������� ��������� ����� �� ��������
end;

procedure TForm2.ListBox1Click(Sender: TObject);
var
  Base: string;
begin
  if ListBox1.ItemIndex <> -1 then
  begin
    if ListBox1.Items[ListBox1.ItemIndex] = '��������' then
       Base:= '�������� � ������\��������.htm'
    else if ListBox1.Items[ListBox1.ItemIndex] = '����' then
      Base := '�������� � ������\������� ����.htm'
    else if ListBox1.Items[ListBox1.ItemIndex] = '���' then
      Base := '�������� � ������\���.htm'
    else if ListBox1.Items[ListBox1.ItemIndex] = '��������' then
      Base := '�������� � ������\��������.htm'
    else if ListBox1.Items[ListBox1.ItemIndex] = '����������' then
      Base := '�������� � ������\����������.htm'
    else if ListBox1.Items[ListBox1.ItemIndex] = '����' then
      Base := '�������� � ������\����.htm'
      else if ListBox1.Items[ListBox1.ItemIndex] = '�������' then
      Base := '�������� � ������\�������.htm'
       else if ListBox1.Items[ListBox1.ItemIndex] = '��������' then
      Base := '�������� � ������\��������.htm'
       else if ListBox1.Items[ListBox1.ItemIndex] = '������' then
      Base := '�������� � ������\������.htm'
      else if ListBox1.Items[ListBox1.ItemIndex] = '�������' then
      Base := '�������� � ������\�������.htm'
      else if ListBox1.Items[ListBox1.ItemIndex] = '�������' then
      Base := '�������� � ������\�������.htm'
      else if ListBox1.Items[ListBox1.ItemIndex] = '���������' then
      Base := '�������� � ������\���������.htm'
      else if ListBox1.Items[ListBox1.ItemIndex] = '������' then
      Base := '�������� � ������\������.htm'
      else if ListBox1.Items[ListBox1.ItemIndex] = '�������' then
      Base := '�������� � ������\�������.htm'
      else if ListBox1.Items[ListBox1.ItemIndex] = '������' then
      Base := '�������� � ������\������.htm';

    if Base <> '' then
    begin
      Form3 := TForm3.Create(Self); // ������� ��������� ����� Form3
      try
          Form3.Caption := ListBox1.Items[ListBox1.ItemIndex]; // ���������� ��������� �����
        Form3.WebBrowser1.Navigate(ExtractFilePath(Application.ExeName) + Base);
        Form3.ShowModal;
      finally
        Form3.Free;
      end;
       
    end;
  end;
end;

procedure TForm2.N3Click(Sender: TObject);
begin
  MediaPlayer1.FileName := '�������� � ������\zvuki-prirody-zvuki-lesa.mp3'; // �������� �� ���� � ������ ����������
  MediaPlayer1.Open;
  MediaPlayer1.Play;
  

end;

procedure TForm2.N4Click(Sender: TObject);
begin
 MediaPlayer1.Stop;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
Form4.ShowModal;
end;

procedure TForm2.N5Click(Sender: TObject);
begin
Form1.Close;
  Form2.Close;
end;

procedure TForm2.N2Click(Sender: TObject);
begin
ShellExecute(0,PChar('Open'),PChar('DelphiHelper.chm'),nil,nil,SW_SHOW)
end;

end.

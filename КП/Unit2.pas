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

  ListBox1.Items.Insert(0, 'Различные цветочки:'); // Заголовок списка
  ListBox1.Items.Add('Тюльпаны');
  ListBox1.Items.Add('Розы');
  ListBox1.Items.Add('Мак');
  ListBox1.Items.Add('Гвоздика');
  ListBox1.Items.Add('Хризантема');
  ListBox1.Items.Add('Пион');
  ListBox1.Items.Add('Нарцисс');
  ListBox1.Items.Add('Васильки');
  ListBox1.Items.Add('Сирень');
  ListBox1.Items.Add('Орхидея');
  ListBox1.Items.Add('Ромашка');
  ListBox1.Items.Add('Незабудка');
  ListBox1.Items.Add('Жасмин');
  ListBox1.Items.Add('Лаванда');
  ListBox1.Items.Add('Фиалка');
  // Добавьте остальные цвета по аналогии
end;

procedure TForm2.ListBox1Click(Sender: TObject);
var
  Base: string;
begin
  if ListBox1.ItemIndex <> -1 then
  begin
    if ListBox1.Items[ListBox1.ItemIndex] = 'Тюльпаны' then
       Base:= 'Картинки и прочее\Тюльпаны.htm'
    else if ListBox1.Items[ListBox1.ItemIndex] = 'Розы' then
      Base := 'Картинки и прочее\Красные розы.htm'
    else if ListBox1.Items[ListBox1.ItemIndex] = 'Мак' then
      Base := 'Картинки и прочее\Мак.htm'
    else if ListBox1.Items[ListBox1.ItemIndex] = 'Гвоздика' then
      Base := 'Картинки и прочее\Гвоздика.htm'
    else if ListBox1.Items[ListBox1.ItemIndex] = 'Хризантема' then
      Base := 'Картинки и прочее\Хризантема.htm'
    else if ListBox1.Items[ListBox1.ItemIndex] = 'Пион' then
      Base := 'Картинки и прочее\Пион.htm'
      else if ListBox1.Items[ListBox1.ItemIndex] = 'Нарцисс' then
      Base := 'Картинки и прочее\Нарцисс.htm'
       else if ListBox1.Items[ListBox1.ItemIndex] = 'Васильки' then
      Base := 'Картинки и прочее\Васильки.htm'
       else if ListBox1.Items[ListBox1.ItemIndex] = 'Сирень' then
      Base := 'Картинки и прочее\Сирень.htm'
      else if ListBox1.Items[ListBox1.ItemIndex] = 'Орхидея' then
      Base := 'Картинки и прочее\Орхидея.htm'
      else if ListBox1.Items[ListBox1.ItemIndex] = 'Ромашка' then
      Base := 'Картинки и прочее\Ромашка.htm'
      else if ListBox1.Items[ListBox1.ItemIndex] = 'Незабудка' then
      Base := 'Картинки и прочее\Незабудка.htm'
      else if ListBox1.Items[ListBox1.ItemIndex] = 'Жасмин' then
      Base := 'Картинки и прочее\Жасмин.htm'
      else if ListBox1.Items[ListBox1.ItemIndex] = 'Лаванда' then
      Base := 'Картинки и прочее\Лаванда.htm'
      else if ListBox1.Items[ListBox1.ItemIndex] = 'Фиалка' then
      Base := 'Картинки и прочее\Фиалка.htm';

    if Base <> '' then
    begin
      Form3 := TForm3.Create(Self); // Создать экземпляр формы Form3
      try
          Form3.Caption := ListBox1.Items[ListBox1.ItemIndex]; // Установить заголовок формы
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
  MediaPlayer1.FileName := 'Картинки и прочее\zvuki-prirody-zvuki-lesa.mp3'; // Замените на путь к вашему аудиофайлу
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

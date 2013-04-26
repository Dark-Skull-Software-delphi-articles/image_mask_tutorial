unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Déclarations privées }
    BackBmp: TBitmap;
    Bitmap: TBitmap;
    Mask: TBitmap;
    XPos, YPos: integer;
  public
    { Déclarations publiques }
    procedure DrawHead;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  BackBmp := TBitmap.Create;
  Bitmap := TBitmap.Create;
  Mask := TBitmap.Create;
  BackBmp.LoadFromFile('BackTile.bmp');
  Bitmap.LoadFromFile('EtFace.bmp');
  Mask.LoadFromFile('EtMask.bmp');
  XPos := 0;
  YPos := 0;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  XPos := (ClientWidth - Bitmap.Width) div 2;
  YPos := (ClientHeight - Bitmap.Height) div 2;
  FormPaint(Self);
end;

procedure TForm1.FormPaint(Sender: TObject);
var
  i, j: integer;
begin
  Canvas.CopyMode := cmSrcCopy;
  for i := 0 to (ClientWidth div BackBmp.Width) do
    begin
      for j := 0 to (ClientHeight div BackBmp.Height) do
        begin
          Canvas.Draw(i * BackBmp.Width, j * BackBmp.Height, BackBmp);
        end;
    end;
  DrawHead;
end;

procedure TForm1.DrawHead;
begin
  Canvas.CopyMode := cmSrcAnd;
  Canvas.Draw(XPos, YPos, Mask);
  Canvas.CopyMode := cmSrcPaint;
  Canvas.Draw(XPos, YPos, Bitmap);
end;

end.

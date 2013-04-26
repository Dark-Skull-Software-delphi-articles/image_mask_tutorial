image_mask_tutorial
===================

Image Mask Tutorial

On web pages, there are a lot of transparent images (png, gif).<br/>
On windows, it is a bit harder to obtain this effect.

You can use a TImage, but the perfs are very slow.<br/>
If you want to build a game, you can't use a TImage for each sprite, you'll get an horrible framerate.

Here is the solution: use image masks.

You'll need:
* the image (sprite) on black background 
* the mask, a black & white picture where the background is white and the sprite is black.
* a background image
 
Then, once the background is drawn, you just need to draw the mask in "And" mode, then the image in "Paint" mode :

```delphi
procedure TForm1.DrawImage;
begin
  Canvas.CopyMode := cmSrcAnd;
  Canvas.Draw(XPos, YPos, Mask);
  Canvas.CopyMode := cmSrcPaint;
  Canvas.Draw(XPos, YPos, Bitmap);
end;
```

************************
Dark Skull Software<br/>
http://www.darkskull.net

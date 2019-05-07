

<img align="left" width="150" height="150" src="/android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png">

# Comical

A Flutter application that is used to create comic book style jokes and stories.


## Inspiration

My original idea is to create a mobile application, that can help general users to create a comic book
style conversational memes or stories, like the one below.

![Inspiration](/samples/story.jpeg "Comic Story")

## Flutter Create Challenge

As we have 5K dart code limit for the challenge entry, I have tried to create the core concept of creating
conversational meme as part of the challenge. The original app would have more features that will allow
users to create comic book story layouts and collage all individual conversation images.

## What this app can do

- This app contains only one screen, you can find all the options in the main screen itself.
- **TAP** on the screen (background) to change the background color, when you tap on screen you can see a random color.
- **TAP** on the "T" icon on top - will add TEXT to the screen.
- **TAP** on the TEXT on screen to change color of the text similar to background color change.
- **DOUBLE TAP** on the TEXT to edit the text, you will see a dialog with input field that allows you to edit the text.
the dialog takes the screen background color, for aesthetic reasons.
- **LONG PRESS** on TEXT - to see DELETE icon on top of the TEXT.
- **TAP** on DELETE icon to remove the TEXT from screen.
- **PINCH ZOOM** on the TEXT - will allow you to scale the TEXT, increase the font size.
- **DRAG/MOVE** the TEXT on the screen as you need.
- **TAP** on the STICKERS at the bottom list, to add a STICKER on to the screen.
- **LONG PRESS** on STICKER added to screen, to see DELETE icon on top of the STICKER, clicking which will remove sticker from screen.
- **DRAG/MOVE** the STICKER on the screen as you need.
- **PINCH ZOOM** on the STICKER - will allow you to scale the STICKER.
- STICKERS - you can see few funny characters, chat bubbles, pointer lines which you can add to screen and create your conversation comical.
- **TAP** REFRESH icon on top to clear the canvas.
- **TAP** SHARE icon on top to share the COMICAL, with your friends and family.

## Sample Image created using this app
![Comical Sample](/samples/sample.jpg "Comical")

## TRIED but not in code now
- Used SVGs and flutter_svg package so vectors characters can be used, but as I noticed issues in rendering on PIXEL 3XL, other pixel devices has no issues,
had to drop SVGs and use high-res pngs for stickers.
- Used dashed circle for all the icons on top, due to 5k target had to remove those things.
- Had used gradients as background using gradient_widgets package, tried to randomize the gradients to add more fun element, but again due to 5k limit had to remove that too.

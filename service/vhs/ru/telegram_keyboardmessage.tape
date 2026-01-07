
Set Theme   { "name": "OPI", "black": "#090300", "red": "#db2d20", "green": "#002B28", "yellow": "#004943", "blue": "#01a0e4", "magenta": "#a16a94", "cyan": "#b5e4f4", "white": "#000000", "brightBlack": "#5c5855", "brightRed": "#e8bbd0", "brightGreen": "#002B28", "brightYellow": "#004943", "brightBlue": "#807d7c", "brightMagenta": "#d6d5d4", "brightCyan": "#cdab53", "brightWhite": "#000000", "background": "#FFFFFF", "foreground": "#4a4543", "cursor": "#4a4543", "selection": "#a5a2a2" }


Output "..\..\docs\ru\md\Start\img\3.gif"

# Require echo

Set Shell "cmd"
Set FontSize 12
Set Width 868
Set Height 619

Hide
Type "set token=" Enter
Type "cls" Enter
Show
 
Type `oint telegram СформироватьКлавиатуруПоМассивуКнопок --buttons "['Кнопка','Кнопка2','Кнопка3']" --out keyboard.json ` Sleep 200ms  Enter
Sleep 3s
Type `oint telegram ОтправитьТекстовоеСообщение --token %token% --chat 461699897 --text "Привет из Oint!" --keyboard ./keyboard.json` Sleep 200ms  Enter

Sleep 12s

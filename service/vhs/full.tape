

Output "full.gif"

# Require echo

Set Shell "cmd"
Set FontSize 12
Set Width 868
Set Height 619
Set WindowBar Colorful
Set Theme "NightLion v2"


Hide
Type "set token=" Enter
Type "cls" Enter
Show
 
Type `oint` Sleep 200ms  Enter
Sleep 8s

Type `oint telegram` Sleep 200ms  Enter
Sleep 5s

Type `oint telegram СформироватьКлавиатуруПоМассивуКнопок` Sleep 200ms  Enter
Sleep 3s

Type `oint telegram СформироватьКлавиатуруПоМассивуКнопок --buttons "['Хорошо','Нормально','Плохо']" --out keyboard.json ` Sleep 200ms  Enter
Sleep 3s
Type `oint telegram ОтправитьТекстовоеСообщение --token %token% --chat 461699897 --text "Привет, как дела?" --keyboard ./keyboard.json` Sleep 200ms  Enter

Sleep 12s

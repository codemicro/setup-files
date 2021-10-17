# Caps lock and escape switch

2021-05-02

Caps lock behaves as an extra ESC key (but ESC does not behave as caps lock).

1. Go to "System Settings" > "Keyboard" > "Layouts"
2. Select "English (UK)" then press "Options..."
3. Expand "Caps lock behaviour"
4. Select "Make caps lock an additional Esc"

Additionally, in VSCode, this change might not be correctly observed. This can be fixed with the following setting:

```json
{
	"keyboard.dispatch": "keyCode"
}
```

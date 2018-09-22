# Daily Random Kanji

A widget made for [Übersicht](http://tracesof.net/uebersicht/) using _CoffeeScript_. Shows a new random Kanji on your desktop everyday including it's ID, meaning and reading.
The Kanji list in *kanji.txt* was compiled from this  [Kanji List.](https://en.wikipedia.org/wiki/List_of_j%C5%8Dy%C5%8D_kanji)

<img src="screenshot.png" width="50%" height="50%">

### [Download](https://github.com/cbeardsmore/Daily-Random-Kanji/raw/master/Daily-Random-Kanji.widget.zip)

## Customization

The range of Kanji displayed can be modified by altering the numeric value after "RANDOM" in the command line to the following values:

<center>

| Grade | Value  |
|:-:|:-:|
| 1 | 81 |
| 2 | 241 |
| 3 | 441 |
| 4 | 641 |
| 5 | 828 |
| 6 | 1009 |
| S | 2139 |

</center>

The current version lists ID, the kanji and it's meaning. The japanese reading can be added by adding a new *div* to both the *render* and *update* methods. Make sure the command is showing the correct file path, depending on how your files are arranged.

## Support

- Please email me for bug fixes at *connor.beardsmore@gmail.com*
- Or open an Issue on *github*

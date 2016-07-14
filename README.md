# Daily-Random-Kanji

<center>
  <img src="https://github.com/cbeardsmore/Daily-Random-Kanji/blob/master/screenshot.png?raw=true" alt="Screenshot">
</center>

A widget made for [Übersicht](http://tracesof.net/uebersicht/) using _CoffeeScript_  

Shows a new random Kanji on your desktop everyday including it's ID, meaning and reading.

The Kanji list in *kanji.txt* was compiled from the following list:

<https://en.wikipedia.org/wiki/List_of_j%C5%8Dy%C5%8D_kanji>

## Customization

The range of Kanji displayed can be modified by altering the numeric value after "RANDOM" in the command line to the following values:

- Grade 1 $$\rightarrow$$ 81
- Grade 2 $$\rightarrow$$ 241
- Grade 3 $$\rightarrow$$ 441
- Grade 4 $$\rightarrow$$ 641
- Grade 5 $$\rightarrow$$ 828
- Grade 6 $$\rightarrow$$ 1009
- Secondary $$\rightarrow$$ 2139

The current version lists ID, the kanji and it's meaning. The japanese reading can be added by adding a new *div* to both the *render* and *update* methods


## Bug Fixes

This widget hasn't been tested extensively, but I'll try and keep it maintained. Email bug fixes to the email located in the JSON file. If you find any mistakes within the kanji.txt file or incorrect meanings/readings please let me know (getting 2000 correct isn't easy).


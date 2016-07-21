# Author: Connor Beardsmore <connor.beardsmore@gmail.com>
# Last Modified: 14/07/16

# Change the number after RANDOM to choose which kanji level you want:
# GRADE 1 = 81
# GRADE 2 = 241
# GRADE 3 = 441
# GRADE 4 = 641
# GRADE 5 = 828
# GRADE 6 = 1009
# SECONDARY/ALL = 2139

command:
    " sed -n \"$((RANDOM%2139))p\" \"./Daily-Random-Kanji/Daily-Random-Kanji.widget/kanji.txt\" "

# Update is called daily
refreshFrequency: "1d"

# CSS styling
style: """
    top: 0px
    top: 15%
    right: 1%
    font-family: Helvetica
    background-color rgba(black, 0.5)
    padding 8px
    border-radius 5px

    div
        color white
        font-weight: bold
        text-align center
        /* PADDING BETWEEN DIV'S */
        margin-top: -10px

    #smalltext
        margin-top: 0px
        margin-bottom: -15px
        font-size 12px

    #largetext
        font-size 20px

    #kanji
        font-size 70px
"""

# Initial render
render: (output) ->
    field = output.split(" ");
    id = field[0];
    kanji = field[1];
    meaning = field[2];
    reading = field[3];
    """
    <div id="smalltext"> #{id} </div>
    <div id="kanji"> #{kanji} </div>
    <div id="largetext"> #{meaning} </div>
    """

    # Add the following div lines as required for whatever info you want:
    # <div id="smalltext"> #{id} </div>
    # <div id="largetext"> #{reading} </div>

# Update when refresh occurs
update: (output, domEl) ->
    field = output.split(" ");
    id = field[0];
    kanji = field[1];
    meaning = field[2];
    reading = field[3];
    $(domEl).empty();
    $(domEl).append("""
    <div id="smalltext"> #{id} </div>
    <div id="kanji"> #{kanji} </div>
    <div id="largetext"> #{meaning} </div>
    """);

    # Add the following div lines as required for whatever info you want:
    # <div id="smalltext"> #{id} </div>
    # <div id="largetext"> #{reading} </div>

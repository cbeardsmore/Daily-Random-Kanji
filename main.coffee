# Author: Connor Beardsmore <connor.beardsmore@gmail.com>
# Last Modified: 13/07/16

command:
    " sed -n \"$((RANDOM%2139))p\" \"./Daily-Random-Kanji.widget/kanji.txt\" "

# Update is called daily
refreshFrequency: "1d"

# CSS styling
style: """
    top: 0px
    top: 11%
    right: 12%
    color: black
    font-family: Helvetica
    background-color rgba(black, 0.5)
    padding 8px
    border-radius 5px

    div
        color white
        font-weight: bold
        text-align center

    #meaning
        font-size 20px

    #kanji
        font-size 70px
"""

# Initial render
render: (output) ->
    fields = output.split(" ");
    """
    <div id="kanji"> #{fields[1]} </div>
    <div id="meaning"> #{fields[2]} </div>
"""

# Update when refresh occurs
update: (output, domEl) ->
    fields = output.split(" ");
    $(domEl).empty();
    $(domEl).append("""
    <div id="kanji"> #{fields[1]} </div>
    <div id="meaning"> #{fields[2]} </div>
""");

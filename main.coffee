# Author: Connor Beardsmore <connor.beardsmore@gmail.com>
# Last Modified: 13/07/16

command:
    " sed -n \"$((RANDOM%2139))p\" \"./Daily-Random-Kanji.widget/kanji.txt\" "

# Update is called daily
refreshFrequency: "1d"

# CSS styling
style: """
    top: 0px
    top: 12%
    right: 12%
    color: black
    font-family: Helvetica
    background-color rgba(black, 0.5)
    padding 10px
    border-radius 5px

    div
        display: block
        color white
        font-size: 14px
        font-weight: 450
        text-align center

    #meaning
        font-weight: bold
        font-size 20px

    #kanji
        font-weight: bold
        font-size 60px
"""

# Initial render
render: (output) ->
    fields = output.split(" ");
    """
    <div> #{fields[0]} </div>
    <div id="kanji"> #{fields[1]} </div>
    <div id="meaning"> #{fields[2]} </div>
"""

# Update when refresh occurs
update: (output, domEl) ->
    fields = output.split(" ");
    $(domEl).empty();
    $(domEl).append("""
    <div> #{fields[0]} </div>
    <div id="kanji"> #{fields[1]} </div>
    <div id="meaning"> #{fields[2]} </div>
""");

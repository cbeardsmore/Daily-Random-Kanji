# Author: Connor Beardsmore <connor.beardsmore@gmail.com>
# Last Modified: 13/07/16

command: ""

# Update is called daily
refreshFrequency: "1d"

# CSS styling
style: """
    top: 10px
    top: 1.3%
    right: 12%
    color: black
    font-family: Helvetica
    background-color rgba(black, 0.5)
    padding 15px
    border-radius 5px

    div
        display: block
        color white
        font-size: 14px
        font-weight: 450
        text-align left

    #head
        font-weight: bold
        font-size 20px

    #subhead
        font-weight: bold
        font-size 16px
        border-bottom solid 1px clear
        padding-top 6px
        padding-bottom 3px
"""

# Initial render for heading
render: (output) -> """
    <div id="head"> Upcoming Events </div>
"""

# Update when refresh occurs
update: (output, domEl) ->

# Author: Connor Beardsmore <connor.beardsmore@gmail.com>
# Last Modified: 22/09/18

# Change the number after RANDOM to choose which kanji level you want:
# GRADE 1 = 81
# GRADE 2 = 241
# GRADE 3 = 441
# GRADE 4 = 641
# GRADE 5 = 828
# GRADE 6 = 1009
# SECONDARY/ALL = 2139

command:
    """cat Daily-Random-Kanji.widget/kanji.json"""
    #"""/opt/homebrew/Cellar/pcre2/10.39/bin/pcre2grep -Mo '{(?:[\r\n]|[^{])*"key":#{RANDOM%81},(?:[\r\n]|[^}])*}' Daily-Random-Kanji.widget/kanji.json"""
    #" sed -n \"$((RANDOM%81))p\" \"./Daily-Random-Kanji.widget/kanji.json\" "
    # " sed -n \"$((RANDOM%2139))p\" \"./Daily-Random-Kanji.widget/kanji.txt\" "

# Update is called daily 

refreshFrequency: "10m"

# CSS styling
style: """
    top: 0px
    top: 50%
    right: 50%
    transform:scale(2) translate(25%,-25%);
    font-family: Helvetica
    background-color rgba(black, 0.7)
    padding 8px
    border-radius 5px

    div
        color white
        font-weight: bold
        text-align center
        margin-top: -10px
    
    #readings
        border 1 px solid
        position relative
        color white
        font-weight: bold
        margin-top: -10px
        margin-bottom: 0
        max-width: 150px
        padding 5px
        text-align center

    #readings li
        min-width 20px
        font-size 6pt
        
        list-style-type: none
        color white
        font-weight: bold
        
        padding 3px
        border-radius 50px
        display inline-block
    
    #readings li.pron-On
        background #9c27b085
    #readings li.pron-Kun
        background #aabbff85

    #smalltext
        margin-top: 0px
        margin-bottom: -15px
        font-size 12px

    #revealed
        font-size 10pt
        max-height 0px
        opacity:0

    #revealed.revealed
        max-height unset
        opacity:1

    #kanji
        font-size 70px

    #textSound
        display none
    
    #clibBoardMessage
        display none
        position absolute
        vertical-align center
        transition all 1s ease
        opacity 0
        top 0
        left 0
        right 0
        bottom 0
        font-size : 5pt
        padding 10px
        border-radius 5px
        background rgba(150,255,150,.7)
    
    #clibBoardMessage.revealed
        display block
    
    #clibBoardMessage.revealed.shown
        opacity 1
    #clibBoardMessage.revealed.hiding
        opacity 0
    .kanjsufix
        opacity .5

    #guessit
        transition all 1s ease

    #eye
        font-size 6pt
        cursor pointer
        z-index 10
        position absolute
        left 10px
        transform translateY(-100%)
        background-color rgba(0,0,0,.3)
        color white
        border none
        border-radius 5px

    #guessit.found-one
        background-color rgba(150,255,150,.7)

    #guessit.already-guessed
        background-color rgba(150,150,255,.7)
    
    #guessit.missed-one
        background-color rgba(255,150,150,.7)
    
    #guessit.completed
        display none

    #revealed
        border 1 px solid
        position relative
        color white
        font-weight: bold
        margin-top: -10px
        margin-bottom: 0
        max-width: 150px
        padding 5px
        text-align left
    
    #revealed li
        min-width 20px
        font-size 6pt
        
        list-style-type: none
        color white
        font-weight: bold
        
        padding 3px
        border-radius 50px
        display inline-block
    
    #thetime
        color white
        float left
    
"""



# Initial render
render: (output) ->

# Update when refresh occurs
update: (output, domEl) ->

    $("#textSound").off("click");
    $(domEl).empty();
    min = 1
    max = 2136
    key = parseInt(Math.floor(Math.random() * (max - min + 1) + min))
    log = new RegExp(""""#{key}":(.*[}])[,\r\n]?""","gm").exec(output)
    
    if(log)
        kanji = JSON.parse(log[1]);
        
        sounds = [];
        remaining = [].concat(kanji.meanings);
        found = [];
        listelems = kanji.pron.map (r) -> 
            m = /([^-]+)(-.+|)$/.exec(r[0])
            sounds.push(r[0])
            sound = r[0]
            if(m[2])
                sound = m[1] + """<span class="kanjsufix">#{m[2]}</span>"""
            """<li class="pron-#{r[1]}">#{sound}</li>"""
        textSound = sounds.join(", ");

        allreadings = ""
        allreadings = """<ol id="readings">#{listelems.join("\n")}</ol>""" 
        content = """
        <div id="parent">
            <div id="smalltext"> #{key} </div>
            <div id="kanji"> #{kanji.kanji} </div>
            <button id="eye">see</button>
            <ol id="revealed"></ol>
            <input id="guessit" type="text" placeholder="guess it! (#{remaining.length}) meaning(s)"/>
            <hr/>
            #{allreadings}
            <a id="textSound" >#{textSound}</a>
            <a id="thetime">📆</a>
            <span id="clibBoardMessage"></span>
        </div>
        """
        $(domEl).append(content)


        setTheTime = (e) =>
            currentdate = new Date()
            day = currentdate.getDate()
            month = (currentdate.getMonth()+1)
            year = currentdate.getFullYear()
            hours = currentdate.getHours()
            minutes = currentdate.getMinutes()
            minutesText = (if minutes == 30 then "半" else minutes)
            minutesText = (if minutes == 0 then "" else minutes)

            text = """今日は、#{year}年 #{month}月 #{day}日、時間は、#{hours}時 #{minutesText}です"""

            link = """translate.google.com/translate_tts?ie=UTF-8&tl=ja-JP&client=tw-ob&q=#{text}"""
            $("#thetime").attr("href", """http://#{link}""");

        timer = setInterval( () => 
            setTheTime()
        1000);
        

        $("#eye").on "click" , (x) => 
            $("#guessit").addClass( "completed" );
            $("#revealed").addClass("revealed" )
            revealed = kanji.meanings.map( (x) =>  return """<li>#{x}</li>""" ).join("")
            $("#revealed").html(  revealed  )
            $("#eye").replaceWith("")

        $("#guessit").on 'keyup', (x) => 
            if (x.keyCode == 13)
                guess = $("#guessit").val()
                if(remaining.includes(guess))
                    $("#guessit").addClass("found-one")
                    setTimeout(() =>
                        $("#guessit").removeClass("found-one")
                        index = remaining.indexOf(guess)

                        if (index > -1)
                            remaining.splice(index, 1)
                            found.push(guess)
                            $("#guessit").val("")
                        
                        if (remaining.length == 0 || remaining.length - found.length <= 1)
                            $("#guessit").addClass( "completed" );
                            $("#revealed").addClass("revealed" )
                            revealed = kanji.meanings.map( (x) =>  return """<li>#{x}</li>""" ).join("")
                            $("#revealed").html(  revealed  )
                            $("#eye").replaceWith("")
                        
                        $("#guessit")
                            .attr( "placeholder" , (if remaining.length then """guess it! #{remaining.length} meaning(s)""" else  "congrats!"))
                        

                    ,500)
                else if (found.includes(guess))
                    $("#guessit").addClass("already-guessed")
                    setTimeout(() =>
                        $("#guessit").removeClass("already-guessed")
                        $("#guessit").val("")
                    ,500)
                else
                    $("#guessit").addClass("missed-one")
                    setTimeout(() =>
                        $("#guessit").removeClass("missed-one")
                    ,500)

        $('#readings').on 'click', =>
            anchor = $("#textSound")
            text = anchor.text()
            link = """translate.google.com/translate_tts?ie=UTF-8&tl=ja-JP&client=tw-ob&q=#{text}""";
            anchor.attr("href","""http://#{link}""")

            $("#clibBoardMessage").addClass("revealed")
            setTimeout(() =>
                $("#clibBoardMessage").addClass("shown")
                setTimeout(() => 
                    $("#clibBoardMessage").addClass("hiding")    
                    setTimeout(() => 
                        $("#textSound")[0].click()
                        $("#clibBoardMessage").removeClass("hiding revealed shown")    
                    ,1000) 
                ,1000)
            ,100)
        
        $('#kanji').on 'click', => 
            location.reload();
        
    else
        $(domEl).append(key)

    
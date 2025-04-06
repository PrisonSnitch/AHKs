#SingleInstance Force
SendMode Input
SetTitleMatchMode, 2

; --- Trash Talk Phrases ---
trashTalk := []
trashTalk.push("Back to the lobby!")
trashTalk.push("Uninstall bro!")
trashTalk.push("You good? Controller disconnected?")
trashTalk.push("Mouse and keyboard... still lost.")
trashTalk.push("EZ. Warm-up round?")
trashTalk.push("You’re not that guy, pal.")
trashTalk.push("I’ve seen bots put up more of a fight.")
trashTalk.push("Nice try! (Not really.)")
trashTalk.push("Outplayed, outgunned, outclassed.")
trashTalk.push("Outplayed and embarrassed.")
trashTalk.push("I blinked and you were gone.")
trashTalk.push("Respawn and rethink.")
trashTalk.push("Stick to Minecraft, homie.")
trashTalk.push("Check your connection—it’s not the lag.")
trashTalk.push("You peeked me? Bold move.")
trashTalk.push("Report me for being better.")
trashTalk.push("I didn’t know they still let bots play in this game.")
trashTalk.push("I’ve seen NPCs with more personality than you.")
trashTalk.push("Maybe you should uninstall. It’s not your game.")
trashTalk.push("Sorry, I don’t take 'L's' from randoms.")
trashTalk.push("You must be playing with one hand, huh?")
trashTalk.push("It’s cute how hard you’re trying.")
trashTalk.push("Did you forget to read the tutorial?")
trashTalk.push("If I had a dollar for every time you missed, I’d be richer than Bill Gates.")
trashTalk.push("What’s it like to live in my shadow?")
trashTalk.push("If you keep playing like this, you’ll make it into my highlight reel.")
trashTalk.push("You’re making it so easy, I might stop playing to get a snack.")
trashTalk.push("Is your controller broken, or are you just naturally bad?")
trashTalk.push("Nice try! But you should probably go back to playing Pong.")
trashTalk.push("Is that your ‘pro gamer’ move? Because it didn’t work.")
trashTalk.push("You should've brought a friend to help. Oh wait, you did.")
trashTalk.push("You really thought you could compete with me? LOL.")
trashTalk.push("Did you just spawn in, or have you been afk the whole time?")
trashTalk.push("That was cute, but I’ve seen better gameplay from a toddler.")
trashTalk.push("You’re like a speed bump in this game, just slowing me down.")
trashTalk.push("Is this your first time playing, or are you just pretending?")
trashTalk.push("You were a warm-up, good luck next time, you’ll need it. ")
trashTalk.push("You good? Just making sure... you’re not on a potato, right?")
trashTalk.push("Did you really think you could stop me?")
trashTalk.push("You had one job…")
trashTalk.push("Your KD ratio is about to need some serious help.")
trashTalk.push("You’re just content for my montage.")
trashTalk.push("Nice try, but I’m the one winning here.")


; --- Ctrl + F triggers the line ---
^f::
Random, randIndex, 1, % trashTalk.Length()
Send {Enter}
Sleep 100
SendRaw % trashTalk[randIndex]
Sleep 100
Send {Enter}
Return

; Exit the script with the Ctrl + Escape key
~^Esc::
    ExitApp
return

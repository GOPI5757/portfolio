var isgamestarted = false;
var order = [];
var colors = ['.g', '.r', '.y', '.b'];
var sounds = {'.g': './sounds/green.mp3',
'.r': './sounds/red.mp3',
'.y': './sounds/yellow.mp3',
'.b': './sounds/blue.mp3'};
var level = 1;
var numofbuttons = document.getElementsByClassName("btn").length;
var pause = true;
var click = 0;

function makesound(filelocation){
    var audio = new Audio(filelocation);
    audio.play()
}

function automatictrigger(){
    var rand = Math.floor(Math.random() * 4);
    document.querySelector(colors[rand]).classList.add("disturbed");
    setTimeout(function() {
        document.querySelector(colors[rand]).classList.remove("disturbed");
    }, 100);
    order.push(colors[rand]);
    makesound(sounds[colors[rand]]);
}

function gameover(){
    document.querySelector("h1").innerHTML = "Game Over, Press Any Key to Restart";
    makesound("./sounds/wrong.mp3");
    document.querySelector("body").style.backgroundColor = "red";
    setTimeout(function(){
        document.querySelector("body").style.backgroundColor = "#011F3F";
    }, 100);
    pause = true;
    isgamestarted = false;
    click = 0;
    level = 1;
    order = [];
}

for(var i = 0; i < numofbuttons; i++){
    document.getElementsByClassName("btn")[i].addEventListener("click", function(){
        this.classList.add("disturbed");
        var classname = this.classList[0];
        setTimeout(function(){
            document.querySelector("." + classname).classList.remove("disturbed");
        }, 200);
        makesound(sounds["." + classname]);
        if(!isgamestarted){
            gameover();
        }
        else if(isgamestarted){
            // alert(click);
            // alert(pause);
            if (!pause){
                gameover();
            }
            if (pause){
                if (click < level){
                    if (order[click] == "." + classname){
                        click++;
                    }
                    else{
                        gameover();
                    }
                }
                if (click == level){
                    pause = false;
                    setTimeout(function() {
                        if (isgamestarted){
                            level++;
                            document.querySelector("h1").innerHTML = "Level " + level; 
                            pause = true;
                            click = 0;
                            automatictrigger();
                        }
                    }, 1000);
                }
            }
        }
    });
}


document.addEventListener("keydown", function(event){
    if(!isgamestarted){
        isgamestarted = true;
        document.querySelector("h1").innerHTML = "Level " + level; 
        automatictrigger();
    }
});
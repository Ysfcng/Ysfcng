<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<style>
*{
margin:0px;
padding:0px;
box-sizing:border-box;
}
body{
display:flex;
align-content:center;
justify-content:center;
width:100%;
height:100vh;
overflow:hidden;
}
.outer{
width:360px;
height:590px;
background:red;
}


.rocket{
width:60px;
height:100px;
background:red;
position:absolute;
top:350px;
left:180px;
}

.top{
display:flex;
width:100%;
justify-content:center;
}
.top  img{
width:50px;
}
.rocket {
background:green;
}
.rocket img{
width:20px;
height:100px;
background:blue;
object-fit:cover;
}
.buttons{
width:100%;
height:60px;
display:flex;
justify-content:center;
align-items:center;
background:green;
position:fixed;
bottom:0px;
}
.buttons button{
width:80px;
height:100%;
background:gray;
}
[class^="danger"]{
width:50px;
height:50px;
overflow:hidden;
}
[class^="danger"] img{
width:50px;
}
</style>
</head>
<body>

<div class="outer">
<div class="top">
<template>
<div class="danger1">
<img src="./resim/asteroid.png"/>
</div>
<div class="danger2">
<img src="./resim/asteroid.png"/>
</div>
<div class="danger3">
<img src="./resim/asteroid.png"/>
</div>
<div class="danger4">
<img src="./resim/asteroid.png"/>
</div>
<div class="danger5">
<img src="./resim/asteroid.png"/>
</div>
<div class="danger6">
<img src="./resim/asteroid.png"/>
</div>
<div class="danger7">
<img src="./resim/asteroid.png"/>
</div>
</template>
</div>

<div class="rocket">
<img src="./resim/missile.jpeg"/>
</div>


<div class="buttons">
<button class="left" onclick="moveLeft()"><=</button>
<button class="stop" onclick="stop()">=</button>
<button class="right" onclick="moveRight()">=></button>
</div>
</div>



<script>
function moveLeft(){
let roket=document.querySelector(".rocket")
let left=roket.getBoundingClientRect().left
if(left>=20)
roket.style.left=left-20+"px"

}
function moveRight(){
let roket=document.querySelector(".rocket")
let left=roket.getBoundingClientRect().left
if(left<=window.innerWidth-20)
roket.style.left=left+20+"px"

}
let skor=0
function addDanger(){
let rand=Math.floor(Math.random()*6)
for(let i=0;i<rand;i++){
let moved=Math.floor(Math.random()*7)
let temp=document.querySelector("template").content.cloneNode(true)
let danger=temp.querySelector(".danger"+moved)
danger.style.position="absolute"
danger.style.left=moved*50+"px"
document.querySelector(".outer").appendChild(danger)

moveDanger(danger)
}

let reloaded=false;
function moveDanger(danger){

let rocket=document.querySelector(".rocket")

let move=setInterval(()=>{
let top=danger.getBoundingClientRect().top
let left=danger.getBoundingClientRect().left
let rocketLeft=rocket.getBoundingClientRect().left
if(top>=300&&top-300<=150){
if(left>=rocketLeft&&left-rocketLeft<=20&&!reloaded){
alert("oyun bitti")
window.location.reload()
reloaded=true
}
else if(rocketLeft>=left&&rocketLeft-left<=50&&!reloaded){
alert("oyun bitti skor: "+skor)
window.location.reload()
reloaded=true
}
}

danger.style.top=top+5+"px";
},50)
setTimeout(()=>{
clearInterval(move)
danger.remove()
skor+=1
},5000)

}
let stopped=false

function stop(){
if(stopped){
let game=setInterval(moveDanger,1000)
stopped=false
}
else{
clearInterval(game)
stopped=true
}
}
let game=setInterval(addDanger,1500)
</script>
</body>
</html>

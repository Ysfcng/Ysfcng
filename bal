<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<style>
@keyframes pop {
    0% { transform: scale(1); opacity: 1; }
    100% { transform: scale(1.5); opacity: 0; }
}

.cover {
    position: absolute;
    cursor: pointer;
}

.ballon {
    width: 100px;
    height: 130px; /* Daha uzun bir balon şekli */
    background: radial-gradient(circle at 30% 20%, #ff4d4d, #cc0000);
    border-radius: 50%;
    position: relative;
    box-shadow: inset -10px -10px 20px rgba(0, 0, 0, 0.3), 
                inset 10px 10px 20px rgba(255, 255, 255, 0.3),
                5px 5px 15px rgba(0, 0, 0, 0.4);
    transition: transform 0.2s ease-in-out;
}

.ballon:hover {
    transform: scale(1.1);
}

.ballon .light {
    width: 15px;
    height: 15px;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.8);
    position: absolute;
    top: 15%;
    left: 60%;
    box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.9);
}

.animate {
    animation: pop 0.5s forwards;
}
</style>
</head>
<body>

<script>
function createBalloon() {
    let cover = document.createElement("div");
    cover.className = "cover";

    let ballon = document.createElement("div");
    ballon.className = "ballon";

    let light = document.createElement("div");
    light.className = "light";
    ballon.appendChild(light);
    cover.appendChild(ballon);

    let balloonSize = Math.floor(Math.random() * 50 + 50); // 50px ile 100px arası boyut
    cover.style.width = balloonSize + "px";
    cover.style.height = (balloonSize * 1.3) + "px";

    let balloonLeft = Math.random() * (window.innerWidth - balloonSize);
    let balloonTop = Math.random() * (window.innerHeight - balloonSize);
    cover.style.left = balloonLeft + "px";
    cover.style.top = balloonTop + "px";

    cover.addEventListener("click", function () {
        ballon.classList.add("animate");
        setTimeout(() => cover.remove(), 500);
    });

    document.body.appendChild(cover);
}

setInterval(createBalloon, 800);
</script>

</body>
</html>

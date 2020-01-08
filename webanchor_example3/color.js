window.onload = RandomizeBodyColor;

function RandomizeBodyColor()
{
    r = Math.floor(Math.random() * 255);
    g = Math.floor(Math.random() * 255);
    b = Math.floor(Math.random() * 255);
    var bg = document.getElementById('bg')
    bg.style.backgroundColor = "RGBA(" + r + "," + g + "," + b + ")";
}
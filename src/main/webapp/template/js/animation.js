var refreshIntervalId;
var loadPage = document.getElementById("loading-page");

function createImg(totalImg, urlImg){
    const container = document.querySelector('.animation');
    for(i = 1; i < totalImg + 1; i++){
        const img = document.createElement('img');
        img.src = urlImg + i +".png";
        img.className="none";
        container.appendChild(img);
    }
}

function startAnimation(totalImg, urlImg){
    loadPage.style.display = "flex";
    const images = document.getElementById('an-box').children;
    var sum = images.length;
    if(sum == 0) createImg(totalImg, urlImg);
    var i = 0;
    refreshIntervalId = setInterval(function(){
        if(i > 0){
            images[i-1].className = "none";
        }else{
            images[totalImg-1].className = "none";
        }
        images[i++].className = "block";
        if(i == totalImg) i = 0;
    }, 110)
}

function stopAnimation(){
    loadPage.style.display = "none";
    if(refreshIntervalId != null) clearInterval(refreshIntervalId);
}
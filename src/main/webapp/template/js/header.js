let loginSection = document.getElementById('login-section');
let signupSection = document.getElementById('signup-section');

if(msgDto){
    if(msgDto.target == 'signup'){
        loginSection.classList.add('openform');
    }else{
        signupSection.classList.add('openform');
    }
    document.addEventListener('click', function hideForm(e){
        if(e.target.classList.contains('overlay')){
            e.target.classList.remove('openform');
            document.removeEventListener('click', hideForm);
        }
    });
}
let signupBtn = document.getElementById('signup-submit');
signupBtn.addEventListener('click', function(){
    registrationUserAccount();
});
async function registrationUserAccount(){
    startAnimation();
    let registerForm = signupSection.querySelector('form');
    var formData = new FormData(registerForm);
    let response = await fetch("/MovieWebsite/api/registration", {
        method : 'POST',
        body : JSON.stringify(Object.fromEntries(formData)),
        headers : {
            'Accept' : 'application/json',
            'Content-Type' : 'application/json'
        }
    });
    let message = await response.json();
    await setSignMessageBox(registerForm, message.type, message.content);
    if(message.type == 'info'){
        registerForm.style.display = "none";
        let tokenForm = document.getElementById('token-form');
        tokenForm.style.display = "block";
        tokenForm.querySelector('button').addEventListener('click', function(){
            tokenForm.style.display = "none";
            registerForm.style.display = "block";
        });
        document.addEventListener('keydown', async function(event) {
            if(event.keyCode == 13){
                startAnimation();
                let codeToken = tokenForm.querySelector('#code-token');
                let response = await fetch("/MovieWebsite/api/registrationConfirm?token=" + codeToken.value, {method : 'POST'});
                let message = await response.json();
                if(message.type.toLowerCase() === 'success'){
                    tokenForm.style.display = "none";
                    registerForm.style.display = "block";
                    signupSection.classList = "overlay";
                    loginSection.classList = "overlay openform";
                    await setSignMessageBox(loginSection.querySelector('form'), message.type, message.content);
                } else {
                    await setSignMessageBox(SignupSection.querySelector('form'), message.type, message.content);
                }
                stopAnimation();
            }
        });
    }
    stopAnimation();
}

async function handleLogin(){
    startAnimation();
    let loginForm = loginSection.querySelector('form');
    let formData = new FormData(loginForm);
    let response = await fetch("/MovieWebsite/api/handleLogin",{
        method : 'POST',
        body : JSON.stringify(Object.fromEntries(formData)),
        headers : {
            'Accept' : 'application/json',
            'Content-Type' : 'application/json'
        }
    });
    let data = await response.text();
    if(data.includes("/")){
        window.location.href = data;
    }
    let message = JSON.parse(data);
    setSignMessageBox(loginForm, message.type, message.content);
    stopAnimation();
}

function setSignMessageBox(afterTag, typeMsg, contentMsg){
    let signContent = afterTag.parentNode;
    let signMsg = signContent.querySelector('.alert');
    if(signMsg == null) {
        let msgBox = document.createElement('div');
        msgBox.classList = "alert alert-" + typeMsg;
        msgBox.style = "text-align: center !important;";
        msgBox.innerHTML = `<strong>`+ contentMsg +`</strong>`;
        signContent.insertBefore(msgBox, afterTag);
        return;
    }
    signMsg.classList = "alert alert-" + typeMsg;
    signMsg.innerHTML = `<strong>`+ contentMsg +`</strong>`;
}


function countLineItem(){
let cartBox = document.getElementById('cart-box');
let items = cartBox.querySelectorAll('ul li input[type=checkbox]:checked');
let subTotal = cartBox.querySelector('.checkout-section .sub-total')
subTotal.querySelector('h4').innerHTML
    = items.length + `<span> `+ ((items.length > 1) ? 'MOVIES' : 'MOVIE') + `</span>`;
let priceTotal = 0;
items.forEach(el =>{
    priceTotal += Number(el.dataset.price);
})
subTotal.querySelector('.total').textContent = "$" + priceTotal;
}

function cartHandle() {
let cartBox = document.getElementById('cart-box');
let cartWrap = cartBox.parentNode;
cartWrap.classList.add("openform");
refreshCart();
countLineItem();
document.addEventListener('click', function hideCart(e) {
    let target = e.target;
    if(target.classList.contains('overlay')){
        target.classList = "overlay";
        let records = [];
        let lineItems = cartBox.querySelectorAll('ul li');
        lineItems.forEach( el => {
            let checkbox = el.querySelector('input');
            let record = {
                "id" : checkbox.value,
                "title" : el.querySelector('.title').textContent,
                "thumbnail" : el.querySelector('img').src,
                "cost" : checkbox.dataset.price,
                "checked" : checkbox.checked
            }
            records.push(record);
        });
        sessionStorage.setItem("itemCart", JSON.stringify(records));
        document.removeEventListener('click', hideCart);
    }
})
}


function refreshCart(){
let itemCart = JSON.parse(sessionStorage.getItem('itemCart'));
if(itemCart === null) return;
let cart = document.getElementById('cart-box');
let container = cart.querySelector('.line-items');
container.innerHTML = ``;
for(let movie of itemCart){
    let item = document.createElement('li');
    item.innerHTML = `
        <span style="display: flex; align-items: center;">
            <input type="checkbox" `+ (movie.checked ? 'checked':'')  +` onchange="countLineItem();" data-price="`+ movie.cost +`" value="`+ movie.id +`" style="margin-right: 10px;">
            <img src="`+ movie.thumbnail +`" alt="">
        </span>
        <span class="title">`+ movie.title +`</span>
        <span>1</span>
        <span>$`+ movie.cost +`</span>
    `;
    container.appendChild(item);
}
}

async function checkoutHandle(){
startAnimation();
let cartBox = document.querySelector('#cart-box ul');
let itemsChecked = cartBox.querySelectorAll('li input[type=checkbox]:checked');
let tvSeasonIds = [];
itemsChecked.forEach(el => tvSeasonIds.push(Number(el.value)));
if(tvSeasonIds.length === 0) return;
await fetch("/MovieWebsite/api/user/payment-all", {
    method : 'PUT',
    body : JSON.stringify(tvSeasonIds),
    headers : {
        'Accept' : 'application/json',
        'Content-Type' : 'application/json'
    }
}).then(alert("successfully")).catch((err) => {alert(err)});
//       .then((response) => response.text())
//      .then((link) => {window.location.href = "/MovieWebsite/" + link})
//      .catch((err) => {alert(err)});
itemsChecked.forEach(el => {
    cartBox.removeChild(upToParent(el, 'li'))
});
countLineItem();
stopAnimation();
}

var tagSearch = document.getElementById('top-search');
tagSearch.querySelector('input').addEventListener('keydown', function(e){
if(e.key === 'Enter') searchMovieHandle();
});

async function searchMovieHandle(){
startAnimation();
let tagSearch = document.getElementById('top-search');
await fetch("/MovieWebsite/search/"+ tagSearch.querySelector('input').value + "?" + new URLSearchParams({
    "formMV" : tagSearch.querySelector('select').value
}), {method : 'POST'})
.then(response => {
    // HTTP 301 response
    // HOW CAN I FOLLOW THE HTTP REDIRECT RESPONSE?
    if (response.redirected) {
        console.log(response.url);
        window.location.href = response.url;
    }
})
.catch(function(err) {
    console.info(err + " url: " + url);
});
}

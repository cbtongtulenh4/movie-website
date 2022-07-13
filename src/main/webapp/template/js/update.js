function smallProfile(){
    const accInfo = document.getElementById('ic-account');
    let accMenu = accInfo.querySelector('.menu');
    if(accMenu.className === 'menu'){
        accMenu.classList.add('hide');
    }else {
        accMenu.classList = 'menu';
    }
}
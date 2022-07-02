// inaction change avatar
    var changeAvatar = $('.redbtn');
    var avatarCt = $('#cf-avatar-ct');
    var optionLoadAvatar = $('#upload-img');
    var uploadButton = document.getElementById('upload-button');
    var overlay = $(".overlay");

    changeAvatar.on('click', function(event){
        event.preventDefault();
        if(optionLoadAvatar.hasClass("hide")){
            optionLoadAvatar.removeClass("hide");
        }else {
            optionLoadAvatar.addClass("hide");
            setTimeout( function(){
                optionLoadAvatar.addClass("hide");
            }, 350);
        }
    });

    uploadButton.onchange = function(){
        optionLoadAvatar.addClass("hide");
        setTimeout( function(){
            optionLoadAvatar.addClass("hide");
        }, 350);
        avatarCt.parents(overlay).addClass("openform");
        $(document).on('click', function (e) {
            var target = e.target;
            if($(target).hasClass("overlay")){
                $(target).find(avatarCt).each(function(){
                    $(this).removeClass("openform");
                });
                setTimeout(function(){
                    $(target).removeClass("openform")
                }, 350);
            }
        })
        let reader = new FileReader();
        reader.readAsDataURL(uploadButton.files[0]);
        reader.onload = () => {
            avatarCt.find('img').attr('src', reader.result);
        }
    }

var boxCM = document.getElementById('comment-list');

if(comments != null){
    loadComments(boxCM, comments);
}

if(myUser != null){
    var cm_post_rp; // element contain box chat reply
    var bx_cm_ul; // box comment element ul for contain comment reply list
    var post = document.getElementById('post-mn-cm');
    var comment_list = document.getElementById('comment-list');

    async function postComment(postEl, parentId){
        var content_cm = postEl.querySelector('textarea').value;
        const object = {
            name : myUser.user.username,
            content : content_cm,
            pathImg : myUser.user.profile.avatar,
            ep : numEp
        };
        let data = await fetchAPI("/MovieWebsite/api/movie/season/comment?" + new URLSearchParams({
            tvSeasonId : tvSeasonId,
            parentId : parentId,
        }), object, "POST");
        var li = document.createElement('li');// li element for comment reply
        var textHTML = commentHTML(data);
        li.classList = "comment-main";
        li.innerHTML += textHTML;
        return li;
    }

    // this method execute comment parent id = 0;
    post.addEventListener('click', async function() {
        var postEl =  document.getElementById('content-post-cm');
        var li = await postComment(postEl, 0);
        comment_list.prepend(li); // insert first child into element
        // comment_list.insertBefore(li, comment_list.firstChild); - this is other way
    })

    function replyHandle(e) {
        var li = upToParent(e.target, 'li'); // get li element contain it
        bx_cm_ul = li.querySelector('.comment-list.reply-list');
        if (bx_cm_ul === null) {
            var ul = document.createElement('ul');
            ul.classList = "comment-list reply-list";
            li.append(ul);
            bx_cm_ul = ul;
        }
        cm_post_rp = document.createElement('div');
        cm_post_rp.classList = "post-comment";
        var text_post = `
            <img src="https://drive.google.com/uc?export=view&id=`+ myUser.user.profile.avatar +`" alt="">
            <div class="content-post" id="content-post-cm">
                <textarea name="" cols="30" rows="10">Enter something</textarea>
                <div class="cm-post-btn">
                    <button onClick="onPostReply(`+ li.value +`);">POST</button>
                </div>
            </div>
        `;
        cm_post_rp.innerHTML += text_post;
        bx_cm_ul.prepend(cm_post_rp);
    }

    // this method execute for child comment
    function onPostReply(parentId) {
        var li = postComment(cm_post_rp, parentId);
        cm_post_rp.remove();
        bx_cm_ul.prepend(li);
    }

}

function commentHTML(comment){
    return `
        <div class="comment-main-level">
            <img src="https://drive.google.com/uc?export=view&id=`+ comment.pathImg +`" alt="">
            <div class="comment-content">
                <div class="title-cm">
                    <h6>`+ comment.name +`</h6>
                    <span>- Ep `+ comment.ep +`</span>
                    <span>- `+ comment.timeAgo +`</span>
                </div>
                <b>`+ comment.content +`</b>
                <div class="tools">
                    <div class="attr-tool">
                        <i onclick="loadLike(event);" class="fa fa-thumbs-o-up" aria-hidden="true"></i>
                        <span>(like `+ comment.numLike +`)</span>
                    </div>
                    <span>.</span>
                    <div class="attr-tool" id="spam-tool">
                        <i class="fa fa-flag-o" aria-hidden="true"></i>
                        <span>(ban 10)</span>
                    </div>
                    <span>.</span>
                    <div class="attr-tool">
                        <i onclick="replyHandle(event);" class="fa fa-reply" aria-hidden="true"></i>
                        <span>(Reply)</span>
                    </div>
                </div>
            </div>
        </div>
    `;
}

function loadComments(boxCM, comments) {
    let text="";
    for (const comment of comments) {
        text += `
            <li class="comment-main" value="`+ comment.parentId +`">
        ` + commentHTML(comment);
        text = inputReply(text, comment.commentDtos);
        text += `</li>`;
    }
    boxCM.innerHTML += text;
}

function inputReply(text ,childCM) {
    if(childCM.length != 0){
        text += `<ul class="comment-list reply-list">`;
        for (const c of childCM) {
            text += `
                <li class="comment-main" value="`+ c.parentId +`">
            ` + commentHTML(c);
            text = inputReply(text, c.commentDtos);
            text += `</li>`;
        }
        text += `</ul>`;
    }
    return text;
}

async function fetchAPI(url, object, method) {
    const response = await fetch(url,{
        method : method,
        body : JSON.stringify(object),
        headers : {
            'Accept': 'application/json',
            'Content-Type' : 'application/json'
        }
    });
    var data = await response.json();
    return data;
}



////    setting comment tools

var liked = "fa fa-thumbs-up";
var unlike = "fa fa-thumbs-o-up";
var spam = "fa fa-flag";
var unSpam = "fa fa-flag-o";

	async function loadLike(e){
	    const likeEl = upToParent(e.target, 'div');
	    const likeClick = e.target;
        const response = await fetch("/MovieWebsite/api/movie/season/comment/num-like?" + new URLSearchParams({
            isLike : true,
            commentId : upToParent(likeEl, 'li').value
        }), {method : 'PUT'});
        loadCommentTools(likeClick, liked, unlike);
        var data = await response.json();
        likeEl.querySelector('span').innerHTML = `(like `+ data +`)`;
	}


//	const spamTarget = document.getElementById('spam-tool');
//	spamTarget.addEventListener('click', async function(){
//		loadCommentTools(spamTarget, "spam", spam, unSpam);
//	});


	function loadCommentTools(target, c1, c2) {
		if(target.className === c1){
			target.className = c2;
			return false;
		}else{
			target.className = c1;
		}
		return true;
	}



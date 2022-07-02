
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



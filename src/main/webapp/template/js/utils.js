 // util -----------------------------------------------------
// find first ancestor of el with tagName
	function upToParent(el, tagName) {
		tagName = tagName.toLowerCase();
		while(el && el.parentNode){
			el = el.parentNode;
			if (el.tagName && el.tagName.toLowerCase() === tagName) {
				return el;
			}
		}
		return null;
	}


	function getCookie(name){
	    let value = `; ${document.cookie}`;
	    let parts = value.split(`; ${name}=`);
	    if(parts.length === 2) return parts.pop().split(';').shift();
	}

// end util ---------------------------------------------------

// pagination custom----------------------------------------------

	function customPagination(urlTarget, currentPage, visiblePage, maxPage, hasFilter){
		let boundLower = document.getElementById('lower-bound');
		if (maxPage == 0){
			boundLower.style.display = 'none';
			return;
		}
		boundLower.style.display = 'flex';
//		if(currentPage < 1) currentPage = 1;
//		else if(currentPage > maxPage) currentPage = maxPage;
		var endPage = visiblePage;
		var startPage = 1;
		document.getElementById('page-info').innerHTML = "Page " + currentPage + " of <span class='maxPage'>" + maxPage + "</span>: ";
		let pagination = document.getElementById('pagination');
		pagination.innerHTML = '<div id="pages"></div>';
		let pages = document.getElementById('pages');
		var temp = currentPage / endPage;
		if(temp > 1){ // check position currentPage?
			var temp1 = currentPage % endPage;
			startPage = currentPage - ((temp1 == 0) ? endPage : temp1) + 1; // assign value startPage by currentPage
			if (maxPage - startPage < endPage) { // check exist endPage
				endPage = maxPage;
			}else{
				endPage += startPage - 1;
			}
			pagination.prepend(newElement('a', "next-left","ion-arrow-left-b"));// add icon next left
			nextSubmit(urlTarget, "next-left", startPage, endPage, hasFilter);
		}else if(endPage > maxPage){
			endPage = maxPage;
		}
		if(endPage < maxPage){ // check add icon next right
			pagination.appendChild(newElement('a', "next-right", "ion-arrow-right-b"));
			nextSubmit(urlTarget, "next-right", startPage, endPage, hasFilter);
		}

		for (let i = startPage; i <= endPage; i++) {
			let page = document.createElement('a');
			if(currentPage == i){
				page.classList = 'active';
			}
			page.textContent = i;
			page.addEventListener('click', function(){
				nextPage = i;
				var maxPageItem = document.getElementById('max-page-item').value;
				getAPI(urlTarget , nextPage, maxPageItem, hasFilter);
			});
			pages.appendChild(page);
		}
	}
	function newElement(tagName, id, className) { // create icon next
		let element = document.createElement(tagName);
		let icon = document.createElement('i');
		icon.className = className;
		element.setAttribute("id", id);
		element.appendChild(icon);
		return element;
	}
//	    startAnimation();
	function nextSubmit(urlTarget, id, startPage, endPage, hasFilter) {
		let next = document.getElementById(id);
		next.addEventListener('click', function(){
			var nextPage = (id === "next-left") ? (startPage - 1) : (endPage + 1);
			var maxPageItem = document.getElementById('max-page-item').value;
			getAPI(urlTarget , nextPage, maxPageItem, hasFilter);
		})
	}


    async function getAPI(url, nextPage, maxPageItem, hasFilter) {
    	startAnimation();
        let params;
        if(hasFilter){
            let requestForm = document.forms.formSubmit;
            var formData = new FormData(requestForm);
            let genresData = document.getElementById('genres-sl').selectedOptions;
             params = new URLSearchParams({
                nextPage: nextPage,
                maxPageItem: maxPageItem,
                title: formData.get('title'),
                rating: formData.get('rate'),
                genres: Array.from(genresData).map(({value}) => value),
                yearFrom : formData.get('yearFrom'),
                yearFrom : formData.get('yearTo')
            });
        }else {
            params = new URLSearchParams({
                nextPage: nextPage,
                maxPageItem: maxPageItem
            });
        }
        // sortBy
        let fieldSort = document.getElementById('field-sort');
        params.append("sort", fieldSort.value);
        const response = await fetch(url + "?" + params);
        var data = await response.json();
        showListMovie(url, data, hasFilter);
    }

    function showListMovie(urlTarget, data, hasFilter){
        var updating = (updatingMsg === undefined) ? "updating ..." : updatingMsg;
        var pagination = data.pagination;

        let tvSeasonBox = document.getElementById('tv-season-list');
        tvSeasonBox.innerHTML = getTvSeasonHTML(tvSeasonBox.dataset.target, data);

        document.getElementById('am-movies-tt').innerHTML = pagination.maxItems;

        customPagination(urlTarget, pagination.nextPage, pagination.maxPageItem, pagination.maxPage, hasFilter);
        stopAnimation();
    }

    function getTvSeasonHTML(target, data){
        let tvSeasonHTML = '';
        var host = "/MovieWebsite";
        if(target === 'list') {
            for(let SEASON of data.simpleTvSeasons){
                tvSeasonHTML += `
                       <div class="movie-item-style-2">
                           <img src="`+ SEASON.thumbnail +`" alt="">
                           <div class="mv-item-infor">
                               <h6><a href="`+ host +`/` + SEASON.code + `">` + ((SEASON.title != null) ?  SEASON.title : updating)+ `<span> (`+ SEASON.year +`)</span></a></h6>
                               <p class="rate"><i class="ion-android-star"></i><span>`+ SEASON.rate +`</span> /10</p>
                               <p class="describe">`+ SEASON.summary +`</p>
                               <p class="run-time"> Run Time: <span>`+ ((SEASON.runtime != null) ? SEASON.runtime : '2h21’')+`</span>    .     <span>MMPA: PG-13 </span>    .     <span>Release: `+ SEASON.release +`</span></p>
                               <p><span>Languages: `+ SEASON.languages +`</span></p>
                               <p>Duration: <a href="#">`+ ((SEASON.duration != null) ?  SEASON.duration : updating) +`</a></p>
                               <p>Views: <span>`+ ((SEASON.views != null) ? SEASON.views : updating) +`</span></p>
                           </div>
                       </div>
                   `;
            }
        }
        else {
            for(let SEASON of data.simpleTvSeasons){
                tvSeasonHTML += `
                       <div class="movie-item-style-2 movie-item-style-1">
                           <img src="`+ SEASON.thumbnail +`" alt="">
                           <div class="hvr-inner">
                               <a  href="`+ host +`/` + SEASON.code + `"> Read more <i class="ion-android-arrow-dropright"></i> </a>
                           </div>
                           <div class="mv-item-infor">
                               <h6><a href="`+ host +`/` + SEASON.code + `">` + ((SEASON.title != null) ?  SEASON.title : updating)+ `</a></h6>
                               <p class="rate"><i class="ion-android-star"></i><span>`+ SEASON.rate +`</span> /10</p>
                           </div>
                       </div>
                   `;
            }
        }
        return tvSeasonHTML;
    }


    async function tvSeasonViewHandle(e, urlTarget, hasFilter){
        let targetEl = e.target;
        if(targetEl.tagName !== 'a'){
            targetEl = upToParent(targetEl, 'a');
        }
        targetEl.parentNode.querySelectorAll('a').forEach(el => {
            el.querySelector('i').classList.remove('active');
        });
        targetEl.querySelector('i').classList.add('active');
        document.getElementById('tv-season-list').dataset.target = targetEl.className;
        if(targetEl.className === "grid"){
            document.getElementById('max-page-item').value = 10;
            await getAPI(urlTarget, 1, 10, hasFilter);
        }
        else await getAPI(urlTarget, 1, 2, hasFilter);    
    }


    async function findByPage(e, urlTarget, hasFilter){
		if(e.key === 'Enter'){
            let maxPageItem = document.getElementById('max-page-item').value;
            let nextPage = e.target.value;
            let maxPage = Number(document.querySelector('#page-info .maxPage').textContent);
            if(nextPage < 1) nextPage = 1;
            else if(nextPage > maxPage) nextPage = maxPage;
            await getAPI(urlTarget, nextPage, maxPageItem, hasFilter);
            stopAnimation();
		}
	}
	function selectOptionPage(urlTarget, maxPageItem, hasFilter){
	    getAPI(urlTarget, '1', maxPageItem, hasFilter);
	}

	function selectOptionFieldSort(urlTarget, hasFilter){
	    var maxPageItem = document.getElementById('max-page-item').value;
        getAPI(urlTarget, '1', maxPageItem, hasFilter);
    }

// end pagination custom -----------------------------------------------------------


// start comment section --------------------------------------------

// end comment section ----------------------------------------------




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
// end util ---------------------------------------------------

// pagination custom----------------------------------------------

	function customPagination(currentPage, visiblePage, maxPage){
		let boundLower = document.getElementById('lower-bound');
		if (maxPage == 0){
			boundLower.style.display = 'none';
			return;
		}
		boundLower.style.display = 'flex';
		var endPage = visiblePage;
		var startPage = 1;
		document.getElementById('page-info').innerHTML = "Page " + currentPage + " of " + maxPage + ": ";
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
			nextSubmit("next-left", startPage, endPage);
		}else if(endPage > maxPage){
			endPage = maxPage;
		}
		if(endPage < maxPage){ // check add icon next right
			pagination.appendChild(newElement('a', "next-right", "ion-arrow-right-b"));
			nextSubmit("next-right", startPage, endPage);
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
				getAPI("/MovieWebsite/api/movie/season/filter", nextPage, maxPageItem);
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
	function nextSubmit(id, startPage, endPage) {

		let next = document.getElementById(id);
		next.addEventListener('click', function(){
			var nextPage = (id === "next-left") ? (startPage - 1) : (endPage + 1);
			var maxPageItem = document.getElementById('max-page-item').value;
			getAPI("/MovieWebsite/api/movie/season/filter", nextPage, maxPageItem);
		})
	}



// end pagination custom -----------------------------------------------------------

// start comment section --------------------------------------------

// end comment section ----------------------------------------------




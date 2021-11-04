<div class="page-num desktop">
<% if $PaginatedPages.MoreThanOnePage %>
	<% if $PaginatedPages.PrevLink %>
	<a class="prev" href="$PaginatedPages.PrevLink"><div class="left-arrow page-arrow"><img src="$ThemeDir/images/rarrow.png" alt=""></div></a>
	<% end_if %>
	<% loop $PaginatedPages.Pages %>
		<% if $CurrentBool %>
			<div class="current numbers"><a >$PageNum</a></div>
		<% else %>
			<% if $Link %>
				<div class="numbers"><a >$PageNum</a></div>
			<% else %>
			    ...
			<% end_if %>
		<% end_if %>
	<% end_loop %>
	<% if $PaginatedPages.NextLink %>
	<a class="next" href="$PaginatedPages.NextLink "><div class="right-arrow page-arrow"><img src="$ThemeDir/images/rarrow.png" alt=""></div></a>
	<% end_if %>
	<%-- <p class="page-total">Page $PaginatedPages.CurrentPage of $PaginatedPages.TotalPages</p> --%>
<% end_if %>
</div>
<div class="page-num mobile">
	<% if $MobilePaginatedPages.MoreThanOnePage %>
	<% if $MobilePaginatedPages.PrevLink %>
	<a class="prev" href="$MobilePaginatedPages.PrevLink"><div class="left-arrow page-arrow"><img src="$ThemeDir/images/rarrow.png" alt=""></div></a>
	<% end_if %>
	<%-- <a class="prev" <% if $MobilePaginatedPages.PrevLink %>href="$MobilePaginatedPages.PrevLink"<% end_if %>><i class="fa fa-angle-left"></i></a> --%>
	<% loop $MobilePaginatedPages.Pages %>
		<% if $CurrentBool %>
			<div class="current numbers"><a >$PageNum</a></div>
		<% else %>
			<% if $Link %>
				<div class="numbers"><a >$PageNum</a></div>
			<% else %>
			    ...
			<% end_if %>
		<% end_if %>
	<% end_loop %>
	<% if $MobilePaginatedPages.NextLink %>
	<a class="next" href="$MobilePaginatedPages.NextLink "><div class="right-arrow page-arrow"><img src="$ThemeDir/images/rarrow.png" alt=""></div></a>
	<% end_if %>
	<%-- <p class="page-total">Page $MobilePaginatedPages.CurrentPage of $MobilePaginatedPages.TotalPages</p> --%>
<% end_if %>
</div>

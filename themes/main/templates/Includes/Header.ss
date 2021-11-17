<% if ClassName != 'Page' %>
<header id="header" class="scroll">
	<div class="header-wrapper">
		<div class="logo-cntnr">
			<a href="$AbsoluteBaseURL"><img class="logo" src="$ThemeDir/images/logo.svg" alt=""></a>
		</div
		><div class="hdr-menu">
			<div class="hdr-menu__link">
				<a href="#about">About</a>
			</div>
			<div class="hdr-menu__link">
				<a href="#experience">Experience</a>
			</div>
			<div class="hdr-menu__link">
				<a href="#work">Work</a>
			</div>
			<div class="hdr-menu__link">
				<a href="#contact">Contact</a>
			</div>
			<div class="resume-btn btn">
				<% loop $headerFooter %>
				<a href="$Resume.URL" target="__blank">
					<button>
						Resume
					</button>
				</a>
				<% end_loop %>
			</div>
		</div
		><div class="mobile-menu">
			<div id="nav-icon">
				<span></span>
				<span></span>
				<span></span>
			</div>
		</div>
	</div>
</header>
<div class="menu-nav">
	<div class="menu-nav__wrapper inlineBlock-parent">
		<div class="transparent"></div
		><div class="menu-hldr">
			<div class="menu-links">
				<a href="<% if $HomePage %><% else %>$AbsoluteBaseURL<% end_if %>#about">About</a>
			</div>
			<div class="menu-links">
				<a href="<% if $HomePage %><% else %>$AbsoluteBaseURL<% end_if %>#work">Work</a>
			</div>
			<div class="menu-links">
				<a href="<% if $HomePage %><% else %>$AbsoluteBaseURL<% end_if %>#experience">Experience</a>
			</div>
			<div class="menu-links">
				<a href="<% if $HomePage %><% else %>$AbsoluteBaseURL<% end_if %>#contact">Contact</a>
			</div>
			<div class="menu-links btn">
				<% loop $headerFooter %>
				<a href="$Resume.URL" target="__blank">
					<button>
						Resume
					</button>
				</a>
				<% end_loop %>
			</div>
		</div>
	</div>
</div>
<% end_if %>
<% include Loader %>
<div id="about" class="hm-frame1">
	<div class="frm-cntnr">
		<div class="vertical-parent">
			<div class="vertical-align">
				<div class="hm-frame1__content">
					<div class="hm-frame1__content-header f1animate">
						<h5 class="clr--primary font-2">$F1Header</h5>
					</div>
					<div class="hm-frame1__content-name f1animate">
						<h1>$F1Name</h1>
					</div>
					<div class="hm-frame1__content-sub f1animate">
						<h1 class="clr--lightgray">$F1Sub</h1>
					</div>
					<div class="hm-frame1__content-desc f1animate">
						$F1Desc
					</div>
					<div class="hm-frame1__content-btn btn f1animate">
						<a href="$F1BtnLink">
							<button>
								$F1BtnText
							</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<section class="hm-frame2">
	<div class="frm-cntnr">
		<div class="numbered-heading animate-up">
			<h3>$F2Title</h3>
		</div>
		<div class="inlineBlock-parent">
			<div class="left-hldr align-t animate-up">
				$F2Desc
			</div
			><div class="right-hldr align-t">
				<div class="img-hldr animate-left">
					<div class="line-border"></div>
					<img src="$F2IMG.URL" alt="">
					<div class="overlay"></div>
				</div>
			</div>
		</div>
	</div>
</section>

<section id="experience" class="hm-frame3">
	<div class="frm-cntnr">
		<div class="numbered-heading animate-up">
			<h3>$F3Title</h3>
		</div>
		<div class="inlineBlock-parent inner">
			<div class="hm-frame3__menu-container align-t">
				<% loop $Experiences.sort(SortOrder, ASC) %>
				
				<div class="hm-frame3__menu-link animate-up">
					<a value="#tab$ID">$Company</a>
				</div>
				<% end_loop %>
			</div
			><div class="hm-frame3__content-hldr align-t">
				<% loop $Experiences.sort(SortOrder, ASC) %>
				
				<div class="hm-frame3__content-tab" id="tab$ID">
					<div class="inlineBlock-parent">
						<div class="position animate-up">
							<h4>$Position</h4>
						</div
						><div class="at">
							<h4 class="clr--primary">@</h4>
						</div
						><div class="company animate-up">
							<h4 class="clr--primary">$Company</h4>
						</div>
					</div>
					<div class="date animate-up">
						<p class="font-2">$Date</p>
					</div>
					<div class="content animate-up">
						$Desc
					</div>
				</div>
				<% end_loop %>
			</div>
		</div>
	</div>
</section>

<section id="work" class="hm-frame4">
	<div class="frm-cntnr">
		<div class="numbered-heading animate-up">
			<h3>$F4Title</h3>
		</div>
		<div class="featured-container">
			<% loop $FeaturedProjects.sort(Date, Desc) %>
			<div class="featured-item odd">
				<div class="featured-content">
					<div class="featured-content__header animate-up">
						<h5 class="clr--primary font-2">Featured Project</h5>
					</div>
					<div class="featured-content__title animate-up">
						<h3>$ProjectTitle</h3>
					</div>
					<div class="featured-content__card">
						<div class="featured-content__card-wrapper animate-up">
							<p>$ProjectDesc</p>
						</div>
					</div>
					<div class="featured-content__tech inlineBlock-parent animate-up">
						<p>$Tech</p>
					</div>
					<div class="featured-content__link animate-up">
						<a href="$ProjectLink" target="__blank">
							<% include linksvg %>
						</a>
					</div>
				</div
				><div class="featured-item__img animate-up">
					<a href="$ProjectLink" target="__blank">
						<div class="featured-item__img-wrapper">
							<img src="$Image.URL" alt="">
							<div class="overlay"></div>
						</div>
					</a>
				</div>
			</div>
			<% end_loop %>
		</div>
	</div>
</section>
<section class="hm-frame5">
	<div class="frm-cntnr">
		<div class="hm-frame5__header align-c animate-up">
			<h3>Other Noteworthy Projects</h3>
		</div>
		<div class="hm-frame5__sub align-c">
			<a href="archive">
				<h5 class="clr--primary font-2 animate-up">
					View Archives
				</h5>
			</a>
		</div>

		<div class="hm-frame5__card-container">
			<div class="card-hldr">
				<% loop $ArchivePage %>
				<% loop $Projects.sort(SortOrder, DESC) %>
				<% if Featured %>
				<% else %>
				<div class="hm-frame5__card animate-up">
					<div class="hm-frame5__card-wrapper">
						<div class="header-top animate-up">
							<div class="folder">
								<img src="$ThemeDir/images/folder.svg" alt="">
							</div>
							<div class="link">
								<a href="$ProjectLink" target="__blank">
									<% include linksvg %>
								</a>
							</div>
						</div>
						<div class="card-title animate-up">
							<h3>$ProjectTitle</h3>
						</div>
						<div class="card-desc animate-up">
							<p>$ProjectDesc</p>
						</div>
						<div class="ftr-tech animate-up">
							<p>$Tech</p>
						</div>
					</div>
				</div>
				<% end_if %>
				<% end_loop %>
				<% end_loop %>
			</div>
			<div class="hm-frame5__btn btn align-c animate-up">
				<button id="loadMore">
					Show More
				</button>
			</div>
		</div>
	</div>
</section>

<section id="contact" class="hm-frame6">
	<div class="frm-cntnr align-c">
		<div class="numbered-heading animate-up">
			<h4>$F5Title</h4>
		</div>
		<div class="hm-frame6__title animate-up">
			<h1>$F5Header</h1>
		</div>
		<div class="hm-frame6__desc animate-up">
			<p>$F5Desc</p>
		</div>
		<div class="hm-frame6__btn btn animate-up">
			<a href="mailto:$Email" target="__blank">
				<button>
					Say Hello
				</button>
			</a>
		</div>
	</div>
</section>
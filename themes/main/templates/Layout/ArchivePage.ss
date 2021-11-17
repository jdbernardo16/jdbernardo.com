<section class="archive">
	<div class="frm-cntnr">
		<div class="page-title animate-up">
			<h1>$Title</h1>
		</div>
		<div class="page-desc">
			<h5 class="clr--primary font-2 animate-up">$F1Desc</h5>
		</div>
		<div class="page-table">
			<table>
				<thead class="animate-up">
					<tr>
						<th>Year</th>
						<th>Title</th>
						<th>Made at</th>
						<th>Built With</th>
						<th>Link</th>
					</tr>
				</thead>
				<tbody>
					<% loop $Projects.sort(SortOrder, DESC) %>
					<tr class="animate-up">
						<td>$Date</td>
						<td>$ProjectTitle</td>
						<td>$Company</td>
						<td>$Tech</td>
						<td><a href="$ProjectLink" title=""><% include linksvg %></a></td>
					</tr>
					<% end_loop %>
				</tbody>
			</table>
		</div>
	</div>
</section>
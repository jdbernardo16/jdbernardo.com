<form class="frm-form__holder" id="contactForm"  method="post">
	<div class="frm-form__holder-row">
		<div class="frm-form__col">	
			<div class="frm-form__row">
				<label>Full Name</label>
				<input type="text" name="fullname" class="frm-form__input" placeholder="" required="">
			</div>
			<div class="frm-form__row">
				<label>Contact Number</label>
				<input type="text" name="mobile" class="frm-form__input" placeholder="" required="" onkeydown="return ( event.ctrlKey || event.altKey 
					|| (47<event.keyCode && event.keyCode<58 && event.shiftKey==false) 
					|| (95<event.keyCode && event.keyCode<106)
					|| (event.keyCode==8) || (event.keyCode==9) 
					|| (event.keyCode>34 && event.keyCode<40) 
					|| (event.keyCode==46) )">
			</div>
			<div class="frm-form__row">
				<label>E-mail Address</label>
				<input type="email" name="email" class="frm-form__input" placeholder="" required="">
			</div>
		</div>
		<div class="frm-form__col">	
			<div class="frm-form__row">
				<label>Subject</label>
				<input type="text" name="subject" class="frm-form__input" placeholder="" required="">
			</div>
			<div class="frm-form__row">
				<label>Message</label>
				<textarea name="messagedetails" class="frm-form__input textarea" placeholder=""></textarea>
			</div>
		</div>
	</div>

	<div class="recaptcha-hldr m-margin-b">
		<div class="g-recaptcha" data-sitekey="6Lcx2focAAAAAM0qSPkObCGmOcDQ6CSyYN75v_jF"></div>
	</div>

	<div class="btn-hldr align-c" id="contactBtn">
		<a href="#"><button class="btn align-c"><span>Send us</span></button></a>
	</div>

	<input type="hidden" name="postFlag" value="1">
</form>
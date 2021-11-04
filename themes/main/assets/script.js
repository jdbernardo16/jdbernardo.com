webpackJsonp([1],{

/***/ 40:
/***/ (function(module, exports, __webpack_require__) {

/* WEBPACK VAR INJECTION */(function($) {$(document).ready(function () {
	app.init();
});

var app = {

	init: function () {
		var setup = this.setup;

		switch (pageID) {
			case 'HomePage':
				setup.homepage();
				break;
		}

		setup.menu();
	},

	setup: {

		menu: function () {

			$(window).on("scroll", function () {
				if ($(window).scrollTop() > 100) {
					$('#header').addClass('scroll');
				} else {
					$('#header').removeClass('scroll');
				}
			});
		},

		homepage: function () {
			/*header hide*/

			var timedelay = 1;

			function delayCheck() {
				if (timedelay == 5) {
					$('#header').css('transform', 'translateY(-150%)');
					timedelay = 1;
				}
				timedelay = timedelay + 1;
			}

			$(document).mousemove(function () {
				$('#header').css('transform', 'translateY(0%)');
				timedelay = 1;
				clearInterval(_delay);
				_delay = setInterval(delayCheck, 500);
			});
			// page loads starts delay timer
			_delay = setInterval(delayCheck, 500);

			//tabbing

			$('.hm-frame3__menu-link:first-child').addClass('active');
			$('.hm-frame3__content-tab').hide();
			$('.hm-frame3__content-tab:first').show();
			$('.hm-frame3__menu-link').click(function () {
				$('.hm-frame3__menu-link').removeClass('active');
				$(this).addClass('active');
				$('.hm-frame3__content-tab').fadeOut();
				var content = $(this).find('a').attr('value');
				$(content).delay(500).fadeIn(500);
				return false;
			});
		}

	},

	accordion: {
		/**
  * ACCORDION: Slide down & up effect
  * - To take effect, must identify the button, holder/container, and element
  * - Add data-attribute to the button w/c is: data-collapse-id
  * - To execute (sample): app.accordion.init($('.faq__question'), 'faq__qa', 'faq__answer');
  **/
		init: function (button, elemHolder, hiddenElem) {
			var btn = button,
			    holder = elemHolder,
			    hidden_element = hiddenElem;

			btn.on('click', function () {
				var id = $(this).data('accordion-id');
				if ($('#' + id).hasClass('is-active')) {
					$('#' + id + ' .' + hidden_element).slideUp(300);
					$('.' + holder).removeClass('is-active');
				} else {
					$('.' + holder).removeClass('is-active');
					$('.' + holder + ' .' + hidden_element).slideUp(300);

					$('#' + id).addClass('is-active');
					$('#' + id + ' .' + hidden_element).slideToggle(300);
				}
			});
		}
	},

	form: {
		/**
  * SENDING FORM
  * - Identify the form name, button name, the url (controller route), and if you want to 'refresh' the page.	
  **/
		init: function (formName, btnName, routeVal, boolean) {
			var form = formName,
			    btn = btnName,
			    route = routeVal,
			    bool = boolean;

			form.validate({
				submitHandler: function (form) {
					swal({
						title: 'Sending ...',
						timer: 2000,
						onOpen: function () {
							swal.showLoading();
						}
					}).then(() => {
						var vars = $(form).serialize();
						$.post(baseHref + route, vars, function (data) {
							switch (data.status) {
								case 0:
									setMessage(false, data.message);
									break;
								case 1:
									setMessage(true, data.message);
									break;
							}
						}, 'json');
					});
				}
			});

			$(btn).on('click', function (e) {
				e.preventDefault();
				form.submit();

				//label error -- for mobile
				if ($(window).width() < 900) {
					$('label.error').empty();
					$('label.error').text("*");
				}
			});

			function setMessage(status, msg) {
				if (status) {
					swal('', msg, 'success').then(function () {
						window.location.reload(1);
					});
				} else {
					swal('', msg, 'error');
				}
			}
		},

		/**
  * SENDING FORM W/ ATTACHMENTS
  * - Bind the uploaded file first, before sending.
  * - Identify where the file should be uploaded, button name, and the url (controller route).	
  * - Requirements: 
  			Javascript:
  				  jquery.fileupload.js
  				  jquery.iframe-transport.js
  				  jquery.ui.widget.js
  			Composer:
  				  "gargron/fileupload": "~1.4.0"
  			Silverstripe:
  				   Controller: Create UploadController
  				   ModelAdmin: Create an admin manager for back up purposes (list of emails received)
  				   Assets: Create folder inside, depends on what you declared
  				   Template Syntax: 
  				   		<label id="file-selected-permit" for="fileupload-permit" class="custom-file-upload">Business/Mayor Permit <i class="ion-paperclip"></i></label>
  						<input type="file" id="fileupload-permit" name="file" style="display: none;">
  						<input type="hidden" id="file-image-permit" name="permit" value="">
  	**/
		bindUploadField: function (fileUpload, fileImg, fileSelected, formBtn, url) {
			var $file_upload = fileUpload,
			    $file_img = fileImg,
			    $file_selected = fileSelected,
			    $form_btn = formBtn,
			    $url = url;

			$file_upload.fileupload({
				url: baseHref + $url,
				dataType: 'json',
				submit: function (e, data) {},
				done: function (e, data) {
					switch (data.result.status) {
						case 0:
							break;
						case 1:

							$file_img.val(data.result.message);
							$file_selected.html(data.result.filename);
							$form_btn.fadeIn();

							break;
					}
				}
			});
		}
	}
};
/* WEBPACK VAR INJECTION */}.call(exports, __webpack_require__(1)))

/***/ })

},[40]);
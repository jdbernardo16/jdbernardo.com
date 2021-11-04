<?php

namespace {
	use SilverStripe\CMS\Model\SiteTree;

	class Stylesheet extends Page {

		private static $defaults = array(
			'PageName' => 'Stylesheet',
			'MenuTitle' => 'Stylesheet',
			'ShowInMenus' => false,
			'ShowInSearch' => false,
		);

		public function getCMSFields() {
			$fields = parent::getCMSFields();

			/*
			* Remove by tab
			*/
			$fields->removeFieldFromTab('Root.Main', 'Content');

			return $fields;
		}
	}

	class StylesheetController extends PageController {

	}
}

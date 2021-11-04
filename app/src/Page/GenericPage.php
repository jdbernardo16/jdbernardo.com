<?php

namespace {
	use SilverStripe\CMS\Model\SiteTree;

	use SilverStripe\Forms\TabSet;
	use SilverStripe\Forms\Tab;
	use SilverStripe\Forms\TextField;
	use SilverStripe\Forms\TextareaField;
	use SilverStripe\Forms\CheckboxField;
	use SilverStripe\Forms\DateField;
	use SilverStripe\Forms\ReadonlyField;
	use SilverStripe\Forms\DropdownField;
	use SilverStripe\Forms\HTMLEditor\HTMLEditorField;

	use SilverStripe\Forms\GridField\GridField;
	use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
	use UndefinedOffset\SortableGridField\Forms\GridFieldSortableRows;
	use Bummzack\SortableFile\Forms\SortableUploadField;

	use SilverStripe\AssetAdmin\Forms\UploadField;
	use SilverStripe\Assets\Image;
	use SilverStripe\Assets\File;

	use SilverStripe\ORM\PaginatedList;
	use SilverStripe\ORM\DataObject;
	use SilverStripe\ORM\ArrayList;
	use SilverStripe\ORM\GroupedList;

	use SilverStripe\View\Requirements;
	use SilverStripe\View\ArrayData;

	use SilverStripe\Control\HTTPRequest;

	class GenericPage extends Page {

		private static $db = [
			'GenTitle' => 'Text',
			'GenDesc' => 'HTMLText',
		];

		private static $has_one = [

		];

		private static $owns = [
	
		];

		private static $allowed_children = "none";

		private static $defaults = array(
			'PageName' => 'Generic Page',
			'MenuTitle' => 'Generic',
			'ShowInMenus' => false,
			'ShowInSearch' => false,
		);

		public function getCMSFields() {
			$fields = parent::getCMSFields();

			#Remove by tab
			$fields->removeFieldFromTab('Root.Main', 'Content');

			$fields->addFieldToTab('Root.Frame1', new TabSet('Frame1Sets',
				new Tab('Text',
					TextField::create('GenTitle', 'Title'),
					HTMLEditorField::create('GenDesc', 'Content')
				)
			));

			return $fields;
		}
	}

	class GenericPageController extends PageController {
		
	}
}

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

	class ArchivePage extends Page {

		private static $db = [
			'F1Desc' => 'Text',
		];

		private static $has_one = [

		];

		private static $owns = [
	
		];

		private static $has_many = [
	    	'Projects' => Project::class,
	    ];

		private static $allowed_children = "none";

		private static $defaults = array(
			'PageName' => 'Archive Page',
			'MenuTitle' => 'Archive',
			'ShowInMenus' => false,
			'ShowInSearch' => false,
		);

		public function getCMSFields() {
			$fields = parent::getCMSFields();

			#Remove by tab
			$fields->removeFieldFromTab('Root.Main', 'Content');

			/*
			|-----------------------------------------------
			| @Frame1
			|----------------------------------------------- */
			$fields->addFieldsToTab('Root.Frame1.Main', array(
				new TextField('F1Desc', 'Description'),
			));

			/*
            * Archive
            */
            $fields->addFieldToTab('Root.Project.Projects', new TabSet('Projects',
                new Tab('Projects',
                    GridField::create(
                        'Projects',
                        'Project',
                        $this->Projects(),
                        GridFieldConfig_RecordEditor::create(10)
                        ->addComponent(new GridFieldSortableRows('SortOrder'))
                    )
                )
            ));


			return $fields;
		}
	}

	class ArchivePageController extends PageController {
		
	}
}

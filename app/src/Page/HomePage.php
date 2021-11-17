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

	class HomePage extends Page {

		private static $db = [
			//Frame1
			'F1Header' => 'Text',
			'F1Name' => 'Text',
			'F1Sub' => 'Text',
			'F1Desc' => 'HTMLText',
			'F1BtnText' => 'Text',
			'F1BtnLink' => 'Text',

			//Frame2
			'F2Title' => 'Text',
			'F2Desc' => 'HTMLText',

			//Frame3
			'F3Title' => 'Text',

			//Frame4
			'F4Title' => 'Text',

			//Frame5
			'F5Title' => 'Text',
			'F5Header' => 'Text',
			'F5Desc' => 'Text',
			'Email' => 'Text',
		];

		private static $has_one = [
			'F2IMG' => Image::class,
		];

		private static $owns = [
			'F2IMG',
	    ];

	    private static $has_many = [
	    	'Experiences' => Experience::class,
	    ];

		private static $allowed_children = "none";

		private static $defaults = array(
			'PageName' => 'Home Page',
			'MenuTitle' => 'Home',
			'ShowInMenus' => true,
			'ShowInSearch' => true,
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
				new TextField('F1Header', 'Header'),
				new TextField('F1Name', 'Name'),
				new TextField('F1Sub', 'Sub Text'),
				new HTMLEditorField('F1Desc', 'Description'),
			));

			$fields->addFieldsToTab('Root.Frame1.Button', array(
				new TextField('F1BtnText', 'Button Text'),
				new TextField('F1BtnLink', 'Button Link'),
			));

			/*
			|-----------------------------------------------
			| @Frame2
			|----------------------------------------------- */
			$fields->addFieldsToTab('Root.Frame2.Main', array(
				new TextField('F2Title', 'Title'),
				new HTMLEditorField('F2Desc', 'Description'),
				$upload = UploadField::create('F2IMG','Image'),
			));

			# SET FIELD DESCRIPTION 
			$upload->setDescription('Max file size: 2MB | Dimension: 300px x 300px');
			# Set destination path for the uploaded images.
			$upload->setFolderName('homepage');

			/*
			|-----------------------------------------------
			| @Frame3
			|----------------------------------------------- */
			$fields->addFieldsToTab('Root.Frame3.Main', array(
				new TextField('F3Title', 'Title'),
			));

			/*
            * Experiences
            */
            $fields->addFieldToTab('Root.Frame3.Experiences', new TabSet('Experiences',
                new Tab('Experiences',
                    GridField::create(
                        'Experiences',
                        'Experience',
                        $this->Experiences(),
                        GridFieldConfig_RecordEditor::create(10)
                        ->addComponent(new GridFieldSortableRows('SortOrder'))
                    )
                )
            ));

            /*
			|-----------------------------------------------
			| @Frame4
			|----------------------------------------------- */
			$fields->addFieldsToTab('Root.Frame4.Main', array(
				new TextField('F4Title', 'Title'),
			));

			/*
			|-----------------------------------------------
			| @Frame5
			|----------------------------------------------- */
			$fields->addFieldsToTab('Root.Frame5.Main', array(
				new TextField('F5Title', 'Title'),
				new TextField('F5Header', 'Header'),
				new TextareaField('F5Desc', 'Description'),
				new TextField('Email', 'Email'),
			));



			# SET FIELD DESCRIPTION 
			// $uploadf->setDescription('Max file size: 2MB | Dimension: 1366px x 768px');
			
			# Set destination path for the uploaded images.
			// $uploadf->setFolderName('homepage/frame-1');

			return $fields;
		}
	}

	class HomePageController extends PageController {
		public function FeaturedProjects() {
			return Project::get()
				->filter(array (
				'Featured' => true
				));
		}
	}
}

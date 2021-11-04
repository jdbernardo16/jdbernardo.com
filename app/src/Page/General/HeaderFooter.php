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

    use TractorCow\Colorpicker\Color;
    use TractorCow\Colorpicker\Forms\ColorField;

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

	class HeaderFooter extends Page {

		private static $db = [

			// SEO
            'SeoKeywords' => 'Text',
            'SeoDescription' => 'Text',

            // Twitter
            'TwitterUser' => 'Text',

            // Windows
            'MsBgColor' => Color::class,

		];

		private static $has_one = [

			'HeaderLogo' => Image::class,
            'Favicon' => Image::class,
            'MsLogoSq' => Image::class,
            'MsLogoWd' => Image::class,

		];

		private static $has_many = [
            'SocialMedias' => SocialMedia::class,
        ];

        private static $owns = [
            'HeaderLogo',
            'Favicon',
            'MsLogoSq',
            'MsLogoWd',
        ];

		private static $defaults = array(
			'PageName' => 'Header & Footer',
			'MenuTitle' => 'Header & Footer',
			'ShowInMenus' => false,
			'ShowInSearch' => false,
		);

		public function getCMSFields() {
			$fields = parent::getCMSFields();

			/*
            * Meta Tags
            */
            $fields->addFieldToTab('Root.Meta tags', new TabSet('MetaTagsSets',
                new Tab('SEO',
                    $desc = TextareaField::create('SeoKeywords', 'SEO Keywords'),
                    TextareaField::create('SeoDescription', 'Site Description')
                ),
                new Tab('Twitter',
                    $desc2 = TextField::create('TwitterUser', 'Twitter Username')
                ),
                new Tab('Microsoft',
                    ColorField::create('MsBgColor', 'Tile Color'),
                    $uploadms1 = UploadField::create('MsLogoSq','Square Logo'),
                    $uploadms2 = UploadField::create('MsLogoWd','Wide Logo')
                ),
                new Tab('Favicon',
                    $upload = UploadField::create('Favicon','Favicon'),
                )
            ));

            /*
            * Header
            */
            $fields->addFieldToTab('Root.Header', new TabSet('HeaderSets',
                new Tab('Content',
                    $upload1 = UploadField::create('HeaderLogo','Logo')
                )
            ));

            /*
            * Social Media
            */
            $fields->addFieldToTab('Root.Social Media', new TabSet('SocialMediaSets',
                new Tab('Social Media',
                    GridField::create(
                        'SocialMedias',
                        'Social Medias',
                        $this->SocialMedias(),
                        GridFieldConfig_RecordEditor::create(10)
                        ->addComponent(new GridFieldSortableRows('SortOrder'))
                    )
                )
            ));

			#Description
            $desc->setDescription('Separate each descriptions with comma (,)');
            $desc2->setDescription('@Username');
            $upload->setDescription('Max file size: 2MB | Use png format');
            $upload1->setDescription('Max file size: 2MB');
            $uploadms1->setDescription('Max file size: 2MB | Dimension: 310px x 310px');
            $uploadms2->setDescription('Max file size: 2MB | Dimension: 310px x 150px');

            # Set destination path for the uploaded images.
            $upload->setFolderName('headerfooter/');
            $upload1->setFolderName('headerfooter/');
            $uploadms1->setFolderName('headerfooter/');
            $uploadms2->setFolderName('headerfooter/');
			
			/*
			* Remove by tab
			*/
			$fields->removeFieldFromTab('Root.Main', 'Content');

			return $fields;
		}
	}

	class HeaderFooterController extends PageController {

	}
}

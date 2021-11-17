<?php

namespace {
    use SilverStripe\CMS\Model\SiteTree;
    use SilverStripe\ORM\DataObject;
    use SilverStripe\Assets\Image;
    use SilverStripe\Assets\File;
    use SilverStripe\Forms\FieldList;
    use SilverStripe\Forms\LabelField;
    use SilverStripe\Forms\TextField;
    use SilverStripe\Forms\TextareaField;
    use SilverStripe\Forms\ReadonlyField;
    use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
    use SilverStripe\AssetAdmin\Forms\UploadField;
    use SilverStripe\Versioned\Versioned;
    use SilverStripe\Control\Controller;

    class Experience extends DataObject {

        private static $db = [
            'SortOrder' => 'Int',
            'Company' => 'Text',
            'Position' => 'Text',
            'Date' => 'Text',
            'Desc' => 'HTMLText',
        ];

        private static $has_one = [
            'HomePage' => 'HomePage',
        ];

        private static $owns = [
        ];

       

        private static $summary_fields = [
            'SortOrder' => 'Sort Order',
            'Company' => 'Company',
            'Position' => 'Position',
            'Date' => 'Date',
        ];

        public function getCMSFields() {
            $fields = parent::getCMSFields();
            $fields->addFieldToTab('Root.Main', ReadonlyField::create('SortOrder', 'Sort Order'));
            $fields->addFieldToTab('Root.Main', new TextField('Company', 'Company'));
            $fields->addFieldToTab('Root.Main', new TextField('Position', 'Position'));
            $fields->addFieldToTab('Root.Main', new TextField('Date', 'Date'));
            $fields->addFieldToTab('Root.Main', new HTMLEditorField('Desc', 'Description'));

            $fields->removeByName('SortOrder');
            $fields->removeByName('HomePageID');
            // $fields->removeByName('AboutPageID');

            return $fields;
        }
    }
}

<?php

namespace {
    use SilverStripe\CMS\Model\SiteTree;
    use SilverStripe\ORM\DataObject;
    use SilverStripe\Assets\Image;
    use SilverStripe\Assets\File;
    use SilverStripe\Forms\FieldList;
    use SilverStripe\Forms\LabelField;
    use SilverStripe\Forms\TextField;
    use SilverStripe\Forms\CheckboxField;
    use SilverStripe\Forms\TextareaField;
    use SilverStripe\Forms\ReadonlyField;
    use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
    use SilverStripe\AssetAdmin\Forms\UploadField;
    use SilverStripe\Versioned\Versioned;
    use SilverStripe\Control\Controller;

    class Project extends DataObject {

        private static $db = [
            'SortOrder' => 'Int',
            'ProjectTitle' => 'Text',
            'ProjectDesc' => 'Text',
            'Company' => 'Text',
            'Tech' => 'Text',
            'Date' => 'Text',
            'ProjectLink' => 'Text',
            'Featured' => 'Boolean',
        ];

        private static $has_one = [
            'Image' => Image::class,
            'ArchivePage' => 'ArchivePage',
        ];

        private static $owns = [
            'Image',
        ];

        public function getThumbnail() {
           if ($this->Image()->exists()) { 
               return $this->Image()->ScaleWidth(100); 
           } else { 
               return '(No Image)'; 
           }
        }

       

        private static $summary_fields = [
            'SortOrder' => 'Sort Order',
            'Thumbnail' => 'Thumbnail',
            'ProjectTitle' => 'Project Title',
            'Date' => 'Date',
            'Tech' => 'Built With',

        ];

        public function getCMSFields() {
            $fields = parent::getCMSFields();
            $fields->addFieldToTab('Root.Main', ReadonlyField::create('SortOrder', 'Sort Order'));
            $fields->addFieldToTab('Root.Main', new TextField('ProjectTitle', 'Project Title'));
            $fields->addFieldToTab('Root.Main', new TextareaField('ProjectDesc', 'Project Description'));
            $fields->addFieldToTab('Root.Main', new TextField('Company', 'Company'));
            $fields->addFieldToTab('Root.Main', new TextField('Date', 'Date'));
            $fields->addFieldToTab('Root.Main', new TextField('Tech', 'Built With'));
            $fields->addFieldToTab('Root.Main', new TextField('ProjectLink', 'Project Link'));

            $fields->removeByName('SortOrder');
            $fields->removeByName('ArchiveID');
            // $fields->removeByName('AboutPageID');

            $fields->addFieldToTab('Root.Featured', new CheckboxField('Featured', 'Featured Project'));

            return $fields;
        }
    }
}

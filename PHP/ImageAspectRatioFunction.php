<?php
namespace B1scuit/HandyScripts;

class Image {
    private $image;
    private $exifData;

    public $aspectRatio;

    public function __construct($imageUrl = null){
        if($imageUrl) {
            return $this->loadImage($imageUrl);
        }
    }

    public function loadImage($image = null){

        if($image && is_string($image)) {
            $this->image = $image;

            $this->getExifData();
            $this->getAspectRatio();

            return true;
        }

        return false;
    }

    public function getAspectRatio() {
        
        $width = $this->exifData['COMPUTED']['Width'];
        $height = $this->exifData['COMPUTED']['Height'];
        $gcd = function($width, $height) use (&$gcd) {
            return ($width % $height) ? $gcd($height, $width % $height) : $height;
        };

        $g = $gcd($width, $height);

        return $width/$g . ':' . $height/$g;
    }

    public function getImageType(){
        return exif_imagetype($this->image);
    }

    public function getExifData(){
        if($this->exifData = exif_read_data($this->image)) {
            return true;
        } else {
            return false;
        }
    }

    public function checkAspectRatio($ratio) {
        return ($this->aspectRatio == $ratio ? true : false);
    }

    // Magic methods
    public function __toString(){
        return $this->image;
    }

    public function __debugInfo(){
        return [
            'image' => $this->image,
            'exifData' => $this->exifData,
            'aspectRatio' => $this->aspectRatio
        ];
    }

    public function __set($name, $value) {
        $this->{$name} = $value;
    }

    public function __get($name){
        return $name;
    }

    public function __isset($name) {
        return false;
    }

    public function __unset($name) {
        return true;
    }

    public function __call($name, $argv) {
        return $this->callMethod($name, $argv);
    }

    public function __callStatic($name, $argv) {
        return $this->callMethod($name, $argv);
    }

    public function callMethod($name, $argv) {

        if(substr( $name, 0, 8 ) === "checkType") {
            return $this->checkType( (str_replace($name, '', 'checkType')) );
        }

        return true;
    }

}

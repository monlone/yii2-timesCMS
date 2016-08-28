<?php
namespace common\studylee; 
  
use Yii;  
use yii\base\Model;  
use yii\base\Event;  
/**
* Property
*/
class Property extends yii\base\Object
{
	private $_title;                 // 第二步：声明一个私有成员变量

	function __construct()
	{
		// $this->_title = 'my title';
	}

    public function getTitle()       // 第三步：提供getter和setter
    {
        return $this->_title;
    }

    public function setTitle($value)
    {
        $this->_title = trim($value);
    }
}
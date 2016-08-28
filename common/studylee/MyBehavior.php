<?php
namespace common\studylee; 
  
use Yii;  
use yii\base\Model;  
use yii\base\Event;

class MyBehavior extends yii\base\Behavior
{
    // 行为的一个属性
    public $property = 'This is property in MyBehavior.';    
    public $user;

    public function beforeAction($action, $result)
    {
        echo "string";
        $this->myMethod();
        return parent::beforeAction($action, $result);
    }
    // 行为的一个方法
    public function myMethod()
    {
    	echo $this->user;
        return 'Method in MyBehavior is called.';
    }
}
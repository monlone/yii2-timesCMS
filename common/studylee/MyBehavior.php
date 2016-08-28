<?php
namespace common\studylee; 
  
use Yii;  
use yii\base\Model;  
use yii\base\Event;
use yii\rest\Controller;

class MyBehavior extends yii\base\Behavior
{
    // 行为的一个属性
    public $property = 'This is property in MyBehavior....';    
    public $user;
    const PHP_WEB_EOL = "<br>";

    public function beforeAction($action, $result)
    {
        echo "string";
        $this->myMethod();
        return parent::beforeAction($action, $result);
    }

    public function events()
    {
        return [
            Controller::EVENT_BEFORE_ACTION => "handlerBeforeAction",
            Controller::EVENT_AFTER_ACTION => "handlerAfterAction"
        ];
    }

    /**
     * event handler
     * @param \yii\base\Event $event
     */
    public function handlerBeforeAction(Event $event)
    {
        echo __METHOD__ . self::PHP_WEB_EOL;
        echo '由行为注册的组件事件，传递的$event->sender属性为此组件对象' . self::PHP_WEB_EOL;
        echo "组件的控制器和动作：" . $event->sender->uniqueId . '/' . $event->sender->action->id . self::PHP_WEB_EOL;
        echo self::PHP_WEB_EOL;
    }

    /**
     * event handler
     * @param \yii\base\Event $event
     */
    public function handlerAfterAction(Event $event)
    {
        echo self::PHP_WEB_EOL;
        echo __METHOD__ . self::PHP_WEB_EOL;
        echo '由行为注册的组件事件，传递的$event->sender属性为此组件对象' . self::PHP_WEB_EOL;
        echo "组件的控制器和动作：" . $event->sender->uniqueId . '/' . $event->sender->action->id . self::PHP_WEB_EOL;
    }

    // 行为的一个方法
    public function myMethod()
    {
    	echo $this->user;
        return 'Method in MyBehavior is called.';
    }
}
<?php  
namespace frontend\controllers;
  
use Yii;  
use yii\web\Controller;
  

use common\components\log\MessageEvent;
use common\components\log\LogWrite;
  
class StudyController extends Controller
{  
     
   # 定义Event的名字 再配置文件中配置好可以写log。就可以在runtime里面看到log的东西了。
    const EVENT_HELLO = 'my hello';
      
    public function actionIndex()
    {          
        #定义传递数据的格式 Event  
        $event = new MessageEvent;
        # 赋值  
        $event->message = 'this is a test event message. aLogWrite.';
        # 绑定事件Event  这个事件对应的是： LogWrite->hello($event);  
        $this->on(self::EVENT_HELLO, [new LogWrite(), 'hello']);
        # 触发事件 ，$event 这个对象传递到  LogWrite->hello($event);
        $this->trigger(self::EVENT_HELLO,$event);
    }
}
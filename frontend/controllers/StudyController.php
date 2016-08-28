<?php  
namespace frontend\controllers;
  
use Yii;  
use yii\web\Controller;
use yii\base\Event;
use common\components\log\MessageEvent;
use common\studylee\Property;
use common\studylee\MyBehavior;
use common\studylee\MyClass;
use common\studylee\DoSomething;
use common\components\log\LogWrite;
  
class StudyController extends Controller
{  
    # 定义Event的名字 再配置文件中配置好可以写log。就可以在runtime里面看到log的东西了。
    # 对于事件的定义，提倡使用const 常量的形式，可以避免写错。 trigger('Hello') 和 trigger('hello') 可是不同的事件哦。原因在于handler数组下标，就是事件名。 而PHP里数组下标是区分大小写的。所以，用类常量的方式，可以避免这种头疼的问题。
    const EVENT_INFO = 'log info';
    const EVENT_APP = 'app event';
    
    //事件的绑定
    public function actionEvent()
    {
        #定义传递数据的格式 Event 
        #这样子可以在触发事情时传递参数，比如在触发时才能有的参数（发围脖的时间）
        $event = new MessageEvent;
        # 赋值  
        $event->message = 'this is a test event message.';
        # 绑定事件Event  这个事件对应的是： LogWrite->info($event);  
        $this->on(self::EVENT_INFO, [new LogWrite(), 'info']);
        # 触发事件 ，$event 这个对象传递到  LogWrite->info($event);
        $this->trigger(self::EVENT_INFO, $event);

        # pass a parameter to event
        $this->on(self::EVENT_INFO, [new LogWrite(), 'getValue'], 'to parameter into event.');
        $this->trigger(self::EVENT_INFO, $event);

        #全局事件一个最大优势在于：在任意需要的时候，都可以触发全局事件，也可以在任意必要的时候绑定，或解除一个事件
        Yii::$app->on(self::EVENT_APP, [new LogWrite(), 'app']);
        Yii::$app->trigger(self::EVENT_APP);
        
        Event::on(
            Property::className(),                     // 第一个参数表示事件发生的类
            'EVENT_OFF_DUTY',                  // 第二个参数表示是什么事件
            function ($event) {                      // 对事件的处理，也可以是匿名函数
                echo $event->sender . ' 下班了';
            }
        );
        // $event->sender = 'lee';
        Event::trigger(Property::className(), 'EVENT_OFF_DUTY');
    }

    //属性的设置
    public function actionProperty()
    {
        $property = new Property;
        #由于PHP对于类方法不区分大小写，即大小写不敏感， $post->getTitle() 和 $post->gettitle() 是调用相同的函数。 因此， $post->title 和 $post->Title 是同一个属性。即属性名也是不区分大小写的。
        echo $property->settitle('this is test set title...');
        echo isset($property->title);      
        unset($property->title);
        echo isset($property->title);
        echo $property->getTitle();

        return true;
    }

    //行为的使用
    public function actionBehavior()
    {
        $myClass = new MyClass();
        $myBehavior = new MyBehavior();

        // Step 3: 将行为绑定到类上
        $myClass->attachBehavior('myBehaviorName', $myBehavior);

        // Step 4: 访问行为中的属性和方法，就和访问类自身的属性和方法一样
        echo $myClass->property;
        echo $myClass->myMethod();
    }

    public function behaviors()
    {
        return [
            // 'testBehavior' => [
            //                 'class' => MyBehavior::className(),
            //                 'user' => 'niubi',
            //             ],
            [
                'class' => MyBehavior::className(),
                'user' => 'niubi',
            ],
        ];
    }
}
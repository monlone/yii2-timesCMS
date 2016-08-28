<?php
namespace common\components\log; 
  
use Yii;
  
/**  
 * ContactForm is the model behind the contact form.  
 */  
class LogWrite
{
    public function info($event){
        Yii::info($event->message,'my-event-log'); //my-event-log对应于[info]下的indexmy-event-log
    }

    public function getValue($event)
    {
    	echo $event->data;
    }

    public function app($event)
    {
    	echo "this is the APP event.";
    }

    public function onDuty($event)
    {
        echo $event->sender . ' 下班了';
    }
}
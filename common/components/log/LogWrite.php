<?php
namespace common\components\log; 
  
use Yii;
  
/**  
 * ContactForm is the model behind the contact form.  
 */  
class LogWrite
{
    public function hello($event){  
        Yii::info($event->message,'my-event-log'); //my-event-log对应于[info]下的indexmy-event-log
    }
}
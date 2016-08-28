<?php
namespace common\components\log; 
  
use Yii;  
use yii\base\Model;  
use yii\base\Event;  
/**  
 * ContactForm is the model behind the contact form.  
 */  
class MessageEvent extends Event  
{  
    public $message;  
}


<?php
namespace frontend\controllers;

use Yii;
use frontend\models\ContactForm;
use yii\web\Controller;

/**
 * Site controller
 */
class LeeController extends Controller
{
	public function actionIndex()
	{
		$this->sendMail('912963166@qq.com', 'fdfd', 'pppp');
	}
	public function sendMail($to, $subject, $content)
    {
        $config = '{"class": "Swift_SmtpTransport","host": "smtp.exmail.qq.com","username": "myscrm18@mysoft.com.cn","password": "1Qaz7410","port": "465","encryption": "ssl","adminEmail": {"myscrm18@mysoft.com.cn":"明源云社区"},"template": "success"}';
        $config = json_decode($config);

        $mailer = \Yii::$app->mailer;
        $transpport = [
            'class' => $config->class,
            'host' => $config->host,
            'username' => $config->username,
            'password' => $config->password,
            'port' => $config->port,
            'encryption' => $config->encryption,
        ];

        $mailer->setTransport($transpport);

        // return $mailer->compose(['html' => 'report'], ['model' => ['subject' => $subject, 'content' => $content]])
        //     ->setFrom($config->adminEmail)
        //     ->setTo($to)
        //     ->setSubject($subject)
        //     ->send();

        return $mailer->compose()
            ->setFrom(['myscrm18@mysoft.com.cn'])
            ->setTo($to)
            ->setSubject($subject)
            ->setTextBody($content)
            ->send();
    }
}
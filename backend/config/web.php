<?php
$config = [
    // 'id' => 'app-backend',
    'bootstrap' => [
        'admin', // required add by lish
    ],
    'homeUrl'=>Yii::getAlias('@backendUrl'),
    'controllerNamespace' => 'backend\controllers',
    'defaultRoute'=>'timeline-event/index',
    'controllerMap'=>[
        'file-manager-elfinder' => [
            'class' => 'mihaildev\elfinder\Controller',
            'access' => ['manager'],
            'disabledCommands' => ['netmount'],
            'roots' => [
                [
                    'baseUrl' => '@storageUrl',
                    'basePath' => '@storage',
                    'path'   => '/',
                    'access' => ['read' => 'manager', 'write' => 'manager']
                ]
            ]
        ]
    ],
    'components'=>[
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'request' => [
            'baseUrl' => '/admin', //单域名的要加上，多域名要去掉
            'cookieValidationKey' => env('BACKEND_COOKIE_VALIDATION_KEY')
        ],
        'user' => [
            'class'=>'yii\web\User',
            'identityClass' => 'common\models\User',
            'loginUrl'=>['sign-in/login'],
            'enableAutoLogin' => true,
            'as afterLogin' => 'common\behaviors\LoginTimestampBehavior'
        ],
        'authManager' => [
            'class' => 'yii\rbac\DbManager', // or use 'yii\rbac\PhpManager'
        ],
    ],
    'modules'=>[
        
        'admin' => [	//this admin index add by lish
            'class' => 'mdm\admin\Module',
	    'layout' => '@backend/views/mdmsoft/layouts/left-menu', // it can be '@path/to/your/layout'.
            'userClassName' => 'common\models\User',
            'idField' => 'id',  //这个是就是Yii::$app->user->id
            'controllerMap' => [
                'assignment' => [
                    'class' => 'mdm\admin\controllers\AssignmentController',
                ],
                // 'other' => [
                //     'class' => 'path\to\OtherController', // add another controller
                // ],
            ],
            // 'menus' => [
            //     'assignment' => [
            //         'label' => 'Grand Access' // change label
            //     ],
            //     'route' => null, // disable menu route 
            // ],
        ],
	'i18n' => [
            'class' => 'backend\modules\i18n\Module',
            'defaultRoute'=>'i18n-message/index'
        ],
    ],
    // 'as globalAccess'=>[
    //     'class'=>'\common\behaviors\GlobalAccessBehavior',
    //     'rules'=>[
    //         [
    //             'controllers'=>['sign-in'],
    //             'allow' => true,
    //             'roles' => ['?'],
    //             'actions'=>['login']
    //         ],
    //         [
    //             'controllers'=>['sign-in'],
    //             'allow' => true,
    //             'roles' => ['@'],
    //             'actions'=>['logout']
    //         ],
    //         [
    //             'controllers'=>['site'],
    //             'allow' => true,
    //             'roles' => ['?', '@'],
    //             'actions'=>['error']
    //         ],
    //         [
    //             'controllers'=>['debug/default'],
    //             'allow' => true,
    //             'roles' => ['?'],
    //         ],
    //         [
    //             'controllers'=>['user'],
    //             'allow' => true,
    //             'roles' => ['administrator'],
    //         ],
    //         [
    //             'controllers'=>['user'],
    //             'allow' => false,
    //         ],
    //         [
    //             'allow' => true,
    //             'roles' => ['manager'],
    //         ]
    //     ]
    // ],
    'as access' => [	//this index add by lish
        'class' => 'mdm\admin\classes\AccessControl',
        'allowActions' => [
            'site/*',
            'admin/*',
            'some-controller/some-action',
            'page/index',
            '*',
            // The actions listed here will be allowed to everyone including guests.
            // So, 'admin/*' should not appear here in the production, of course.
            // But in the earlier stages of your development, you may probably want to
            // add a lot of actions here until you finally completed setting up rbac,
            // otherwise you may not even take a first step.
        ]
    ],
];

if (YII_ENV_DEV) {
    $config['modules']['gii'] = [
        'class'=>'yii\gii\Module',
        'generators' => [
            'crud' => [
                'class'=>'yii\gii\generators\crud\Generator',
                'templates'=>[
                    'yii2-starter-kit' => Yii::getAlias('@backend/views/_gii/templates')
                ],
                'template' => 'yii2-starter-kit',
                'messageCategory' => 'backend'
            ]
        ]
    ];
}

return $config;
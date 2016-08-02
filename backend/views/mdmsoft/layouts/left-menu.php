<?php

use yii\helpers\Html;
use mdm\admin\classes\MenuHelper;
use yii\bootstrap\Nav;


/* @var $this \yii\web\View */
/* @var $content string */

$controller = $this->context;
// https://github.com/mdmsoft/yii2-admin/blob/3.master/docs/guide/using-menu.md
$menus = MenuHelper::getAssignedMenu(Yii::$app->user->id);
$route = $controller->route;
foreach ($menus as $i => $menu) {
    $menus[$i]['active'] = strpos($route, trim($menu['url'][0], '/')) === 0;
}
$this->params['nav-items'] = $menus;
?>

<?php $this->beginContent('@backend/views/layouts/common.php'); ?>
<div class="row">    
    <div class="col-sm-12">
        <?= $content ?>
    </div>
</div>
<?php
list(, $url) = Yii::$app->assetManager->publish('@backend/views/mdmsoft/assets');
$this->registerCssFile($url . '/list-item.css');
?>

<?php $this->endContent(); ?>

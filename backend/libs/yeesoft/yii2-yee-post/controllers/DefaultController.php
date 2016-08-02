<?php

namespace yeesoft\post\controllers;

use yeesoft\controllers\admin\BaseController;
use yeesoft\models\User;

/**
 * PostController implements the CRUD actions for Post model.
 */
class DefaultController extends BaseController
{
    public $modelClass = 'yeesoft\post\models\Post';
    public $modelSearchClass = 'yeesoft\post\models\search\PostSearch';

    protected function getRedirectPage($action, $model = null)
    {
        if (!User::hasPermission('editPosts') && $action == 'create') {
            return ['view', 'id' => $model->id];
        }

        switch ($action) {
            case 'update':
                return ['update', 'id' => $model->id];
                break;
            case 'create':
                return ['update', 'id' => $model->id];
                break;
            default:
                return parent::getRedirectPage($action, $model);
        }
    }
}
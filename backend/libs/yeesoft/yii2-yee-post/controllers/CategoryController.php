<?php

namespace yeesoft\post\controllers;

use yeesoft\controllers\admin\BaseController;

/**
 * CategoryController implements the CRUD actions for yeesoft\post\models\Category model.
 */
class CategoryController extends BaseController
{
    public $modelClass = 'yeesoft\post\models\Category';
    public $modelSearchClass = 'yeesoft\post\models\search\CategorySearch';
    public $disabledActions = ['view', 'bulk-activate', 'bulk-deactivate'];

    protected function getRedirectPage($action, $model = null)
    {
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
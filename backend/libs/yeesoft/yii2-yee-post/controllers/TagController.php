<?php

namespace yeesoft\post\controllers;

use yeesoft\controllers\admin\BaseController;

/**
 * TagController implements the CRUD actions for yeesoft\post\models\Tag model.
 */
class TagController extends BaseController
{
    public $modelClass = 'yeesoft\post\models\Tag';
    public $modelSearchClass = 'yeesoft\post\models\search\TagSearch';
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
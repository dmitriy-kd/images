<?php

/* @var $this yii\web\View */
use yii\helpers\Url;

$this->title = 'My Yii Application';
?>
<div class="site-index">

    <div class="jumbotron">
        <h1>Панель администратора</h1>
    </div>

    <div class="body-content">

        <div class="row">
            <div class="col-lg-4">
                <h2>Жалобы</h2>

                <p>Работа с жалобами</p>

                <p><a class="btn btn-default" href="<?php echo Url::to(['/complaints/manage']); ?>">Открыть жалобы</a></p>
            </div>
            <div class="col-lg-4">
                <h2>Пользователи</h2>

                <p>Работа с пользователями</p>

                <p><a class="btn btn-default" href="<?php echo Url::to(['/user/manage']); ?>">Открыть пользователей</a></p>
            </div>
            <div class="col-lg-4">
                <h2>Heading</h2>

                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                    dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                    ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                    fugiat nulla pariatur.</p>

                <p><a class="btn btn-default" href="http://www.yiiframework.com/extensions/">Yii Extensions &raquo;</a></p>
            </div>
        </div>
        <?php
            echo '<pre>';
            var_dump(Yii::$app->user->can('viewUsersList'));
            echo '</pre>'; 
        ?>

    </div>
</div>

<?php 
	
	/* @var $this yii\web\View */
	/* @var $post frontend\models\Post */
	/* @var $model frontend\modules\post\models\Comments*/
	/* @var $comments frontend\modules\post\models\Comments */
	use yii\helpers\Html;
	use yii\web\JqueryAsset;
	use yii\widgets\ActiveForm;
	use yii\helpers\Url;

	$this->title = 'Пост';

?>
<div class="page-posts no-padding">                    
    <div class="row">                        
        <div class="page page-post col-sm-12 col-xs-12">
            <div class="blog-posts blog-posts-large">

                <div class="row">

                	<article class="post col-sm-12 col-xs-12">                                            
                                <div class="post-meta">
                                    <div class="post-title">
                                    	<img src="<?php echo Yii::$app->storage->getFile($post->user->picture); ?>" class="author-image" />
                                        <div class="author-name">
                                            <a href="<?php echo Url::to(['/user/profile/view', 'nickname' => ($post->user->nickname) ? $post->user->nickname : $post->user->id]); ?>">
                                                <?php echo Html::encode($post->user->username); ?>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="post-type-image">
									<img src="<?php echo $post->getImage(); ?>" alt="" />
                                </div>
                                <div class="post-description">
                                	<p><?php echo Html::encode($post->description); ?></p>
                                </div>
									<div class="post-bottom" style="padding-bottom:15px;">
	                                    <div class="post-likes">
	                                        <i class="fa fa-lg fa-heart-o"></i>	
	                                        <span class="likes-count"><?php echo $post->countLikes(); ?></span>
	                                        &nbsp;&nbsp;&nbsp;

											<a href="#" class="btn btn-default button-like <?php echo ($currentUser && $post->isLikedBy($currentUser)) ? "display-none" : ""; ?>" data-id="<?php echo $post->id; ?>">
												Like&nbsp;<span class="glyphicon glyphicon-thumbs-up"></span>
											</a>
											<a href="#" class="btn btn-default button-dislike <?php echo ($currentUser && $post->isLikedBy($currentUser)) ? "" : "display-none"; ?>" data-id="<?php echo $post->id; ?>">
												Dislike&nbsp;<span class="glyphicon glyphicon-thumbs-down"></span>
											</a>
										</div>
										<div class="post-date">
                                        	&nbsp;&nbsp;&nbsp;&nbsp;<span><?php echo Yii::$app->formatter->asDatetime($post->created_at); ?></span>    
	                                    </div>
	                                    <div class="post-report">
	                                        <a href="#" class="btn btn-default btn-complain" data-id="<?php echo $post->id; ?>" style="font-size:12px;padding:5px 10px;">Пожаловаться <i class="fa fa-cog fa-spin fa-fw icon-preloader" style="display:none"></i>
                                        </a>    
	                                    </div>
										<div class="col-md-12" style="padding-top:20px;">
											<?php if ($comments): ?>
											<h3 style="padding-top:15px;">Комментарии (<?php echo count($comments); ?>):</h3>
											<?php foreach($comments as $comment): ?>
												<?php $user_com = $user->find()->where(['id' => $comment->user_id])->one(); ?>
												<img src="<?php echo $user_com->getPicture(); ?>" style="width: 50px;height:50px;border-radius:25px;display:inline;">
												<span style="font-size:20px;"><?php echo $user->getUsername($comment->user_id); ?></span>
												<p style="margin-top:15px;"><?php echo $comment->text; ?></p>
												<?php if ($currentUser && $currentUser->getId() == $comment->user_id): ?>
													<a href="<?php echo Url::to(['/post/default/update', 'id' => $comment->id]); ?>">Редактировать</a>
													<a href="<?php echo Url::to(['/post/default/delete', 'id' => $comment->id]); ?>">Удалить</a>
												<?php endif; ?>
												<hr>
											<?php endforeach; ?>
											<?php endif; ?>
											<?php if(!Yii::$app->user->isGuest): ?>
												<?php $form = ActiveForm::begin(); ?>
													<?php echo $form->field($model, 'text')->label('Ваш комментарий:'); ?>
													<?php echo Html::submitButton('Опубликовать', [
														'class' => 'btn btn-primary'
													]); ?>
												<?php ActiveForm::end(); ?>
											<?php endif; ?>
										</div>
									</div>
							</article>
				</div>
			</div>
		</div>
	</div>
</div>

<?php $this->registerJsFile('@web/js/likes.js', [
		'depends' => JqueryAsset::className()
	]); ?>
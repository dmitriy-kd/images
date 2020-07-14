<?php

namespace frontend\modules\post\controllers;

use Yii;
use yii\web\Controller;
use yii\web\UploadedFile;
use frontend\modules\post\models\forms\PostForm;
use yii\web\NotFoundHttpException;
use frontend\models\Post;
use yii\web\Response;
use frontend\modules\post\models\Comments;
use frontend\models\User;

/**
 * Default controller for the `post` module
 */
class DefaultController extends Controller
{

	public function actionCreate()
	{
		if (Yii::$app->user->isGuest) {

			return $this->redirect(['/user/default/login']);
		}

		$model = new PostForm(Yii::$app->user->identity);


		if ($model->load(Yii::$app->request->post())) {

			$model->picture = UploadedFile::getInstance($model, 'picture');
			// код из урока
			if ($model->save()) {

				Yii::$app->session->setFlash('success', 'Пост опубликован!');
				return $this->goHome();

			}
			
			/* моя старая реализация для того чтобы функционировала функция по автоматическому изменению размеров картинки поста
			$path = $model->save();
			if ($path) {

				$model->resizePicture($path);
				Yii::$app->session->setFlash('success', 'Пост опубликован!');
				return $this->goHome();

			}*/
		}

		return $this->render('create', [
			'model' => $model
		]);

	}

	public function actionView($id)
	{

		$currentUser = Yii::$app->user->identity;
		$model = new Comments();
		$post = $this->findPost($id);
		$comments = Comments::find()->where(['post_id' => $post->id])->all();
		$user = new User();


		if ($model->load(Yii::$app->request->post())) {

			$model->user_id = $model->getUserId($currentUser);
			$model->post_id = $model->getPostId($post);
			$model->created_at = time();
			$model->updated_at = time();

			if ($model->save()) {
				Yii::$app->session->setFlash('success', 'Комментарий опубликован!');
				return $this->redirect(['/post/'.$post->id]);
			}

		}

		return $this->render('view', [
			'post' => $post,/*$this->findPost($id) закомментил для своей реализации работы комментариев*/
			'currentUser' => $currentUser,
			'model' => $model,
			'comments' => $comments,
			'user' => $user
		]);

	}


	

	public function actionLike()
	{

		if (Yii::$app->user->isGuest) {

			return $this->redirect(['/user/default/login']);

		}

		Yii::$app->response->format = Response::FORMAT_JSON;

		$id = Yii::$app->request->post('id');
		$post = $this->findPost($id);

		$currentUser = Yii::$app->user->identity;

		$post->like($currentUser);

		return [
			'success' => true,
			'likesCount' => $post->countLikes()
		];

	}

	public function findPost($id)
	{

		if ($post = Post::findOne($id)) {

			return $post;

		}

		throw new NotFoundHttpException();

	}

	public function actionDislike()
	{

		if (Yii::$app->user->isGuest) {

			return $this->redirect(['/user/default/login']);

		}

		Yii::$app->response->format = Response::FORMAT_JSON;

		$id = Yii::$app->request->post('id');
		$post = $this->findPost($id);

		$currentUser = Yii::$app->user->identity;

		$post->dislike($currentUser);

		return [
			'success' => true,
			'likesCount' => $post->countLikes()
		];

	}

	public function actionDelete($id)
	{

		$model = Comments::findOne($id);
		$model->delete();

		return $this->redirect(['/post/'.$model->post_id]);

	}

	public function actionUpdate($id)
	{

		$model = Comments::findOne($id);

		if ($model->load(Yii::$app->request->post()))
		{

			$model->updated_at = time();

			if ($model->save()) {

				Yii::$app->session->setFlash('success', 'Комментарий отредактирован!');
				return $this->redirect(['/post/'.$model->post_id]);
			
			}
		}

		return $this->render('update', [
			'model' => $model
		]);

	}

	public function actionComplain()
	{

		if (Yii::$app->user->isGuest) {

			return $this->redirect(['/user/default/login']);

		}

		Yii::$app->response->format = Response::FORMAT_JSON;

		$id = Yii::$app->request->post('id');

		/* @var $currentUser User */
		$currentUser = Yii::$app->user->identity;
		$post = $this->findPost($id);

		if ($post->complain($currentUser)) {

			return [
				'success' => true,
				'text' => 'Жалоба отправлена'
			];

		}
		return [
			'success' => false,
			'text' => 'Ошибка'
		];

	}

}

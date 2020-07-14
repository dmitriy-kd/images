<?php

	namespace frontend\modules\user\controllers;

	use Yii;
	use yii\web\Controller;
	use frontend\models\User;
	use Faker\Factory;
	use Predis\Client;
	use yii\web\NotFoundHttpException;
	use frontend\modules\user\models\forms\PictureForm;
	use yii\web\UploadedFile;
	use yii\web\Response;
	use frontend\models\Post;


	class ProfileController extends Controller
	{

		public function actionView($nickname)
		{

			$currentUser = Yii::$app->user->identity;

			$modelPicture = new PictureForm();

			$user = $this->findUser($nickname);

			$posts = Post::find()->where(['user_id' => $user->id])->all();

			return $this->render('view', [
				'user' => $user,
				'currentUser' => $currentUser,
				'modelPicture' => $modelPicture,
				'posts' => $posts
			]);

		}

		/**
		*@param string $nickname
		*@return User
		*$throws NotFoundException
		*/

		public function findUser($nickname)
		{

			if($user = User::find()->where(['nickname' => $nickname])->orWhere(['id' => $nickname])->one()) {

				return $user;

			}

			return false;

			throw new NotFoundHttpException();

		}

		/*
		public function actionGenerate()
		{

			$faker = Factory::create();

			for ($i = 0; $i < 1000; $i++)
			{

				$user = new User([
					'username' => $faker->name,
					'email' => $faker->email,
					'about' => $faker->text(200),
					'nickname' => $faker->regexify('[A-Za-z0-9_]{5,15}'),
					'auth_key' => Yii::$app->security->generateRandomString(),
					'password_hash' => Yii::$app->security->generateRandomString(),
					'created_at' => $time = time(),
					'updated_at' => $time
				]);
				$user->save(false);

			}

		}
		*/

		public function actionSubscribe($id)
		{

			if (Yii::$app->user->isGuest) {

				return $this->redirect(['/user/default/login']);

			}

			/* @var $currentUser User */
			$currentUser = Yii::$app->user->identity;

			$user = $this->findUserById($id);

			$currentUser->followUser($user);

			return $this->redirect(['/user/profile/view', 'nickname' => $user->getNickname()]);

		}

		public function actionUnsubscribe($id)
		{

			if (Yii::$app->user->isGuest) {

				return $this->redirect(['/user/default/login']);

			}

			$currentUser = Yii::$app->user->identity;

			$user = $this->findUserById($id);

			$currentUser->unfollowUser($user);

			return $this->redirect(['/user/profile/view', 'nickname' => $user->getNickname()]);

		}
		/* моя реализация
		public function getUserById($id)
		{

			return User::findIdentity($id);

		}
		*/

		private function findUserById($id)
		{

			if ($user = User::findOne($id)) {

				return $user;

			}

			throw new NotFoundHttpException();

		}

		public function actionUploadPicture()
		{

			Yii::$app->response->format = Response::FORMAT_JSON;

			$model = new PictureForm();

			$model->picture = UploadedFile::getInstance($model, 'picture');

			if ($model->validate()) {

				$user = Yii::$app->user->identity;
				$user->picture = Yii::$app->storage->saveUploadedFile($model->picture);
				
				if ($user->save(false, ['picture'])) { //false в методе говорит о том что нам не требуется производить валидацию и сохранять только аттрибут picture
					$model->resizePicture(Yii::$app->storage->getFile($user->picture));
					return [
						'success' => true,
						'pictureUri' => Yii::$app->storage->getFile($user->picture)
					];

				} 

				return ['success' => false, 'errors' => $model->getErrors()];

				
			}

		}

		public function actionDeletePicture()
		{

			$currentUser = Yii::$app->user->identity;

			$picture = User::deletePicture($currentUser->getId());

			return $this->redirect(['/user/profile/view', 'nickname' => $currentUser->getNickname()]);


		}

	}
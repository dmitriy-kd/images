<?php

	namespace frontend\controllers;

	use Yii;
	use yii\web\Controller;
	use Intervention\Image\ImageManager;

	class TestController extends Controller
	{

		public function actionIndex()
		{

			/*$redis = Yii::$app->redis;

			//$redis->set('key', 'value');
			$result = $redis->get('key');
			//$result = $redis->get('test_collection2');
			echo '<pre>';
			print_r($result);
			echo '</pre>';
			die;*/
			/*
			$width = Yii::$app->params['postPicture']['maxWidth'];
			$height = Yii::$app->params['postPicture']['maxHeight'];

			$manager = new ImageManager(array('driver' => 'imagick'));

			$image = $manager->make('C:\OSPanel\domains\images.com\frontend\web\uploads\12\f7\9899cb6885b0e643917b6e15bafcc13a9738.jpg');

			$image->resize($width, $height, function($constraint) {
				$constraint->aspectRatio();
				$constraint->upsize();
			})->save();
			*/
			return $this->render('index');

		}

	}
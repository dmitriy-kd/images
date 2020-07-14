<?php

	namespace frontend\modules\user\models\forms;

	use Yii;
	use yii\base\Model;
	use Intervention\Image\ImageManager;

	class PictureForm extends Model
	{

		public $picture;

		public function rules()
		{

			return [
				[['picture'], 'file',
					'extensions' => ['jpg'],
					'checkExtensionByMimeType' => true,
					'maxSize' => Yii::$app->params['maxFileSize'],
				],
			];

		}

		public function save()
		{

			return 1;

		}
/*
		public function __construct()
		{

			$this->on(self::EVENT_AFTER_VALIDATE, [$this, 'resizePicture']);

		}
*/
		public function resizePicture($path)
		{

			if ($this->picture->error) {

				/*В объекте UploadedFile есть свойство error. Если в нем "1", значит 
				*произошла ошибка и работать с изображением не нужно, прерываем
				*выполнение метода */
				return;
			}

			$width = Yii::$app->params['profilePicture']['maxWidth'];
			$height = Yii::$app->params['profilePicture']['maxHeight'];

			$manager = new ImageManager(array('driver' => 'imagick'));

			$image = $manager->make('C:\OSPanel\domains\images.com\frontend\web' . $path);

			//3-й аргумент ограничения - специальные настройки при изменении размера
			$image->resize($width, $height, function ($constraint){

				//Пропорции изображений оставлять такими же (например, для избежания широких или вытянутых лиц)
				$constraint->aspectRatio();

				//Изображения, меньше заданных $width и $height не будут изменены
				$constraint->upsize(); 

			})->save();

		}
		

	}
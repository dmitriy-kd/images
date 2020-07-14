<?php 

	namespace frontend\modules\post\models;

	use Yii;
	use yii\db\ActiveRecord;
	use frontend\models\Post;
	use frontend\models\User;

	class Comments extends ActiveRecord
	{

		public static function tableName()
		{

			return 'comments';

		}

		public function rules()
		{

			return [
				[['text', 'user_id', 'post_id', 'created_at', 'updated_at'], 'safe'],

			];

		}

		public function attributeLabels()
    	{
	        return [
	            'id' => 'ID',
	            'text' => 'Text',
	            'user_id' => 'User ID',
	            'post_id' => 'Post ID',
	            'created_at' => 'Created At',
	            'updated_at' => 'Updated At',
	        ];
    	}

		public function getUser()
		{

			return $this->hasOne(User::className(), ['id' => 'user_id']);

		}

		public function getPost()
		{

			return $this->hasOne(Post::className(), ['id' => 'post_id']);

		}

		public function getUserId(User $user)
		{

			return $user->getId();

		}

		public function getPostId(Post $post)
		{

			return $post->getId();

		}

		public function getCount(int $post_id)
		{

			$params = [
				':post_id' => $post_id,
			];
			$sql = "SELECT COUNT(*) FROM comments WHERE post_id = (:post_id)";

			return Yii::$app->db->createCommand($sql)->bindValues($params)->queryAll();

		}


	}
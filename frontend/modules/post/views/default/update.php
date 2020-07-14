<?php

	/* @var $this yii\web\View */
	/* @var $model frontend\modules\post\models\Comments*/

	use yii\widgets\ActiveForm;
	use yii\helpers\Html;

?>

<h2>Редактирование комментария</h2>
<?php $form = ActiveForm::begin(); ?>

	<?php echo $form->field($model, 'text'); ?>

	<?php echo Html::submitButton('Редактировать', [
			'class' => 'btn btn-primary'
		]); ?>

<?php ActiveForm::end(); ?>
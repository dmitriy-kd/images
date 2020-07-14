<?php 
namespace frontend\tests\functional;
use frontend\tests\FunctionalTester;
use frontend\tests\fixtures\UserFixture;

class LoginCest
{

	public function _before(FunctionalTester $I)
	{

		$I->haveFixtures([
			'user' => [
				'class' => UserFixture::className(),
			]
		]);

	}

    public function checkLoginWorking(FunctionalTester $I)
    {

    	$I->amOnRoute('user/default/login');

    	$formParams = [
    		'LoginForm[email]' => 'dima@dima.ru',
    		'LoginForm[password]' => '111111'
    	];

    	$I->submitForm('#login-form', $formParams);

    	$I->see('Dima', 'form button[type=submit]');

    }

    public function checkLoginWrongPassword(FunctionalTester $I)
    {

    	$I->amOnRoute('user/default/login');

    	$formParams = [
    		'LoginForm[email]' => 'dima@dima.ru',
    		'LoginForm[password]' => 'wrong11'
    	];

    	$I->submitForm('#login-form', $formParams);

    	$I->seeValidationError('Incorrect email or password.');

    }

}

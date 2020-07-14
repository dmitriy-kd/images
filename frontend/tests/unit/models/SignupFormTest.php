<?php 
namespace frontend\tests\models;

use frontend\modules\user\models\SignupForm;
use frontend\tests\fixtures\UserFixture;

class SignupFormTest extends \Codeception\Test\Unit
{
    /**
     * @var \frontend\tests\UnitTester
     */
    protected $tester;

    public function _before()
    {

        $this->tester->haveFixtures([
            'user' => [
                'class' => UserFixture::className(),
            ],
        ]);

    }
    
    public function testTrimUsername()
    {

        $model = new SignupForm([
            'username' => ' some_username ',
            'email' => 'test@test.ru',
            'password' => '12345'
        ]);

        $model->signup();

        expect($model->username)->equals('some_username');

    }

    public function testUsernameRequired()
    {

         $model = new SignupForm([
            'username' => '',
            'email' => 'test@test.ru',
            'password' => '12345'
        ]);

        $model->signup();

        expect($model->getFirstError('username'))->equals('Username cannot be blank.');

    }

    public function testUsernameTooShort()
    {

         $model = new SignupForm([
            'username' => 's',
            'email' => 'test@test.ru',
            'password' => '12345'
        ]);

        $model->signup();

        expect($model->getFirstError('username'))->equals('Username should contain at least 2 characters.');

    }

    public function testPasswordRequired()
    {

         $model = new SignupForm([
            'username' => 'test',
            'email' => 'test@test.ru',
            'password' => ''
        ]);

        $model->signup();

        expect($model->getFirstError('password'))->equals('Password cannot be blank.');

    }

    public function testPasswordTooShort()
    {

         $model = new SignupForm([
            'username' => 'test',
            'email' => 'test@test.ru',
            'password' => '123'
        ]);

        $model->signup();

        expect($model->getFirstError('password'))->equals('Password should contain at least 6 characters.');

    }

    public function testEmailUnique()
    {

        $model = new SignupForm([
            'username' => 'some_username',
            'email' => 'dima@dima.ru',
            'password' => '123456',
        ]);

        $model->signup();

        expect($model->getFirstError('email'))->equals('This email address has already been taken.');


    }

}
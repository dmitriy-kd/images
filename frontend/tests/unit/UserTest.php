<?php 

namespace frontend\tests;

use Yii;
use frontend\tests\fixtures\UserFixture;

class UserTest extends \Codeception\Test\Unit
{
    /**
     * @var \frontend\tests\UnitTester
     */
    protected $tester;

    public function _before()
    {

        Yii::$app->setComponents([
            'redis' => [
                'class' => 'yii\redis\Connection',
                'hostname' => 'localhost',
                'port' => 6379,
                'database' => 1
            ],
        ]);

    }

    public function _fixtures()
    {

        return ['users' => UserFixture::className()];

    }

    // tests
    public function testGetNicknameOnNicknameEmpty()
    {  
        $user = $this->tester->grabFixture('users', 'user1');
        expect($user->getNickname())->equals(100);
    }

    public function testGetNicknameOnNicknameNotEmpty()
    {

        $user = $this->tester->grabFixture('users', 'user2');
        expect($user->getNickname())->equals('e_laco');

    }

    public function testGetPostCount()
    {

        $user = $this->tester->grabFixture('users', 'user1');
        expect($user->getPostCount())->equals(2);

    }

    public function testFollowUser()
    {

        $user1 = $this->tester->grabFixture('users', 'user1');
        $user2 = $this->tester->grabFixture('users', 'user2');

        $user2->followUser($user1);

        $this->tester->seeRedisKeyContains('user:100:followers', 200);
        $this->tester->seeRedisKeyContains('user:200:subscriptions', 100);

        $this->tester->sendCommandToRedis('del', 'user:100:followers');
        $this->tester->sendCommandToRedis('del', 'user:200:subscriptions');

    }

}
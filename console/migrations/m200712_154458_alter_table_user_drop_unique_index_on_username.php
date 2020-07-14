<?php

use yii\db\Migration;

/**
 * Class m200712_154458_alter_table_user_drop_unique_index_on_username
 */
class m200712_154458_alter_table_user_drop_unique_index_on_username extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {

        $this->dropIndex('username', 'user');

    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->createIndex('username', 'user', 'username', $unique = true);
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m200712_154458_alter_table_user_drop_unique_index_on_username cannot be reverted.\n";

        return false;
    }
    */
}

<?php
return [
    'adminEmail' => 'admin@example.com',


    'maxFileSize' => 1024 * 1024 * 2, // 2 megabites
    
    'storageUri' => '/uploads/',      // http://images.com/uploads/f1/d7/8jiojritjijrjj.jpg
    'profilePicture' => [
    	'maxWidth' => 1280,
    	'maxHeight' => 1024
    ],
    'postPicture' => [
    	'maxWidth' => 1024,
    	'maxHeight' => 768
    ],

    'feedPostLimit' => 200,
];

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    protected $table = 'books';

    public function book_authors(){
        return $this->hasMany('App\Author', 'book_id');
    }
}
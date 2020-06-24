<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('index');
});

Route::get('crud', function () {
    return view('crud');
});

Route::get('/api/external-books', 'ApiController@fetchApiBooks');

Route::get('/api/v1/books', 'ApiController@fetchCrud');
Route::get('/api/v1/books/{id}', 'ApiController@fetchCrudById');
Route::post('/api/v1/books', 'ApiController@createCrud');
Route::patch('/api/v1/books/{id}', 'ApiController@updateCrud');
Route::delete('/api/v1/books/{id}', 'ApiController@deleteCrud');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

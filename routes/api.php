<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('external-books', 'ApiController@fetchApiBooks');

Route::get('v1/books', 'ApiController@fetchCrud');
Route::get('v1/books/{id}', 'ApiController@fetchCrudById');
Route::post('v1/books', 'ApiController@createCrud');
Route::patch('v1/books/{id}', 'ApiController@updateCrud');
Route::delete('v1/books/{id}', 'ApiController@deleteCrud');
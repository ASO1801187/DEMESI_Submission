<?php

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
    return view('welcome');
});

//ユーザー新規登録
Route::get('/user/insert', 'User@user_insert');

Route::get('/flag/{id}','ActivationCreted@build');

Route::get('/user/delete', 'User@user_delete');

//登録確認
Route::get('/user/registration', 'User@user_registration');

Route::get('/user/id_index', 'User@id_index');

//再編集用のデータの取得
Route::get('/user/getData', 'User@getData');

Route::get('/user/reset', 'User@reset');

Route::get('/user/login', 'User@login');

//再編集
Route::get('/user/update', 'User@update');

Route::get('/company/insert', 'Company@company_insert');
Route::get('/company/login', 'Company@login');
Route::get('/company/getData', 'Company@getData');
Route::get('/company/update', 'Company@update');





Route::get('/card/template_get','Card@template_get');
Route::get('/card/template_details_get' ,'Card@template_Coordinate');

Route::get('/card/insert/{user_id}','Card@newcard');
Route::get('/card/allget/{user_id}','Card@AllCardTableReturn');
Route::get('/card/infomation/{meisi_id}','Card@CardInformationReturn');
Route::get('/card/collection/{user_id}/{meisi_id}','Card@InsertCollection');
Route::get('/card/collection_return/{user_id}','Card@CollectionReturn');


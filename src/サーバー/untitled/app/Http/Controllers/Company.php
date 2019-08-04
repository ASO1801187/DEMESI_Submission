<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class Company extends Controller
{
    //新規登録
    public function company_insert(Request $request){
        $param = [
            'company_id' => $request->company_id,
            'company_name' => $request->company_name,
            'company_password' => $request->company_password,
            'company_place' => $request->company_place,
            'company_phone' => $request->company_phone,
            'company_url' => $request->company_url,
            'company_mail' => $request->company_mail,
            'image' => $request->image,
        ];
        $check = [
            'company_id' => $request->company_id,
        ];
        $result = 0;
        if ($request->company_name=="" ){
            $result = 4;
        }
        $Anser1 = DB::select('select * from company_information where Company_id=:company_id',$check);
        if ($request->company_id==""  || $Anser1 != null){
            $result = 2;
        }
        if ($request->company_password=="" || preg_match("/^[a-zA-Z0-9]{8,15}$/","$request->company_password")){
        }else{
            $result = 3;
        }
        if ($result == 2 || $result == 3 || $result == 4){
            $box = array("result"=>$result);
            return $box;
        }
        //データベースの接続開始
        DB::beginTransaction();
        try {
            DB::insert('insert into company_information(Company_id,Company_password,Company_name,Company_mail,Company_phone,Company_place,Company_url,image)values
           (:company_id,:company_password,:company_name,:company_mail,:company_phone,:company_place,:company_url,:image)', $param);
            DB::commit();
            // all good
            $result = 1;
        } catch (\Exception $e) {
            DB::rollback();
            $result = 0;
            //エラー発生
        }
        $box = array("result"=>$result);
        json_encode($box);
        return $box;
    }
    //重複チェック
    function  id_check(Request $request){
        $check = [
            'company_id' => $request->company_id,
        ];
        $result = 0;
        $Anser1 = DB::select('select * from company_information where Company_id=:company_id',$check);
        if ($Anser1 != null){
            $result = 1;//重複チェック
        }
        $box = array("result"=>$result);
        json_encode($box);
        return $box;
    }
    //プロフィールの情報取得
    function getData(Request $request){
        $param = [
            'company_id' => $request->company_id,
        ];
        $result = 0;
        $items = DB::select('select * from company_information where Company_id = :company_id',$param);
        if ($items == null){
            $box = array("result"=>$result);
            json_encode($box);
            return $box;
        }
        $result = 1;
        $items = $items[0];
        $box = array('result'=>$result,'company_name'=>$items->Company_name,'company_mail'=>$items->Company_mail,'company_phone'=>$items->Company_phone,'company_place'=>$items->Company_place,'company_url'=>$items->Company_url,'image'=>$items->image);
        json_encode($box);
        return $box;
    }
    //プロフィールを再設定
    function update(Request $request){
        $name = [
            'company_id' => $request->company_id,
            'company_name' => $request->company_name,
        ];
        $pass = [
            'company_id' => $request->company_id,
            'company_password' => $request->company_password,
        ];
        $place = [
            'company_id' => $request->company_id,
            'company_place' => $request->company_place,
        ];
        $phone_number = [
            'company_id' => $request->company_id,
            'company_phone' => $request->company_phone,
        ];
        $url =[
            'company_id' => $request->company_id,
            'company_url' => $request->company_url,
        ];
        $image =[
            'company_id' => $request->company_id,
            'image' => $request->image,
        ];
        //データベースの接続開始
        DB::beginTransaction();
        try {
            DB::update('update company_information set Company_id = :company_name where Company_id = :company_id', $name);
            DB::update('update company_information set Company_name = :company_name where Company_id = :company_id', $name);
            DB::update('update company_information set Company_password = :company_pass where Company_id = :company_id', $pass);
            DB::update('update company_information set Company_mail = :company_pass where Company_id = :company_id', $pass);
            DB::update('update company_information set Company_place = :company_place where Company_id = :company_id', $place);
            DB::update('update company_information set Company_phone = :company_phone where Company_id = :company_id', $phone_number);
            DB::update('update company_information set Company_url = :company_url where Company_id= :company_id', $url);
            DB::update('update company_information set image = :image where Company_id= :company_id', $image);
            DB::commit();
            // all good
            $result = 1;
        } catch (\Exception $e) {
            DB::rollback();
            $result = 5;
            //エラー発生
        }
        //成功
        $box = array("result"=>$result);
        json_encode($box);
        return $box;
    }
    //ログイン
    function login(Request $request){
        $param = [
            'company_id' => $request->company_id,
            'company_password' => $request->company_password,
        ];
        //IDとパスワード確認
        $result1 = DB::select('select * from company_information where Company_id =:company_id AND  Company_password=:company_password',$param);
        //存在確認
        if ($result1!=null){
            //存在
            $result = 1;
            $item = $result1[0];
            $box = array("result"=>$result);
            json_encode($box);
            return $box;
        }
        //失敗
        $result = 0;
        $box = array("result"=>$result);
        json_encode($box);
        return $box;
    }
}
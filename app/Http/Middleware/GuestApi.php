<?php
namespace App\Http\Middleware;

use Closure;
Use Auth;
Use Redirect;
use Response;
use DB;
use Config;
use Illuminate\Http\Request;
use App;

class GuestApi
{
    /**
    * Run the request filter.
    *
    * @param  \Illuminate\Http\Request  $request
    * @param  \Closure  $next
    * @return mixed
    */
    public function handle($request, Closure $next){
      if(!empty($request->header('Accept-Language'))){
        App::setLocale($request->header('Accept-Language'));
      }else{
        App::setLocale("en");
      }
		return $next($request);
	}
}

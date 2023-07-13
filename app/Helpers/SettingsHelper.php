<?php

use Illuminate\Support\Facades\Cache;
use Modules\Setting\Entities\Setting;

if (!function_exists('settingHelper')) {

    /**
     * description
     *
     * @param
     * @return
     */
    function settingHelper($title = "")
    {
        if ($title == "version") {
            $data = Cache::rememberForever($title, function () use ($title) {
                return Setting::where('title', $title)->first();
            });
            if (!blank($data)) {
                return $data->value;
            }
        } elseif ($title == "about_us_description" || $title == "copyright_text" || $title == "address" || $title == "phone" || $title == "zip_code" || $title == "city" || $title == "state" || $title == "country" || $title == "website" || $title == "company_registration" || $title == "tax_number" || $title == "signature" || $title == "onesignal_action_message" || $title == "onesignal_accept_button" || $title == "onesignal_cancel_button" || $title == "seo_title" || $title == "seo_keywords" || $title == "seo_meta_description" || $title == "author_name" || $title == "og_title" || $title == "og_description") {

            if (LaravelLocalization::setLocale() == "") {
                $default = Cache::rememberForever('default_language', function () {
                   return Setting::where('title', 'default_language')->first();
                });
                $lang = $default->value;
            } else {
                $lang = LaravelLocalization::setLocale();
            }

            $data = Cache::rememberForever($title, function () use ($title, $lang) {
               return Setting::where('title', $title)->where('lang', $lang)->first();
            });
            if (!blank($data)) {
                return $data->value;
            }
        }
        if (isset(Config::get('site.settings')[$title])):

            $value = Config::get('site.settings')[$title];

            if (!empty($value)) :
                return $value;
            endif;
        endif;
    }
}

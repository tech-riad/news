
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex">

    @include('site.partials.seo_og')

    <title>{{settingHelper('seo_title')}}</title>

    {{-- CSS --}}
    <link rel="stylesheet" href="{{static_asset('site/css/bootstrap.min.css') }}" >

    <link rel="stylesheet" href="{{static_asset('site/css/font-awesome.min.css') }}" >
    <link rel="stylesheet" href="{{static_asset('site/css/icon.min.css') }}" >
    <link rel="stylesheet"  href="{{static_asset('site/css/magnific-popup.min.css') }}" >
    <link rel="stylesheet" href="{{static_asset('site/css/animate.min.css') }}" >
    <link rel="stylesheet"  href="{{static_asset('site/css/slick.min.css') }}" >
    <link rel="stylesheet"  href="{{static_asset('site/css/structure.min.css') }}" >
    <link rel="stylesheet"  href="{{static_asset('site/css/main.css') }}" >
    @if($language->text_direction == "RTL")
        <link rel="stylesheet" href="{{static_asset('site/css/rtl.min.css') }}" >
    @endif
    <link rel="stylesheet"  href="{{static_asset('site/css/custom.css') }}" >
    <link rel="stylesheet"  href="{{static_asset('site/css/responsive.min.css') }}" >

    @yield('style')

    <link rel="stylesheet"  href="https://fonts.googleapis.com/css2?family={{data_get(activeTheme(), 'options.fonts')}}:wght@400;500;600;700&display=swap" >

    {{-- icons --}}
    <link rel="stylesheet" rel="icon" href="{{static_asset(settingHelper('favicon')) }}">
    <link rel="stylesheet" rel="apple-touch-icon" sizes="144x144"
          href="{{static_asset('site/images/ico/apple-touch-icon-precomposed.png') }}">
    <link rel="stylesheet" rel="apple-touch-icon" sizes="114x114"
          href="{{static_asset('site/images/ico/apple-touch-icon-114-precomposed.png') }}">
    <link rel="stylesheet" rel="apple-touch-icon" sizes="72x72"
          href="{{static_asset('site/images/ico/apple-touch-icon-72-precomposed.png') }}">
    <link rel="stylesheet" rel="apple-touch-icon" sizes="57x57"
          href="{{static_asset('site/images/ico/apple-touch-icon-57-precomposed.png') }}">

    {{-- icons --}}

<!-- Template Developed By  -->
    @stack('style')

    <style type="text/css">
        :root {
            --primary-color: {{data_get(activeTheme(), 'options.primary_color')}};
            --primary-font: {{\Config::get('site.fonts.'.data_get(activeTheme(), 'options.fonts').'')}};
            --plyr-color-main: {{data_get(activeTheme(), 'options.primary_color')}};
        }
    </style>

    <script async src="https://www.googletagmanager.com/gtag/js?id={{ settingHelper('google_analytics_id') }}"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }

        gtag('js', new Date());
        gtag('config', '{{ settingHelper('google_analytics_id') }}');
    </script>
</head>
{{-- dark class="sg-dark" --}}
<body class="{{defaultModeCheck()}}">

@if(settingHelper('preloader_option')==1)
    <div id="preloader">
        <img src="{{static_asset('site/images/')}}/preloader-2.gif" alt="Image" class="tr-preloader img-fluid">
    </div>
@endif

<link rel="stylesheet" href="{{ static_asset('site/css/plyr.css') }}" />
<div class="sg-page-content">
    <div class="container">
        <div class="entry-header mb-4">
            <div class="entry-thumbnail">
                @if($post->layout == 'style_3')
                    @include('site.pages.article.partials.detail_image')
                @endif
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-lg-12">
                <div class="theiaStickySidebar post-details">
                    <div class="sg-section">
                        <div class="section-content">
                            <div class="sg-post">
                                @if($post->layout =='default')
                                    @include('site.pages.article.style_1')
                                @elseif($post->layout == 'style_2')
                                    @include('site.pages.article.style_2')
                                @elseif($post->layout == 'style_3')
                                    @include('site.pages.article.style_3')
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="scrollToTop" id="display-nothing">
    <a href="#"><i class="fa fa-angle-up"></i></a>
</div>

{{-- JS --}}

<script src="{{static_asset('site/js/jquery.min.js') }}"></script>
<script defer src="{{static_asset('site/js/popper.min.js') }}"></script>
<script defer src="{{static_asset('site/js/bootstrap.min.js') }}"></script>
<script defer src="{{static_asset('site/js/slick.min.js') }}"></script>
<script defer src="{{static_asset('site/js/theia-sticky-sidebar.min.js') }}"></script>
<script defer src="{{static_asset('site/js/magnific-popup.min.js') }}"></script>
@stack('script')
<script src="{{static_asset('site/js/main.min.js') }}"></script>
<script src="{{static_asset('js/custom.js') }}"></script>

<script async type="text/javascript" src="{{static_asset('site/js') }}/jquery.cookie.min.js"></script>
<script defer src="{{static_asset('site/js/lazyload.js')}}"></script>

@yield('script')
<script src="{{static_asset('site/js') }}/plyr.js"></script>
<script src="{{static_asset('site/js') }}/plyr_ini.js"></script>
@yield('audio')

@isset($post)
    @if(!blank(\Request::route()))
        @if(settingHelper('adthis_option')==1 and settingHelper('addthis_public_id')!=null and \Request::route()->getName() == "article.detail")
            <script type="text/javascript">
                (function ($) {
                    "use strict";
                    var addthis_share = {
                        url: "{{ url()->current() }}",
                        title: "{{ $post->meta_title }}",
                        description: "{{ strip_tags($post->meta_description) }}",
                        media: "{{basePath(@$post->image)}}/{{ @$post->image->og_image }}"
                    }
                })(jQuery);
            </script>
        @endif
    @endif
@endisset

<script type="text/javascript" src="{{ static_asset('site/js/webp-support.js') }}"></script>
<script type="text/javascript" src="{{ static_asset('site/js/custom.min.js')}}" ></script>

@yield('quiz')
</body>
</html>

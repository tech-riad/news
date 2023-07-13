@extends('site.layouts.app')
@section('style')
    <link rel="stylesheet" href="{{ static_asset('site/css/lightbox.css') }}">
@endsection
@section('content')

    <div class="sg-page-content">
        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ url('') }}">{{__('home')}}</a></li>
                    <li class="breadcrumb-item"><a href="{{ route('image.albums')}}"> {{__('albums')}}</a></li>
                    <li class="breadcrumb-item"><a href="{{  route('album.gallery',['slug'=>@$album->slug])}}"> {{ $album->name }}</a></li>
                </ol>
            </nav>
            <div class="row">
                <div class="col-sm-12">
                    <div class="filters text-center">
                        <div class="button-group filter-button-group">
                            <button class="btn btn-primary filter active" data-filter="*">show all</button>
                            @isset($tabs)
                                @foreach(explode(',', $tabs) as $tab)
                                    <button class="btn btn-primary " data-filter=".{{ str_replace(' ', '-', $tab) }}">{{ $tab }}</button>
                                @endforeach
                            @endisset
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">

                <div class="col-md-12 col-lg-12">
                    <div class="grid mb-5">
                        <div class="grid-sizer"></div>
                        @foreach($albumImages as $albumImage)
                            <a href="{{ isFileExist(@$albumImage, $result = @$albumImage->original_image) ? basePath($albumImage).'/'.@$result : static_asset('default-image/default-1080x1000.png') }}" data-title="{{ $albumImage->title }}" data-toggle="lightbox" data-gallery="example-gallery">
                                <div class="grid-item {{ str_replace(' ', '-', $albumImage->tab) }}" data-category="{{ str_replace(' ', '-', $albumImage->tab) }}">
                                    <img src="{{ isFileExist(@$albumImage, $result = @$albumImage->original_image) ? basePath($albumImage).'/'.@$result : static_asset('default-image/default-1080x1000.png') }}" alt="{{ $albumImage->title }}"/>
                                </div>
                            </a>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('script')
    <script src="{{ static_asset('site/js/masonry.min.js') }}"></script>
    <script src="{{ static_asset('site/js/loaded.min.js') }}"></script>
    <script src="{{ static_asset('site/js/initialize.js') }}"></script>
    <script src="{{ static_asset('site/js/isotope.min.js') }}"></script>
    <script src="{{ static_asset('site/js/lightbox.min.js') }}"></script>
    <script src="{{ static_asset('site/js/filter.js') }}"></script>

@endsection

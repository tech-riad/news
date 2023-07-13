@extends('site.layouts.app')

@section('content')
    <div class="sg-page-content">
        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ url('') }}">{{__('home')}}</a></li>
                    <li class="breadcrumb-item"><a href="{{ route('image.albums')}}"> {{__('albums')}}</a></li>
                </ol>
            </nav>
            <div class="row">

                <div class="col-md-12 col-lg-12">
                    <div class="grid mb-5">
                        <div class="grid-sizer"></div>
                        @foreach(@$albums as $album)
                            <a href="{{ route('album.gallery',['slug'=>@$album->slug]) }}">
                                <div class="grid-item ">
                                    @if(isFileExist(@$album, $result = @$album->original_image))
                                        <img src="{{basePath($album)}}/{{ @$result }}"/>
                                    @else
                                        <img src="{{static_asset('default-image/default-1080x1000.png') }}"/>
                                    @endif

                                    <div class="title">
                                        <div class="album">
                                            {{ $album->name }}
                                        </div>
                                    </div>
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
@endsection


<div class="sg-menu">
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <div class="menu-content">
                <a class="navbar-brand" href="{{ route('home') }}">
                    <img src="{{ static_asset(settingHelper('logo')) }}" alt="Logo" class="img-fluid">
                </a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"><i class="fa fa-align-justify"></i></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav">

                        @foreach($primaryMenu as $mainMenu)

                            @if($mainMenu->is_mega_menu == 'no')
                                <li class="nav-item sg-dropdown">
                                    <a href="{{menuUrl($mainMenu)}}" target="{{$mainMenu->new_teb == 1? '_blank':''}}">{{$mainMenu->label == 'gallery'? __('gallery'):$mainMenu->label}} @if(!blank($mainMenu->children))<span><i class="fa fa-angle-down" aria-hidden="true"></i></span>@endif </a>
                                    <ul class="sg-dropdown-menu">
                                        @foreach($mainMenu->children as $child)
                                            <li class=""><a href="{{menuUrl($child)}}" target="{{$child->new_teb == 1? '_blank':''}}">{{$child->label == 'gallery'? __('gallery'):$child->label}} @if(!blank($child->children)) <span class="pull-right"><i class="fa fa-angle-right" aria-hidden="true"></i></span>@endif</a>
                                                <ul class="sg-dropdown-menu-menu">
                                                    @foreach($child->children as $subChild)
                                                        <li class=""><a href="{{menuUrl($subChild)}}" target="{{$subChild->new_teb == 1? '_blank':''}}">{{$subChild->label == 'gallery'? __('gallery'):$subChild->label}}</a></li>
                                                    @endforeach
                                                </ul>
                                            </li>
                                        @endforeach
                                    </ul>
                                </li>
                            @endif

                            @if($mainMenu->is_mega_menu == 'tab')

                                <li class="sg-dropdown mega-dropdown">
                                    <a href="{{menuUrl($mainMenu) ? menuUrl($mainMenu) : "#" }}">{{$mainMenu->label == 'gallery'? __('gallery'):$mainMenu->label}}<span><i class="fa fa-angle-down" aria-hidden="true"></i></span></a>
                                    <div class="sg-dropdown-menu mega-dropdown-menu">
                                        <div class="mega-menu-content">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <ul class="nav nav-tabs" role="tablist">
                                                        @foreach($mainMenu->children as $child)
                                                            @php $key = 0 @endphp
                                                            <li class="nav-item">
                                                                <a class="nav-link {{$mainMenu->children[$key]->id == $child->id? 'active':''}}" id="{{$child->label}}-tab" data-toggle="tab" href="#{{$child->category->slug}}" role="tab" aria-controls="{{$child->label}}" aria-selected="{{$mainMenu->children[$key]->id == $child->id? 'true':'false'}}">{{$child->label == 'gallery'? __('gallery'):$child->label}}</a>
                                                            </li>
                                                            @php $key++ @endphp
                                                        @endforeach
                                                    </ul>
                                                </div>
                                                <div class="col-md-10">
                                                    <div class="tab-content" id="myTabContent">
                                                        @foreach($mainMenu->children as $child)
                                                            <div class="tab-pane fade {{$mainMenu->children[0]->id == $child->id? 'show active':''}}" id="{{$child->category->slug}}" role="tabpanel" aria-labelledby="{{$child->label}}-tab">
                                                                <div class="row">
                                                                    @foreach($child->postByCategory as $item)
                                                                        <div class="col-md-6 col-lg-3">
                                                                            <div class="sg-post">
                                                                                <div class="entry-header">
                                                                                    <div class="entry-thumbnail">
                                                                                        <a href="{{ route('article.detail', ['id' => $item->slug]) }}">
                                                                                            @if(isFileExist(@$item->image, $result = @$item->image->medium_image_three))
                                                                                                <img class="img-fluid" src="{{ safari_check() ? basePath(@$item->image).'/'.$result : static_asset('default-image/default-240x160.png') }}" data-original="{{basePath(@$item->image)}}/{{ $result }}" alt="{!! $item->title !!}">
                                                                                            @else
                                                                                                <img class="img-fluid" src="{{static_asset('default-image/default-240x160.png') }}"  alt="{!! $item->title !!}">
                                                                                            @endif
                                                                                        </a>
                                                                                    </div>
                                                                                    @if($item->post_type=="video")
                                                                                        <div class="video-icon block">
                                                                                            <img src="{{static_asset('default-image/video-icon.svg') }} " alt="video-icon">
                                                                                        </div>
                                                                                    @elseif($item->post_type=="audio")
                                                                                        <div class="video-icon block">
                                                                                            <img src="{{static_asset('default-image/audio-icon.svg') }} " alt="audio-icon">
                                                                                        </div>
                                                                                    @endif
                                                                                </div>
                                                                                <div class="entry-content">
                                                                                    <a href="{{ route('article.detail', ['id' => $item->slug]) }}"><p>{!!Str::limit( $item->title , 35)!!}</p></a>
                                                                                    <div class="entry-meta">
                                                                                        <ul class="global-list">
                                                                                            <li>{{ __('post_by') }} <a href="{{ route('site.author',['id' => $item->user->id]) }}">{{$item->user->first_name}} </a> <a href="{{route('article.date', date('Y-m-d', strtotime($item->updated_at)))}}"> {{date('d F Y', strtotime($item->created_at))}}</a></li>
                                                                                        </ul>
                                                                                    </div><!-- /.entry-meta -->
                                                                                </div><!-- /.entry-content -->
                                                                            </div><!-- /.sg-post -->
                                                                        </div>
                                                                    @endforeach
                                                                </div><!-- /.row -->
                                                            </div><!-- /.tab-pane -->
                                                        @endforeach
                                                    </div><!-- /.tab-content -->
                                                </div>
                                            </div><!-- /.row -->
                                        </div><!-- /.mega-menu-content -->
                                    </div>
                                </li>
                            @endif

                            @if($mainMenu->is_mega_menu == 'category')
                                <li class="sg-dropdown mega-dropdown">
                                    <a href="{{menuUrl($mainMenu)}}" target="{{$mainMenu->new_teb == 1? '_blank':''}}">{{$mainMenu->label == 'gallery'? __('gallery'):$mainMenu->label}} @if(!blank($mainMenu->children))<span><i class="fa fa-angle-down" aria-hidden="true"></i></span>@endif</a>
                                    <div class="sg-dropdown-menu mega-dropdown-menu">
                                        <div class="mega-menu-content">
                                            <div class="row">
                                                @foreach($mainMenu->children as $child)
                                                    <div class="col-md-3">
                                                        <h3>{{$child->label == 'gallery'? __('gallery'):$child->label}}</h3>
                                                        <ul class="global-list">
                                                            @foreach($child->children as $subChild)
                                                                <li><a href="{{menuUrl($subChild)}}" target="{{$subChild->new_teb == 1? '_blank':''}}">{{$subChild->label == 'gallery'? __('gallery'):$subChild->label}}</a></li>
                                                            @endforeach
                                                        </ul>
                                                    </div>
                                                @endforeach
                                            </div><!-- /.row -->
                                        </div><!-- /.mega-menu-content -->
                                    </div>
                                </li>
                            @endif

                        @endforeach
                    </ul>
                </div>

                <div class="sg-search">
                    <div class="search-form">
                        <form action="{{ route('article.search') }}" id="search" method="GET">
                            <label for="label" class="d-none">{{ __('search') }}</label>
                            <input class="form-control" id="label" name="search" type="text" placeholder="{{ __('search') }}">
                            <button type="submit"><i class="fa fa-search"></i><span class="d-none">{{__('search')}}</span></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</div>

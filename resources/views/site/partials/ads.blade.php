@if(!blank($ads))
    @foreach($ads as $headerWidget)
        @if(data_get($headerWidget, 'view') == 'ad_widget')
            @php
                $ad = data_get($headerWidget, 'detail.ad');
            @endphp
            <div class="sg-ad">
                <div class="container">
                    <div class="ad-content">
                        @if(@$ad->ad_type == 'image')
                            <a href="{{ data_get($ad, 'ad_url', '#') ?  data_get($ad, 'ad_url', '#') : '#'}}">
                                @if(isFileExist(@$ad->adImage, $result = @$ad->adImage->original_image))
                                    <img class="img-fluid lazy" src="{{ safari_check() ? basePath(@$ad->adImage).'/'.$result : static_asset('default-image/default-add-728x90.png') }} " data-original="{{basePath($ad->adImage)}}/{{ $result }}" alt="{{ $ad->ad_name }}">
                                @else
                                    <img src="{{static_asset('default-image/default-add-728x90.png') }} "  class="img-fluid lazy"   alt="{!! $ad->ad_name !!}" >
                                @endif
                            </a>
                        @elseif(@$ad->ad_type == 'code')
                            {!! $ad->ad_code ?? '' !!}
                        @elseif(@$ad->ad_type == 'text')
                            {!! $ad->ad_text ?? '' !!}
                        @endif
                    </div>
                </div>
            </div>
        @endif
    @endforeach
@endif

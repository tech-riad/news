<?=
/* Using an echo tag here so the `<? ... ?>` won't get parsed as short tags */
'<?xml version="1.0" encoding="UTF-8"?>'.PHP_EOL
?>
<rss version="2.0" xmlns:media="http://www.w3.org/2001/XMLSchema" xml:base="{{ url('/feed') }}" xmlns:atom="http://www.w3.org/2005/Atom">
    <channel>
        <title>{{ settingHelper('application_name') }}</title>
        <link>{{ url('/feed') }}</link>
        <atom:link rel="self" href="{{ url('feed') }}" />
        <description>{{ settingHelper('seo_meta_description') }}</description>
        <language>{{ settingHelper('default_language') }}</language>

        @foreach($items as $item)
            <item>
                <title>{{ $item->title }}</title>
                <description>{!! strip_tags( html_entity_decode(\Illuminate\Support\Str::limit($item->summary, 200))) !!}</description>

                <link>{{ $item->link }}</link>
                <author>{{ $item->author }}</author>
                <guid>{{ $item->link }}</guid>
                <pubDate>{{ $item->updated->toRssString() }}</pubDate>
                @if($item->enclosure !=null)
                    <enclosure url="{{static_asset($item->enclosure)}}"></enclosure>
                @else
                    <enclosure url="{{static_asset('default-image/default-730x400.png') }}"></enclosure>
                @endif
            </item>
        @endforeach
    </channel>
</rss>

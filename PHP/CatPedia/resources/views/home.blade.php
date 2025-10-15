@extends("layout.index")
@section("navbar")
 @include("components.navbar")
@endsection

@section("main-content")
 @include("components.main_content")
@endsection

@section("alert-section")
    @include("components.alert")
@endsection

@section("form")
 @include("components.form")
@endsection

@section("footer")
 @include("components.footer")
@endsection
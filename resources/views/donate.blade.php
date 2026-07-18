@extends('layouts.app')

@section('title', 'Support Us')

@section('content')

    @include('partials.page-header', ['title' => 'Support'])

    @include('partials.donate-section')

@endsection

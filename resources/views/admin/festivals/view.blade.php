@extends('admin.layouts.layout')
@section('content')
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
    <div class="subheader py-2 py-lg-4 subheader-solid" id="kt_subheader">
        <div class="container-fluid d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
            <div class="d-flex align-items-center flex-wrap mr-1">
                <div class="d-flex align-items-baseline flex-wrap mr-5">
                    <h5 class="text-dark font-weight-bold my-1 mr-5">
                        View {{ Config('constants.FESTIVAL.FESTIVAL_TITLE') }}
                    </h5>
                    <ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                        <li class="breadcrumb-item">
                            <a href="{{ route('dashboard') }}" class="text-muted">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="{{ route($model.'.index') }}" class="text-muted">{{ Config('constants.FESTIVAL.FESTIVAL_TITLES') }}</a>
                        </li>
                    </ul>
                </div>
            </div>
            @include("admin.elements.quick_links")
        </div>
    </div>

    <div class="d-flex flex-column-fluid">
        <div class="container">
            <div class="card card-custom gutter-b">
                <div class="card-header card-header-tabs-line">
                    <div class="card-toolbar">
                        <ul class="nav nav-tabs nav-tabs-space-lg nav-tabs-line nav-bold nav-tabs-line-3x" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#kt_apps_contacts_view_tab_1">
                                    <span class="nav-text">
                                        {{ Config('constants.FESTIVAL.FESTIVAL_TITLE') }} Information
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="card-body">
                    <div class="tab-content">
                        <div class="tab-pane active" id="kt_apps_contacts_view_tab_1" role="tabpanel">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group row my-2">
                                        <label class="col-4 col-form-label font-weight-bold">Name:</label>
                                        <div class="col-8">
                                            <span class="form-control-plaintext">{{ $festivalDetails->name ?? '' }}</span>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group row my-2">
                                        <label class="col-4 col-form-label font-weight-bold">Dates:</label>
                                        <div class="col-8">
                                            <span class="form-control-plaintext">{{ $festivalDetails->date ?? 'N/A' }}</span>
                                        </div>
                                    </div>

                                    <div class="form-group row my-2">
                                        <label class="col-4 col-form-label font-weight-bold">Short Description:</label>
                                        <div class="col-8">
                                            <span class="form-control-plaintext">{{ $festivalDetails->short_dec ?? 'N/A' }}</span>
                                        </div>
                                    </div>

                                    <div class="form-group row my-2">
                                        <label class="col-4 col-form-label font-weight-bold">Status:</label>
                                        <div class="col-8">
                                            <span class="form-control-plaintext">
                                                @if($festivalDetails->is_active == 1)
                                                    <span class="label label-lg label-light-success label-inline">Activated</span>
                                                @else
                                                    <span class="label label-lg label-light-danger label-inline">Deactivated</span>
                                                @endif
                                            </span>
                                        </div>
                                    </div>

                                    <div class="form-group row my-2">
                                        <label class="col-4 col-form-label font-weight-bold">States Celebrated:</label>
                                        <div class="col-8">
                                            @if(!empty($festivalDetails->states))
                                                @php
                                                    $stateNames = [];
                                                    foreach($festivalDetails->states as $stateId) {
                                                        $state = \App\Models\State::find($stateId);
                                                        if($state) {
                                                            $stateNames[] = $state->name;
                                                        }
                                                    }
                                                @endphp
                                                <span class="form-control-plaintext">{{ implode(', ', $stateNames) }}</span>
                                            @else
                                                <span class="form-control-plaintext text-muted">No states assigned</span>
                                            @endif
                                        </div>
                                    </div>

                                    @if(!empty($festivalDetails->regional_names))
                                    <div class="form-group row my-2">
                                        <label class="col-4 col-form-label font-weight-bold">Regional Names:</label>
                                        <div class="col-8">
                                            <span class="form-control-plaintext">{{ $festivalDetails->regional_names }}</span>
                                        </div>
                                    </div>
                                    @endif

                                    @if(!empty($festivalDetails->duration))
                                    <div class="form-group row my-2">
                                        <label class="col-4 col-form-label font-weight-bold">Duration:</label>
                                        <div class="col-8">
                                            <span class="form-control-plaintext">{{ $festivalDetails->duration }}</span>
                                        </div>
                                    </div>
                                    @endif
                                </div>

                                <div class="col-md-4 text-center">
                                    <div class="form-group">
                                        <label class="font-weight-bold">Festival Image</label>
                                        <div class="mt-2">
                                            @if(!empty($festivalDetails->image))
                                                <img src="{{ $festivalDetails->image }}" class="img-fluid rounded shadow-sm" style="max-height: 250px;" onerror="this.src='{{ url('public/img/no-image.png') }}'">
                                            @else
                                                <div class="p-5 bg-light rounded text-muted">No Image Available</div>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="separator separator-dashed my-10"></div>

                            <div class="row">
                                <div class="col-12">
                                    <h6 class="font-weight-bolder mb-5">Detailed Descriptions</h6>
                                    
                                    <div class="mb-5">
                                        <label class="font-weight-bold">Long Description:</label>
                                        <div class="bg-light p-5 rounded">
                                            {!! $festivalDetails->long_dec ?? '<span class="text-muted">No long description provided.</span>' !!}
                                        </div>
                                    </div>

                                    @if(!empty($festivalDetails->history))
                                    <div class="mb-5">
                                        <label class="font-weight-bold">History:</label>
                                        <div class="bg-light p-5 rounded">
                                            {!! $festivalDetails->history !!}
                                        </div>
                                    </div>
                                    @endif

                                    @if(!empty($festivalDetails->daily_significance))
                                    <div class="mb-5">
                                        <label class="font-weight-bold">Daily Significance:</label>
                                        <div class="bg-light p-5 rounded">
                                            {!! $festivalDetails->daily_significance !!}
                                        </div>
                                    </div>
                                    @endif

                                    @if(!empty($festivalDetails->temples_to_visit))
                                    <div class="mb-5">
                                        <label class="font-weight-bold">Temples to Visit:</label>
                                        <div class="bg-light p-5 rounded">
                                            {!! $festivalDetails->temples_to_visit !!}
                                        </div>
                                    </div>
                                    @endif

                                    @if(!empty($festivalDetails->other_info))
                                    <div class="mb-5">
                                        <label class="font-weight-bold">Other Information:</label>
                                        <div class="bg-light p-5 rounded">
                                            {!! $festivalDetails->other_info !!}
                                        </div>
                                    </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="row">
                        <div class="col-12">
                            <a href="{{ route($model.'.index') }}" class="btn btn-secondary">Back to List</a>
                            <a href="{{ route($model.'.edit', base64_encode($festivalDetails->id)) }}" class="btn btn-primary ml-2">Edit Festival</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@stop